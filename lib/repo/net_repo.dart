import 'package:ask_titmouse/const/urls.dart';
import 'package:ask_titmouse/entity/resource.dart';
import 'package:dio/dio.dart';

class NetRepo {
  final Dio dio;

  NetRepo({required this.dio});

  Future<List<Resource>> getResources() async {
    final res = await dio.get(Urls.resourcesUrl);
    final array = res.data as List<dynamic>;
    return array.map((el) => Resource.fromMap(el)).toList();
  }

  Future<bool> restartModel() async {
    final res = await dio.patch(Urls.restartUrl);
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> createResource(Resource resource) async {
    final res = await dio.post(Urls.resourceUrl, data: resource.toJson());
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> updateResource(Resource resource) async {
    final res = await dio.patch(Urls.resourceUrl, data: resource.toJson());
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> deleteResource(Resource resource) async {
    final res = await dio.delete(Urls.resourceUrl, data: resource.toJson());
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }
}

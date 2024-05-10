import 'package:ask_titmouse/const/urls.dart';
import 'package:ask_titmouse/entity/resource.dart';
import 'package:dio/dio.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class NetRepo {
  final Dio dio;
  late final WebSocketChannel channel;

  Stream<dynamic> get chatStream => channel.stream;

  NetRepo({required this.dio}) {
    channel = WebSocketChannel.connect(Uri.parse(Urls.wsUrl));
  }

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

  void sendMessage(String message) => channel.sink.add(message);
}

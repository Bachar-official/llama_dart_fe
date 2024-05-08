import 'dart:convert';

import 'package:ask_titmouse/const/urls.dart';
import 'package:dio/dio.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class NetRepo {
  late final Dio _dio;
  late final String sessionHash;
  NetRepo() {
    _dio = Dio();
    sessionHash = DateTime.now().hashCode.toString();
  }

  Future<void> ask(String text) async {
      await _dio.post(
        Urls.predictUrl,
        data: {
          'data': [
            text,
            [],
            'Ты - Синичка, русскоязычный ассистент. Ты помогаешь сотрудникам компании Cinimex находить ссылки на ресурсы компании.'
          ],
          'event_data': null,
          'fn_index': 5,
          'sessionHash': sessionHash
        }
      );
  }

  Future<void> joinQueue() async {
    final channel = WebSocketChannel.connect(Uri.parse(Urls.queueUrl));

    channel.stream.listen((event) {
      print(event);
      if (event.toString() == '{"msg":"send_hash"}') {
        channel.sink.add(jsonEncode({"fn_index": 6, "sessionHash": sessionHash}));
      }
    });
  }
}


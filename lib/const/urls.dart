class Urls {
  static const baseUrl = 'http://localhost:7860';
  static const baseWsUrl = 'ws://localhost:7860';
  static const uploadUrl = '$baseUrl/upload';
  static const predictUrl = '$baseUrl/run/predict';
  static const queueUrl = '$baseWsUrl/queue/join';
}
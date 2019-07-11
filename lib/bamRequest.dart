import 'dart:async';
import 'package:http/http.dart' as http;

class BamRequest {

  BamRequest() {
    Timer.periodic(Duration(seconds: 1), (t) async {
      final startTime = DateTime.now();
      final response = await http.get('https://jsonplaceholder.typicode.com/todos/1'); //await http.get('https://google.com');
      final endTime = DateTime.now();
      final report = BamReport(endTime.difference(startTime), response.statusCode);
      _controller.sink.add(report);
    });
  }

  void closeStream() {
    _controller.close();
  }

  final _controller = StreamController<BamReport>();

  Stream<BamReport> get stream => _controller.stream;
}

class BamReport {
  Duration _latency;
  int _status;

  BamReport(this._latency, this._status);

  Duration get latency => _latency;
  int get status => _status;

  @override
  String toString() {
    return "Request: Latency ${_latency.inMilliseconds}ms, Status: $_status";
  }
}
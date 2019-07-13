import 'dart:io';

import 'package:bambam/bamRequest.dart';

main(List<String> arguments) async {
  final bamReportList = List<BamReport>();

  final bamRequestList = List.generate(5, (index) {
    return BamRequest();
  });

  bamRequestList.map((request) => request.stream).forEach((stream) {
    stream.listen(
      (data){
      bamReportList.add(data);
    },
    onError: (err) {
      print('Error: $err');
    },
      cancelOnError: false
    );
  });


  Future.delayed(Duration(seconds: 20), () {
    bamRequestList.map((request) => request.closeStream());
    generateReport(bamReportList);
    exit(0);
  });
}

generateReport(List<BamReport> reportList) {
  var avgLatency = reportList.map((report) => report.latency.inMilliseconds).reduce((report1, report2) => report1 + report2) / reportList.length;
  print("""
  ----------------------------------------
  Performance Report
  Average Latency: ${avgLatency.toStringAsFixed(2)} ms
  # of request: ${reportList.length}
  """);
}

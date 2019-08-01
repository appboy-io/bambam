import 'dart:io';

import 'package:args/args.dart';

class CommandLineParser {
  static final CommandLineParser _singleton = new CommandLineParser._internal();
  final parser = new ArgParser();

  factory CommandLineParser() {
    return _singleton;
  }

  CommandLineParser._internal() {
      parser
      ..addOption('duration', abbr: 'd', help: 'In seconds, how long should the performance test run')
      ..addOption('users', abbr: 'u', help: 'The amount of concurrent users to run load testing with')
      ..addOption('url', abbr: 'w', help: 'Provided url to load test against. If not provided, will load test against Google');
  }

  ArgResults parseArgs(List<String> arguments) {
    ArgResults argResults = parser.parse(arguments);
    _checkPassedArguments(argResults);
    return argResults;
  }

  void _checkPassedArguments(ArgResults args) {
    if(args.options.length < 2) {
      print("Too few arguments passed.\nAt minimum 2 arguments must be passed.\nA standard run requires -d, and -u options");
      print(parser.usage);
      exit(1);
    }

    if(!args.wasParsed('duration')) {
      print("Duration -d, is a required option.");
      exit(1);
    }

    if(!args.wasParsed('users')) {
      print("Users -u, is a required option.");
      print(parser.usage);
      exit(1);
    }
  }
}

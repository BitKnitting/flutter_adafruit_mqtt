// import 'package:logging/logging.dart';
// import 'package:stack_trace/stack_trace.dart';
// import 'dart:io' show Platform;
// //
// // This is added to route the logging info - which includes which file and where in the file
// // the message came from.
// //

// void initLogger() {
//   Logger.root.level = Level.ALL;
//   Logger.root.onRecord.listen((LogRecord rec) {
//     final List<Frame> frames = Trace.current().frames;

//     final Frame f = frames.skip(0).firstWhere((Frame f) =>
//         f.library.toLowerCase().contains(rec.loggerName.toLowerCase()) &&
//         f != frames.first);
//     print(
//         '${rec.level.name}: ${f.member} (${rec.loggerName}:${f.line}): ${rec.message}');
//   });
// }

// void main() {
//   Logger log;
//   // initLogger() goes in main()
//   initLogger();
//   // getting a Logger instance and passing in the script name goes into each file.
//   //Logger.root.level = Level.INFO;
//   String scriptName = Platform.script.toFilePath().split('/').last;
//   log = Logger(scriptName);
//   log.warning('this is a warning');
// }

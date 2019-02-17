import 'dart:async';
import 'package:logging/logging.dart';

class AdafruitFeed {
  //
  // Both the StreamController and Stream are defined as static.  This
  // means they both belong to the class and not to an instance.
  // It was my way of getting to what I was used to via Singleton
  // functionality in some other languages.
  //
  // A Stream controller alerts the stream when new data is available.
  // The controller should be private.
  static var _feedController = StreamController<String>();
  // Expose the stream so a StreamBuilder and use it.
  static Stream<String> get sensorStream => _feedController.stream;
//
// TODO: add takes in a string, but forces the feed to be an int
  static void add(String value) {
    Logger log = Logger('Adafruit_feed.dart');
    try {
      _feedController.add(value);
      log.info('---> added value to the Stream... the value is: $value');
    } catch (e) {
      log.severe(
          '$value was published to the feed.  Error adding to the Stream: $e');
    }
  }
}

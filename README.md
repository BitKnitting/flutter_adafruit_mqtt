# flutter_adafruit_mqtt

## Goal
The goal of this project is to understand how to "do this in flutter":
- subscribe and publish to AdafruitIO
- log events similar/closest to the rich logging I enjoy in Python
## Non Goal
__There is no error checking.__  My intent was to learn more like a conversation in which we learn how something works, but we stop short of studying so completely that we address all the "what ifs."
## Thanks to Those that Went Before  
- shamblett for his [mqtt_client dart package](https://pub.dartlang.org/packages/mqtt_client) and [mqtt_client GitHub](https://github.com/shamblett/mqtt_client).  Thank you for your well documented and so far robust code.  Thank you for being very responsive and supportive answer questions that I had.  Even when the questions clearly showed how clueless I am.  
- abachman (Adam B.) for his clear answers to questions on the [Adafruit.io forum](https://forums.adafruit.com/viewforum.php?f=56).  Thank you for the persistance and final nudge to help me realize the client id is not the username...um...sure obvious to the rest of you!
- Adafruit for not only Adafruit.IO but the quality customer and community experience.  You inspire me to ask myself _"How hard can it be?"_ and answer with _"As hard as I make it."_ And most times I figure it out.
- the [logging dart package](https://pub.dartlang.org/packages/logging).  While I don't understand everything going on in the code, I was delighted with how easy it was to customize log messages to include stack trace information.
# Code Highlights
## Connecting to Adafruit IO
I'm assuming you have familiarity with Adafruit IO.  You've subscribed and published to a feed.  There is three pieces of information you need to have on hand when connecting to Adafruit.io:
- the broker name.  This is ```io.adafruit.com```
- your username.  This is your adafruit.com username.
- your AIO key.  This is a secret key generated for your Adafruit IO transactions.  You find this within the Adafruit IO web interface.

I put this info into a config/private.json file.  Here's a screenshot of where the file goes within the project:  
![Navigation screen](https://github.com/BitKnitting/flutter_adafruit_mqtt/blob/master/imgs/Navigation_screenshot.png)
## Logging
- [main.dart]() Obviously the entry point.  Here is where I initialize how the log messages will print out.  
```
final Frame f = frames.skip(0).firstWhere((Frame f) =>
    f.library.toLowerCase().contains(rec.loggerName.toLowerCase()) &&
    f != frames.first);
```     
in this line of code, we're sifting through the stack frames, pulling out the one that contains the name of the dart file where the log message came from.  Once we have this glorious piece of info, we can send it to an output stream (in this case, our debug console):  
```
print('${rec.level.name}: ${f.member} (${rec.loggerName}:${f.line}): ${rec.message}');    
```
For example, I set up logging in the mqtt_stream.dart file:
```
log = Logger('mqtt_stream.dart');
```
_(Sadly, i couldn't find a similar library to Python's to get the name of the file the code is currently running)_
Then in the code I have on line 167 of mqtt_stream.dart:  
```
log.info('Adafruit client connected');
```
when the app runs past this line, the debug console prints out:
```
flutter: INFO: AppMqttTransactions._login (mqtt_stream.dart:167): Adafruit client connected
```
_Note: The mqtt_client library has its own logging that currently is turned off.  This can be toggled on or off by:  
```
client.logging(on: true);
```
which I put in the _login() function within mqtt_stream.dart.




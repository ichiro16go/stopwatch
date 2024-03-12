import 'dart:io';

String formatTime(int milli) {
  int minutes = (milli ~/ 60000) % 60;
  int seconds = (milli ~/ 1000) % 60;
  int millisecondsRemaining = milli % 1000;
  return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}.${(millisecondsRemaining ~/ 10).toString().padLeft(2, '0')}';
}

DateTime Start() {
  print('start!!');
  return DateTime.now();
}

void Stop(DateTime startTime) {
  print('$startTime');
  DateTime nowTime = DateTime.now();
  print('$nowTime');
  int milli = nowTime.difference(startTime).inMilliseconds;
  print('$milli');
  String now = formatTime(milli);
  print('stoped time...$now');
}



void main() {
  DateTime startTime = DateTime(0, 0, 0, 0, 0);
  List<Duration> lapTimes = [];
  bool running = false;
  while (true) {
    print('start:1\nstop:2\ntap:3');
    String choice = stdin.readLineSync() ?? '';
    switch (choice) {
      case '1':
        startTime = Start();
        break;
      case '2':
        Stop(startTime);
        exit(0);
    }
  }
}

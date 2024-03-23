import 'dart:io';

void printTime(int milli) {
  final minutes = (milli ~/ 60000) % 60;
  final seconds = (milli ~/ 1000) % 60;
  final millisecondsRemaining = milli % 1000;
  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = seconds.toString().padLeft(2, '0');
  String millsecondsStr =
      (millisecondsRemaining ~/ 10).toString().padLeft(2, '0');
  print('$minutesStr分$secondsStr.$millsecondsStr秒');
}

DateTime start(DateTime startTime, bool running) {
  if (running == false) {
    print('start!!');
    return DateTime.now();
  } else {
    print('stopwatch is already running');
    return startTime;
  }
}

int stop(DateTime startTime, bool running, int pastTime) {
  if (running == true) {
    print('stop!!\n');
    final nowTime = DateTime.now();
    final mill = nowTime.difference(startTime).inMilliseconds;
    int milli = pastTime + mill;
    print('$nowTime - $startTime + $pastTime');
    printTime(milli);
    return milli;
  } else {
    print('stopwatch isn`t running');
    return 0;
  }
}

int resetTime() {
  print('reset!!');
  return 0;
}

void runningStopwatch(DateTime startTime, bool running, int pastTime) {
  while (true) {
    print('start/restart:1\nstop:2\nreset:3\nfinish:4');
    final choice = stdin.readLineSync() ?? '';
    switch (choice) {
      case '1':
        startTime = start(startTime, running);
        if (running == false) {
          running = true;
        }
        break;
      case '2':
        pastTime = stop(startTime, running, pastTime);
        if (running == true) {
          running = false;
        }
      case '3':
        running = false;
        pastTime = resetTime();
      case '4':
        exit(0);
    }
  }
}

void main() {
  bool running = false;
  DateTime startTime = DateTime(0, 0, 0, 0, 0);
  int pastTime = 0;
  runningStopwatch(startTime, running, pastTime);
}

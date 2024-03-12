import 'dart:io';

void StartAndStop(Stopwatch stopwatch) {
  if (!stopwatch.isRunning) {
    stopwatch.start();
    print('スタートしました');
  } else {
    stopwatch.stop();
    print('ストップしました');
  }
}

void Reset(Stopwatch stopwatch, List<Duration> laps) {
  if (stopwatch.isRunning) {
    stopwatch.stop();
  }
  stopwatch.reset();
  laps.clear();
  print('リセットしました');
}

void Lap(
    Stopwatch stopwatch, List<Duration> laps, int count, Duration lastLapTime) {
  if (stopwatch.isRunning) {
    Duration lapTime = stopwatch.elapsed - lastLapTime;
    laps.add(lapTime);
    lastLapTime = stopwatch.elapsed;
    count++;
    print('ラップ$count: $lapTime');
  }
}

void main() {
  Stopwatch stopwatch = Stopwatch()..start();
  List<Duration> laps = [];
  Duration lastLapTime = Duration.zero;
  int count = 0;
  while (true) {
    print('Time: ${stopwatch.elapsed}');

    print('1. Start/Stop\n2. Reset\n3. Lap\n4. Exit');

    String choice = stdin.readLineSync() ?? '';

    switch (choice) {
      case '1':
        StartAndStop(stopwatch);
        break;
      case '2':
        Reset(stopwatch, laps);
        break;
      case '3':
        // if (stopwatch.isRunning) {
        //   Duration lapTime = stopwatch.elapsed - lastLapTime;
        //   laps.add(lapTime);
        //   lastLapTime = stopwatch.elapsed;
        //   count++;
        //   print('ラップ$count: $lapTime');
        // }
        Lap(stopwatch, laps, count, lastLapTime);
        break;
      case '4':
        print('ストップウオッチをとじる');
        exit(0);
      default:
        print('存在しないコマンド');
    }
  }
}

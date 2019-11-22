import 'dart:async';
import 'dart:isolate';

Isolate isolate;

void main() => start();

void start() async {
  //port for this main isolate to receive messages.
  ReceivePort receivePort = ReceivePort();
  isolate = await Isolate.spawn(runTimer, receivePort.sendPort);
  receivePort.listen((data) {
    print('RECEIVE: $data  ');
    if (data == 2) {
      stop();
//      receivePort.close();
    }
  });
}

void runTimer(SendPort sendPort) {
  int counter = 0;
  Timer.periodic(new Duration(seconds: 1), (Timer t) {
    sendPort.send(counter++);
  });
}

void stop() {
  if (isolate != null) {
    print('killing isolate');
    isolate.kill(priority: Isolate.immediate);
    isolate = null;
    print('killed');
  }
}

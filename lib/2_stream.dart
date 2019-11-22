Stream<int> getNumbers() =>
    Stream.periodic(Duration(milliseconds: 500), (v) => v);

void main() {
  void callSimpleSteam() {
    getNumbers().listen(
      (value) => print(value),
      onDone: () => print('Complete'),
      onError: (e) => print('Printing error => $e'),
      cancelOnError: true,
    );
  }

  callSimpleSteam();

  void callSteam() {
    final stream = getNumbers();
    final streamSubscription = stream.listen(
      (value) => print(value), // TODO take a look! -> will be skipped :)
      onDone: () => print('Complete'),
      onError: (e) => print('Printing error => $e'),
    );

    streamSubscription.onData((number) {
      if (number == 3) {
        streamSubscription.cancel();
      } else {
        print(number);
      }
    });
  }

  callSteam();
}

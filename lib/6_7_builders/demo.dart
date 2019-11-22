import 'dart:async';

class Demo {
  String title;

  Demo._({
    this.title = 'title :)',
  });

  factory Demo.first() {
    return Demo._(title: "Title 1");
  }

  factory Demo.second() {
    return Demo._(title: "Title 2");
  }

  factory Demo.third() {
    return Demo._(title: "Title 3");
  }

  factory Demo.fours() {
    return Demo._(title: "Title 4");
  }
}

Stream<Demo> getMockDataList() async* {
  final stream = Stream.fromIterable(
    List.of([
      Demo.first(),
      Demo.second(),
      Demo.third(),
      Demo.fours(),
      Demo.first(),
      Demo.second(),
      Demo.third(),
      Demo.fours(),
    ]),
  );
  await for (Demo demo in stream) {
    await Future.delayed(Duration(milliseconds: 500));
    yield demo;
  }
}

getMockData() => Future.delayed(
      Duration(seconds: 1),
      () => Demo.first(),
    );

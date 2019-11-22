const CAPACITY = 10;

void main() async => asynchronousNaturalsTo(CAPACITY).listen(printMe);

Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) {
    await Future.delayed(Duration(milliseconds: 300));
    yield k++;
  }
}

void printMe(value) => print("Element #$value");

typedef NumFunction = num Function(num i);

NumFunction makeAdder(num addBy) {
  return (num i) => addBy + i;
}

void main() {
  // Create a function that adds 2.
  var add2 = makeAdder(2);
  doSmth(add2);
}

void doSmth(NumFunction f) {
  print(f(2));
}

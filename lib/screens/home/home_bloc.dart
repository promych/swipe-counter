import 'dart:async';

abstract class CounterBloc {
  int get counter;
  Stream<int> get $counter;
  void increase();
  void decrease();
  void dispose();
}

class HomeBloc implements CounterBloc {
  int _counter = 0;
  @override
  int get counter => _counter;

  final _counterController = StreamController<int>.broadcast();
  @override
  Stream<int> get $counter => _counterController.stream;

  void load() {
    _counterController.sink.add(_counter);
  }

  @override
  dispose() {
    _counterController.close();
  }

  @override
  void decrease() {
    _counter--;
    _counterController.sink.add(_counter);
  }

  @override
  void increase() {
    _counter++;
    _counterController.sink.add(_counter);
  }
}

import 'dart:async';

import '../../constants.dart';
import '../../data/local_storage.dart';

abstract class CounterBloc {
  int get counter;
  Stream<int> get $counter;
  void increase();
  void decrease();
  void reset();
  void dispose();
}

class HomeBloc implements CounterBloc {
  CounterRepo _repository;
  int _counter;

  @override
  int get counter => _counter;

  final _counterController = StreamController<int>.broadcast();
  @override
  Stream<int> get $counter => _counterController.stream;

  Future<int> get savedValue async {
    _repository = LocalStorage();
    return await _repository.value;
  }

  void load() async {
    await savedValue.then((value) {
      _counter = value;
      _counterController.sink.add(_counter);
    });
  }

  @override
  dispose() {
    _counterController.close();
  }

  @override
  void decrease() async {
    _counter--;
    _counterController.sink.add(_counter);
    await _repository.saveValue(_counter);
  }

  @override
  void increase() async {
    _counter++;
    _counterController.sink.add(_counter);
    await _repository.saveValue(_counter);
  }

  void reset() async {
    _counter = kDefaultCounterValue;
    _counterController.sink.add(_counter);
    await _repository.saveValue(_counter);
  }
}

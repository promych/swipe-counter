import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../constants.dart';
import '../../data/local_storage.dart';

abstract class CounterBloc {
  int get counter;
  Stream<int> get $counter;
  void load();
  void increase();
  void decrease();
  void reset();
  void dispose();
}

class HomeBloc implements CounterBloc {
  final CounterRepo repo;

  HomeBloc({@required this.repo});

  int _counter;
  @override
  int get counter => _counter;

  final _counterController = StreamController<int>.broadcast();
  @override
  Stream<int> get $counter => _counterController.stream;

  @override
  Future<void> load() async {
    await repo.value.then((value) {
      _counter = value;
      _counterController.sink.add(_counter);
    });
  }

  @override
  void dispose() {
    _counterController.close();
  }

  @override
  Future<void> decrease() async {
    _counter--;
    _counterController.sink.add(_counter);
    await repo.saveValue(_counter);
  }

  @override
  Future<void> increase() async {
    _counter++;
    _counterController.sink.add(_counter);
    await repo.saveValue(_counter);
  }

  @override
  Future<void> reset() async {
    _counter = kDefaultCounterValue;
    _counterController.sink.add(_counter);
    await repo.saveValue(_counter);
  }
}

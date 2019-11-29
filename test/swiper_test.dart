import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:swipe_counter/data/local_storage.dart';
import 'package:swipe_counter/screens/home/home_bloc.dart';
import 'package:swipe_counter/screens/home/ui/swiper.dart';

class MockRepo extends Mock implements CounterRepo {}

void main() {
  MockRepo mockRepo;
  CounterBloc counterBloc;

  setUp(() {
    mockRepo = MockRepo();
    counterBloc = HomeBloc(repo: mockRepo);
  });

  tearDown(() {
    counterBloc.dispose();
  });

  Future<void> pumpSwiper(WidgetTester tester) async {
    await tester.pumpWidget(
      Provider<CounterBloc>(
        create: (_) => counterBloc..load(),
        child: MaterialApp(
          home: Swiper(
            constraints: BoxConstraints(
              maxHeight: 200.0,
              maxWidth: 200.0,
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  void stubRepo() {
    when(mockRepo.value).thenAnswer((_) => Future.microtask(() => 0));
  }

  testWidgets('swipe card', (WidgetTester tester) async {
    stubRepo();
    await pumpSwiper(tester);
    expect(find.text('0'), findsOneWidget);

    await tester.drag(find.byType(Draggable), Offset(-50.0, 0.0));
    await tester.pumpAndSettle();
    expect(find.text('0'), findsOneWidget);

    await tester.drag(find.byType(Draggable), Offset(-100.0, 0.0));
    await tester.pumpAndSettle();
    expect(find.text('-1'), findsOneWidget);
  });
}

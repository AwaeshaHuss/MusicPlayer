import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('onCreate -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint(
        'onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError -- bloc: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('onClose -- bloc: ${bloc.runtimeType}');
  }
}

/*

This is a custom implementation of a `BlocObserver` class in Flutter. `Bloc` is a state management library in Flutter that helps manage the flow of data and state within an application.

1. The `MyBlocObserver` class extends the `BlocObserver` class, which allows you to observe and react to various events that occur within `Bloc` instances.

2. The `onCreate` method is called when a new `Bloc` is created. It prints a debug message indicating the type of the created `Bloc`.

3. The `onEvent` method is called when an event is added to a `Bloc`. It prints a debug message indicating the type of the `Bloc` and the event that was added.

4. The `onChange` method is called when a `Bloc` transitions from one state to another. It prints a debug message indicating the type of the `Bloc` and the change that occurred.

5. The `onTransition` method is called when a `Bloc` transitions from one state to another. It prints a debug message indicating the type of the `Bloc` and the transition that occurred.

6. The `onError` method is called when an error occurs in a `Bloc`. It prints a debug message indicating the type of the `Bloc` and the error that occurred.

7. The `onClose` method is called when a `Bloc` is closed or disposed of. It prints a debug message indicating the type of the `Bloc`.

By implementing this `MyBlocObserver` class and registering it as the default `BlocObserver` in your Flutter application, you can observe and log the lifecycle events of your `Bloc` instances for debugging and monitoring purposes.

*/
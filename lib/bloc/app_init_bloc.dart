import 'package:flutter_bloc_movies/bloc/bloc_helpers/bloc_event_state.dart';

class AppInitBloc extends BlocEventStateBase<AppInitEvent, AppInitState> {
  AppInitBloc() : super(initialState: AppInitState.notInitialized());

  @override
  Stream<AppInitState> eventHandler(
      AppInitEvent event, AppInitState currentState) async* {
    // TODO: implement eventHandler

    if (!currentState.isInitialized) {
      yield AppInitState.notInitialized();
    }

    if (event.type == AppInitType.start) {
      for (int progress = 0; progress < 101; progress += 10) {
        await Future.delayed(const Duration(milliseconds: 300));
        yield AppInitState.progressing(progress);
      }
    }

    if (event.type == AppInitType.stop) {
      yield AppInitState.initialized();
    }
  }
}

class AppInitEvent extends BlocEvent {
  final AppInitType type;

  AppInitEvent({
    this.type = AppInitType.start,
  });
}

enum AppInitType {
  start,
  stop,
}

class AppInitState extends BlocState {
  AppInitState({
    required this.isInitialized,
    this.isInitializing = false,
    this.progress = 0,
  });

  final bool isInitialized;
  final bool isInitializing;
  final int progress;

  factory AppInitState.notInitialized() {
    return AppInitState(isInitialized: false);
  }

  factory AppInitState.progressing(int progress) {
    return AppInitState(
      isInitialized: progress == 100,
      isInitializing: true,
      progress: progress,
    );
  }

  factory AppInitState.initialized() {
    return AppInitState(
      isInitialized: true,
      progress: 100,
    );
  }
}

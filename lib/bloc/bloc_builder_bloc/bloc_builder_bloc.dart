import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:unclean_app/bloc/bloc_builder_bloc/bloc_builder_event.dart';
import 'package:unclean_app/bloc/bloc_builder_bloc/bloc_builder_state.dart';

class BlocBuilderBloc extends Bloc<BlocBuilderEvent, BlocBuilderState> {
  BlocBuilderBloc(BlocBuilderState initialState) : super(initialState) {
    on<InitBlocBuilder>(_loadBloc);
    on<ResetBlocBuilder>(_resetBloc);
  }

  Future<void> _loadBloc(
    BlocBuilderEvent event,
    Emitter<BlocBuilderState> emit,
  ) async {
    emit(InBlocBuilderState('hello'));
  }

  Future<void> _resetBloc(
    BlocBuilderEvent event,
    Emitter<BlocBuilderState> emit,
  ) async {
    emit(InBlocBuilderState('reset'));
  }
}

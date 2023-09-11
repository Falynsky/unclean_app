import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BlocBuilderState extends Equatable {
  final int counter;
  final bool isTimerActive;
  const BlocBuilderState(this.counter, this.isTimerActive, {Key? key});

//copyWith
  BlocBuilderState copyWith({
    int? counter,
    bool? isTimerActive,
  }) {
    return BlocBuilderState(
      counter ?? this.counter,
      isTimerActive ?? this.isTimerActive,
      key: UniqueKey()
    );
  }

  @override
  List<Object> get props => [counter, isTimerActive, UniqueKey()];
}

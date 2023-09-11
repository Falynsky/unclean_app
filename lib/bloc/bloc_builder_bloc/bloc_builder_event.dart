import 'package:equatable/equatable.dart';

abstract class BlocBuilderEvent extends Equatable {
  const BlocBuilderEvent();

  @override
  List<Object> get props => [];
}

class InitBlocBuilder extends BlocBuilderEvent {}
class ResetBlocBuilder extends BlocBuilderEvent {}
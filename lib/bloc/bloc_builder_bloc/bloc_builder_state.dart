import 'package:equatable/equatable.dart';

abstract class BlocBuilderState extends Equatable {
  BlocBuilderState();

  @override
  List<Object> get props => [];
}

class InBlocBuilderState extends BlocBuilderState {
  InBlocBuilderState(this.hello);
  
  final String hello;

  @override
  String toString() => 'InBlocBuilderState $hello';

  @override
  List<Object> get props => [hello];
}

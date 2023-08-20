import 'package:equatable/equatable.dart';

abstract class TransactionsEvent extends Equatable {
  const TransactionsEvent();

  @override
  List<Object> get props => [];
}

class LoadTransactionsEvent extends TransactionsEvent {}

class LoadMoreTransactionsEvent extends TransactionsEvent {}
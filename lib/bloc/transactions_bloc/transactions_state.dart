import 'package:equatable/equatable.dart';
import 'package:unclean_app/configs/transaction.dart';

abstract class TransactionsState extends Equatable {
  const TransactionsState();

  @override
  List<Object> get props => [];
}

class TransactionsInitial extends TransactionsState {}

class TransactionsLoadedState extends TransactionsState {
  final List<Transaction> transactions;
  final int currentMax;

  const TransactionsLoadedState({
    required this.transactions,
    required this.currentMax,
  });

  @override
  List<Object> get props => [transactions, currentMax];
}

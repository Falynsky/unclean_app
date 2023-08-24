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

  const TransactionsLoadedState({
    required this.transactions,
  });

  @override
  List<Object> get props => [transactions];
}

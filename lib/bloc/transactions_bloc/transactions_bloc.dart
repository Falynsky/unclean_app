import 'package:chopper/chopper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:unclean_app/bloc/transactions_bloc/transactions_event.dart';
import 'package:unclean_app/bloc/transactions_bloc/transactions_state.dart';
import 'package:unclean_app/configs/transaction.dart';
import 'package:unclean_app/http/services/transactions/transaction_service.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(TransactionsInitial()) {
    on<LoadTransactionsEvent>(_loadTransactions);
  }

  Future<void> _loadTransactions(
    TransactionsEvent event,
    Emitter<TransactionsState> emit,
  ) async {
    {
      final TransactionService transactionService = GetIt.I<ChopperClient>().getService<TransactionService>();
      final Response<dynamic> response = await transactionService.fetchTransactions();
      final body = response.body;
      final List<Map<String, dynamic>> parsedBody = List<Map<String, dynamic>>.from(body);
      List<Transaction> transactions = parsedBody.map(Transaction.fromJson).toList();
      emit(TransactionsLoadedState(transactions: transactions));
    }
  }
}

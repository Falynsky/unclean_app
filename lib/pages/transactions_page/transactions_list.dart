import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclean_app/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:unclean_app/configs/transaction.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:unclean_app/enums/navigation_screens_enum.dart';
import 'package:unclean_app/pages/transactions_page/transaction_card.dart';

class TransactionsList extends StatefulWidget {
  final ScrollController scrollController;
  const TransactionsList({required this.scrollController, Key? key}) : super(key: key);

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  late NavigationCubit navigationCubit;
  late final TransactionsBloc transactionsBloc;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = widget.scrollController;
    navigationCubit = context.read<NavigationCubit>();
    transactionsBloc = context.read<TransactionsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () => navigationCubit.navigate(NavigationScreens.home),
            child: const Text('Loaded transactions'),
          ),
          Expanded(
            child: ListView(
              controller: scrollController,
              children: transactionsBloc.transactions.map((Transaction transaction) {
                return Container(
                  child: TransactionCard(
                    transaction: transaction,
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

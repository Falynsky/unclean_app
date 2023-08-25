import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclean_app/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:unclean_app/bloc/transactions_bloc/transactions_event.dart';
import 'package:unclean_app/bloc/transactions_bloc/transactions_state.dart';
import 'package:unclean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:unclean_app/enums/navigation_screens_enum.dart';
import 'package:unclean_app/pages/transactions_page/transaction_card.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  late NavigationCubit navigationCubit;
  late final TransactionsBloc transactionsBloc;
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    navigationCubit = context.read<NavigationCubit>();
    transactionsBloc = TransactionsBloc();
  }

  @override
  Widget build(BuildContext context) {
    final StopwatchUtils stopwatchUtils = StopwatchUtils();
    stopwatchUtils..start();
    final Widget widget = WillPopScope(
      onWillPop: onWillPop,
      child: BlocBuilder<TransactionsBloc, TransactionsState>(
        bloc: transactionsBloc,
        builder: (BuildContext context, TransactionsState state) {
          if (state is TransactionsInitial) {
            transactionsBloc.add(LoadTransactionsEvent());
          } else if (state is TransactionsLoadedState) {
            return Container(
              child: Column(
                children: [
                  InkWell(
                    onTap: () => navigationCubit.navigate(NavigationScreens.home),
                    child: const Text('Loaded transactions'),
                  ),
                  Expanded(
                    // child: ListView.builder(
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return TransactionCard(transaction: state.transactions[index]);
                    //   },
                    // ),
                    child: ListView(
                      children: state.transactions.map((transaction) {
                        return Container(child: TransactionCard(transaction: transaction));
                      }).toList(),
                    ),
                  )
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
    stopwatchUtils..stop();
    return widget;
  }

  Future<bool> onWillPop() async {
    navigationCubit.navigate(NavigationScreens.home);
    return false;
  }
}

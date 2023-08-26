import 'package:flutter/material.dart';
import 'package:unclean_app/configs/transaction.dart';
import 'package:unclean_app/dialogs/transaction_preview.dart';
import 'package:unclean_app/utils/stopwatch_utils.dart';

class TransactionCard extends StatefulWidget {
  final Transaction transaction;

  const TransactionCard({Key? key, required this.transaction}) : super(key: key);

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  late final Transaction transaction;
  @override
  void initState() {
    super.initState();
    transaction = widget.transaction;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final StopwatchUtils stopwatchUtils = StopwatchUtils();
        stopwatchUtils.start();
        Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              final TransactionPreview transactionPreview = TransactionPreview(transaction: transaction);
              stopwatchUtils.stop();
              return transactionPreview;
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SizedBox(width: 38, height: 38),
                ),
                SizedBox(width: 10), // 16 is the default padding for ListTile
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${widget.transaction.name}'),
                  ],
                ),
              ],
            ),
            Text('${widget.transaction.amount} pln')
          ],
        ),
      ),
    );
  }
}

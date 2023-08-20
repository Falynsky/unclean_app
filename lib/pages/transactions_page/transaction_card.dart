import 'package:flutter/material.dart';
import 'package:unclean_app/configs/transaction.dart';

class TransactionCard extends StatefulWidget {
  final Transaction transaction;

  const TransactionCard({Key? key, required this.transaction}) : super(key: key);

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Id: ${widget.transaction.id}'),
          Text('Title: ${widget.transaction.name}'),
          Text('Amount: ${widget.transaction.amount}'),
        ],
      ),
    );
  }
}
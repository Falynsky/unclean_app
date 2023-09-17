import 'package:flutter/material.dart';
import 'package:unclean_app/configs/transaction.dart';

class ListViewCard extends StatefulWidget {
  final Transaction transaction;

  const ListViewCard({required this.transaction, Key? key}) : super(key: key);

  @override
  State<ListViewCard> createState() => _ListViewCardState();
}

class _ListViewCardState extends State<ListViewCard> {
  late final Transaction transaction;
  @override
  void initState() {
    super.initState();
    transaction = widget.transaction;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const SizedBox(
                  width: 38,
                  height: 38,
                ),
              ),
              const SizedBox(width: 10), // 16 is the default padding for ListTile
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${widget.transaction.name}'),
                  const SizedBox(height: 5),
                  Text(
                    '${widget.transaction.dateTime}',
                    style: const TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            '${widget.transaction.amount} pln',
            style: TextStyle(
              color: widget.transaction.amount > 0 ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final int id;
  final String name;
  final double amount;
  final String dateTime;
  final String transactionInfo;
  final int userId;

  const Transaction({
    required this.id,
    required this.name,
    required this.amount,
    required this.dateTime,
    required this.transactionInfo,
    required this.userId,
  });

 factory Transaction.fromJson(Map<String, Object?> json) {
  return Transaction(
    id: json['id'] as int,
    name: json['name'] as String,
    amount: json['amount'] as double,
    dateTime: json['dateTime'] as String,
    transactionInfo: json['transactionInfo'] as String,
    userId: json['userId'] as int,
  );
}

  @override
  List<Object?> get props => [id, name, amount, transactionInfo, userId];
}
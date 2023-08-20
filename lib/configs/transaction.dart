import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final int id;
  final String name;
  final double amount;
  final String transactionInfo;
  final int documentId;

  const Transaction({
    required this.id,
    required this.name,
    required this.amount,
    required this.transactionInfo,
    required this.documentId,
  });

 factory Transaction.fromJson(Map<String, Object?> json) {
  return Transaction(
    id: json['id'] as int,
    name: json['name'] as String,
    amount: json['amount'] as double,
    transactionInfo: json['transactionInfo'] as String,
    documentId: json['documentId'] as int,
  );
}

  @override
  List<Object?> get props => [id, name, amount, transactionInfo, documentId];
}
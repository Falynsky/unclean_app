import 'package:chopper/chopper.dart';

part 'transaction_service.chopper.dart';

@ChopperApi(baseUrl: '/transactions')
abstract class TransactionService extends ChopperService {
  static TransactionService create([ChopperClient? client]) => _$TransactionService(client);

  @Get(path: '/all')
  Future<Response<dynamic>> fetchTransactions();

}


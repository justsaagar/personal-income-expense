import 'package:untitled/serialized/transaction_model.dart';

abstract class UtillsRepository {
  Future<Map<String, dynamic>?>? getUtillsData(String collectionName);
  Future<bool> addTransactionData(TransactionModel transactionModel);
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal_income_expense/app/constant/string_constant.dart';
import 'package:personal_income_expense/app/helper/extension_helper.dart';
import 'package:personal_income_expense/repository/utills/utills_repository.dart';
import 'package:personal_income_expense/serialized/transaction_model.dart';

class UtillsRepositoryImpl extends UtillsRepository {
  CollectionReference transactionCollection = FirebaseFirestore.instance.collection(AppCollectionConstants.transaction);

  @override
  Future<Map<String, dynamic>?>? getUtillsData(String collectionName) async {
    try {
      final DocumentSnapshot snapshot = await transactionCollection.doc(collectionName).get();
      if (snapshot.exists && snapshot.data() != null) {
        return snapshot.data()! as Map<String, dynamic>;
      }
    } on FirebaseException catch (e) {
      'Catch FirebaseException in getUserData --> ${e.message}'.errorLogs();
      e.message?.showError();
    }
    return null;
  }

  @override
  Future<bool> addTransactionData(TransactionModel transactionModel) async {
    try {
      await transactionCollection.doc(transactionModel.transactionId).set(transactionModel.toJson());
      return true;
    } on FirebaseException catch (e) {
      'Catch FirebaseException in addTransactionData --> ${e.message}'.errorLogs();
      e.message?.showError();
    }
    return false;
  }
}

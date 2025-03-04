import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  @JsonKey(name: 'transactionId')
  final String? transactionId;

  @JsonKey(name: 'month')
  final String? month;

  @JsonKey(name: 'date')
  final String? date;

  @JsonKey(name: 'amount')
  final num? amount;

  @JsonKey(name: 'subHeaderLine')
  final String? description;

  @JsonKey(name: 'isShow')
  final bool isIncome;

  TransactionModel({this.transactionId, this.month, this.date, this.amount,  this.description, this.isIncome = false});

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}

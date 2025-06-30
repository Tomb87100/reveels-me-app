import '../database.dart';

class SellerFinancialSummaryTable
    extends SupabaseTable<SellerFinancialSummaryRow> {
  @override
  String get tableName => 'seller_financial_summary';

  @override
  SellerFinancialSummaryRow createRow(Map<String, dynamic> data) =>
      SellerFinancialSummaryRow(data);
}

class SellerFinancialSummaryRow extends SupabaseDataRow {
  SellerFinancialSummaryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SellerFinancialSummaryTable();

  String? get sellerId => getField<String>('seller_id');
  set sellerId(String? value) => setField<String>('seller_id', value);

  double? get availableBalance => getField<double>('available_balance');
  set availableBalance(double? value) =>
      setField<double>('available_balance', value);

  double? get pendingBalance => getField<double>('pending_balance');
  set pendingBalance(double? value) =>
      setField<double>('pending_balance', value);
}

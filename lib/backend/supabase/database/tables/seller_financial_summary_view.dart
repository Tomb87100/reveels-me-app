import '../database.dart';

class SellerFinancialSummaryViewTable
    extends SupabaseTable<SellerFinancialSummaryViewRow> {
  @override
  String get tableName => 'seller_financial_summary_view';

  @override
  SellerFinancialSummaryViewRow createRow(Map<String, dynamic> data) =>
      SellerFinancialSummaryViewRow(data);
}

class SellerFinancialSummaryViewRow extends SupabaseDataRow {
  SellerFinancialSummaryViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SellerFinancialSummaryViewTable();

  String? get sellerId => getField<String>('seller_id');
  set sellerId(String? value) => setField<String>('seller_id', value);

  double? get totalEarned => getField<double>('total_earned');
  set totalEarned(double? value) => setField<double>('total_earned', value);

  double? get totalWithdrawn => getField<double>('total_withdrawn');
  set totalWithdrawn(double? value) =>
      setField<double>('total_withdrawn', value);
}

import '../database.dart';

class PackStatsViewTable extends SupabaseTable<PackStatsViewRow> {
  @override
  String get tableName => 'pack_stats_view';

  @override
  PackStatsViewRow createRow(Map<String, dynamic> data) =>
      PackStatsViewRow(data);
}

class PackStatsViewRow extends SupabaseDataRow {
  PackStatsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PackStatsViewTable();

  String? get packId => getField<String>('pack_id');
  set packId(String? value) => setField<String>('pack_id', value);

  String? get sellerId => getField<String>('seller_id');
  set sellerId(String? value) => setField<String>('seller_id', value);

  int? get clickCount => getField<int>('click_count');
  set clickCount(int? value) => setField<int>('click_count', value);

  int? get totalSales => getField<int>('total_sales');
  set totalSales(int? value) => setField<int>('total_sales', value);

  double? get totalRevenueNet => getField<double>('total_revenue_net');
  set totalRevenueNet(double? value) =>
      setField<double>('total_revenue_net', value);
}

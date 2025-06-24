import '../database.dart';

class PackDetailsViewTable extends SupabaseTable<PackDetailsViewRow> {
  @override
  String get tableName => 'pack_details_view';

  @override
  PackDetailsViewRow createRow(Map<String, dynamic> data) =>
      PackDetailsViewRow(data);
}

class PackDetailsViewRow extends SupabaseDataRow {
  PackDetailsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PackDetailsViewTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get sellerId => getField<String>('seller_id');
  set sellerId(String? value) => setField<String>('seller_id', value);

  String? get packSlug => getField<String>('pack_slug');
  set packSlug(String? value) => setField<String>('pack_slug', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  double? get baseSellerPrice => getField<double>('base_seller_price');
  set baseSellerPrice(double? value) =>
      setField<double>('base_seller_price', value);

  String? get coverImagePath => getField<String>('cover_image_path');
  set coverImagePath(String? value) =>
      setField<String>('cover_image_path', value);

  bool? get isActiveForSale => getField<bool>('is_active_for_sale');
  set isActiveForSale(bool? value) =>
      setField<bool>('is_active_for_sale', value);

  bool? get isInShop => getField<bool>('is_in_shop');
  set isInShop(bool? value) => setField<bool>('is_in_shop', value);

  int? get clickCount => getField<int>('click_count');
  set clickCount(int? value) => setField<int>('click_count', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get dedicatedCoverPath => getField<String>('dedicated_cover_path');
  set dedicatedCoverPath(String? value) =>
      setField<String>('dedicated_cover_path', value);

  String? get shopUrlSlug => getField<String>('shop_url_slug');
  set shopUrlSlug(String? value) => setField<String>('shop_url_slug', value);

  int? get mediaCount => getField<int>('media_count');
  set mediaCount(int? value) => setField<int>('media_count', value);

  int? get totalSales => getField<int>('total_sales');
  set totalSales(int? value) => setField<int>('total_sales', value);

  double? get totalRevenueNet => getField<double>('total_revenue_net');
  set totalRevenueNet(double? value) =>
      setField<double>('total_revenue_net', value);
}

import '../database.dart';

class PacksTable extends SupabaseTable<PacksRow> {
  @override
  String get tableName => 'packs';

  @override
  PacksRow createRow(Map<String, dynamic> data) => PacksRow(data);
}

class PacksRow extends SupabaseDataRow {
  PacksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PacksTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get sellerId => getField<String>('seller_id')!;
  set sellerId(String value) => setField<String>('seller_id', value);

  String get packSlug => getField<String>('pack_slug')!;
  set packSlug(String value) => setField<String>('pack_slug', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  double get baseSellerPrice => getField<double>('base_seller_price')!;
  set baseSellerPrice(double value) =>
      setField<double>('base_seller_price', value);

  String? get coverImagePath => getField<String>('cover_image_path');
  set coverImagePath(String? value) =>
      setField<String>('cover_image_path', value);

  bool get isActiveForSale => getField<bool>('is_active_for_sale')!;
  set isActiveForSale(bool value) =>
      setField<bool>('is_active_for_sale', value);

  bool get isInShop => getField<bool>('is_in_shop')!;
  set isInShop(bool value) => setField<bool>('is_in_shop', value);

  int get clickCount => getField<int>('click_count')!;
  set clickCount(int value) => setField<int>('click_count', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}

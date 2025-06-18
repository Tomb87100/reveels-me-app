import '../database.dart';

class PromoCodesTable extends SupabaseTable<PromoCodesRow> {
  @override
  String get tableName => 'promo_codes';

  @override
  PromoCodesRow createRow(Map<String, dynamic> data) => PromoCodesRow(data);
}

class PromoCodesRow extends SupabaseDataRow {
  PromoCodesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PromoCodesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get sellerId => getField<String>('seller_id')!;
  set sellerId(String value) => setField<String>('seller_id', value);

  String get codeText => getField<String>('code_text')!;
  set codeText(String value) => setField<String>('code_text', value);

  String get discountType => getField<String>('discount_type')!;
  set discountType(String value) => setField<String>('discount_type', value);

  double get discountValue => getField<double>('discount_value')!;
  set discountValue(double value) => setField<double>('discount_value', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  int? get maxUses => getField<int>('max_uses');
  set maxUses(int? value) => setField<int>('max_uses', value);

  int get currentUses => getField<int>('current_uses')!;
  set currentUses(int value) => setField<int>('current_uses', value);

  DateTime? get validFrom => getField<DateTime>('valid_from');
  set validFrom(DateTime? value) => setField<DateTime>('valid_from', value);

  DateTime? get validUntil => getField<DateTime>('valid_until');
  set validUntil(DateTime? value) => setField<DateTime>('valid_until', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}

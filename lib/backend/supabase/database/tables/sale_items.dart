import '../database.dart';

class SaleItemsTable extends SupabaseTable<SaleItemsRow> {
  @override
  String get tableName => 'sale_items';

  @override
  SaleItemsRow createRow(Map<String, dynamic> data) => SaleItemsRow(data);
}

class SaleItemsRow extends SupabaseDataRow {
  SaleItemsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SaleItemsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get saleId => getField<String>('sale_id')!;
  set saleId(String value) => setField<String>('sale_id', value);

  String get packId => getField<String>('pack_id')!;
  set packId(String value) => setField<String>('pack_id', value);

  String get sellerId => getField<String>('seller_id')!;
  set sellerId(String value) => setField<String>('seller_id', value);

  double get baseSellerPriceAtPurchase =>
      getField<double>('base_seller_price_at_purchase')!;
  set baseSellerPriceAtPurchase(double value) =>
      setField<double>('base_seller_price_at_purchase', value);

  double get pricePaidForItemByBuyerProRata =>
      getField<double>('price_paid_for_item_by_buyer_pro_rata')!;
  set pricePaidForItemByBuyerProRata(double value) =>
      setField<double>('price_paid_for_item_by_buyer_pro_rata', value);
}

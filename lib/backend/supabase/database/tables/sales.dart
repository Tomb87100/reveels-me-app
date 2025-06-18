import '../database.dart';

class SalesTable extends SupabaseTable<SalesRow> {
  @override
  String get tableName => 'sales';

  @override
  SalesRow createRow(Map<String, dynamic> data) => SalesRow(data);
}

class SalesRow extends SupabaseDataRow {
  SalesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SalesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get buyerEmail => getField<String>('buyer_email')!;
  set buyerEmail(String value) => setField<String>('buyer_email', value);

  String get sellerId => getField<String>('seller_id')!;
  set sellerId(String value) => setField<String>('seller_id', value);

  double get totalBasePriceAfterPromo =>
      getField<double>('total_base_price_after_promo')!;
  set totalBasePriceAfterPromo(double value) =>
      setField<double>('total_base_price_after_promo', value);

  double get totalBuyerPaysPrice => getField<double>('total_buyer_pays_price')!;
  set totalBuyerPaysPrice(double value) =>
      setField<double>('total_buyer_pays_price', value);

  double get finalSellerEarnedAmount =>
      getField<double>('final_seller_earned_amount')!;
  set finalSellerEarnedAmount(double value) =>
      setField<double>('final_seller_earned_amount', value);

  double get totalPlatformGrossRevenue =>
      getField<double>('total_platform_gross_revenue')!;
  set totalPlatformGrossRevenue(double value) =>
      setField<double>('total_platform_gross_revenue', value);

  String? get promoCodeId => getField<String>('promo_code_id');
  set promoCodeId(String? value) => setField<String>('promo_code_id', value);

  String? get appliedDiscountDescription =>
      getField<String>('applied_discount_description');
  set appliedDiscountDescription(String? value) =>
      setField<String>('applied_discount_description', value);

  String get stripeCheckoutSessionId =>
      getField<String>('stripe_checkout_session_id')!;
  set stripeCheckoutSessionId(String value) =>
      setField<String>('stripe_checkout_session_id', value);

  String? get stripePaymentIntentId =>
      getField<String>('stripe_payment_intent_id');
  set stripePaymentIntentId(String? value) =>
      setField<String>('stripe_payment_intent_id', value);

  String get saleStatus => getField<String>('sale_status')!;
  set saleStatus(String value) => setField<String>('sale_status', value);

  String get contentAccessToken => getField<String>('content_access_token')!;
  set contentAccessToken(String value) =>
      setField<String>('content_access_token', value);

  DateTime get saleDate => getField<DateTime>('sale_date')!;
  set saleDate(DateTime value) => setField<DateTime>('sale_date', value);
}

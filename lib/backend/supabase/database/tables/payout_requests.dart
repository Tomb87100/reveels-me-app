import '../database.dart';

class PayoutRequestsTable extends SupabaseTable<PayoutRequestsRow> {
  @override
  String get tableName => 'payout_requests';

  @override
  PayoutRequestsRow createRow(Map<String, dynamic> data) =>
      PayoutRequestsRow(data);
}

class PayoutRequestsRow extends SupabaseDataRow {
  PayoutRequestsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PayoutRequestsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get sellerId => getField<String>('seller_id')!;
  set sellerId(String value) => setField<String>('seller_id', value);

  double get amountRequested => getField<double>('amount_requested')!;
  set amountRequested(double value) =>
      setField<double>('amount_requested', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  String? get stripePayoutId => getField<String>('stripe_payout_id');
  set stripePayoutId(String? value) =>
      setField<String>('stripe_payout_id', value);

  DateTime get requestedAt => getField<DateTime>('requested_at')!;
  set requestedAt(DateTime value) => setField<DateTime>('requested_at', value);

  DateTime? get processedAt => getField<DateTime>('processed_at');
  set processedAt(DateTime? value) => setField<DateTime>('processed_at', value);

  String? get failureReason => getField<String>('failure_reason');
  set failureReason(String? value) => setField<String>('failure_reason', value);
}

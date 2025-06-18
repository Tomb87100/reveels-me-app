import '../database.dart';

class StripeWebhooksTable extends SupabaseTable<StripeWebhooksRow> {
  @override
  String get tableName => 'stripe_webhooks';

  @override
  StripeWebhooksRow createRow(Map<String, dynamic> data) =>
      StripeWebhooksRow(data);
}

class StripeWebhooksRow extends SupabaseDataRow {
  StripeWebhooksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StripeWebhooksTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get eventId => getField<String>('event_id')!;
  set eventId(String value) => setField<String>('event_id', value);

  String get eventType => getField<String>('event_type')!;
  set eventType(String value) => setField<String>('event_type', value);

  bool? get processed => getField<bool>('processed');
  set processed(bool? value) => setField<bool>('processed', value);

  String? get error => getField<String>('error');
  set error(String? value) => setField<String>('error', value);

  dynamic get payload => getField<dynamic>('payload')!;
  set payload(dynamic value) => setField<dynamic>('payload', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}

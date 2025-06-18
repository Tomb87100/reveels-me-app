import '../database.dart';

class ReportsTable extends SupabaseTable<ReportsRow> {
  @override
  String get tableName => 'reports';

  @override
  ReportsRow createRow(Map<String, dynamic> data) => ReportsRow(data);
}

class ReportsRow extends SupabaseDataRow {
  ReportsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReportsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get reporterId => getField<String>('reporter_id');
  set reporterId(String? value) => setField<String>('reporter_id', value);

  String get packId => getField<String>('pack_id')!;
  set packId(String value) => setField<String>('pack_id', value);

  String get reason => getField<String>('reason')!;
  set reason(String value) => setField<String>('reason', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}

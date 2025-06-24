import '../database.dart';

class MediaItemsTable extends SupabaseTable<MediaItemsRow> {
  @override
  String get tableName => 'media_items';

  @override
  MediaItemsRow createRow(Map<String, dynamic> data) => MediaItemsRow(data);
}

class MediaItemsRow extends SupabaseDataRow {
  MediaItemsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MediaItemsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get packId => getField<String>('pack_id');
  set packId(String? value) => setField<String>('pack_id', value);

  String get sellerId => getField<String>('seller_id')!;
  set sellerId(String value) => setField<String>('seller_id', value);

  String get mediaType => getField<String>('media_type')!;
  set mediaType(String value) => setField<String>('media_type', value);

  String get storagePath => getField<String>('storage_path')!;
  set storagePath(String value) => setField<String>('storage_path', value);

  String? get thumbnailStoragePath =>
      getField<String>('thumbnail_storage_path');
  set thumbnailStoragePath(String? value) =>
      setField<String>('thumbnail_storage_path', value);

  int get orderInPack => getField<int>('order_in_pack')!;
  set orderInPack(int value) => setField<int>('order_in_pack', value);

  String? get fileNameOriginal => getField<String>('file_name_original');
  set fileNameOriginal(String? value) =>
      setField<String>('file_name_original', value);

  int? get fileSizeBytes => getField<int>('file_size_bytes');
  set fileSizeBytes(int? value) => setField<int>('file_size_bytes', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool get isBlurred => getField<bool>('is_blurred')!;
  set isBlurred(bool value) => setField<bool>('is_blurred', value);
}

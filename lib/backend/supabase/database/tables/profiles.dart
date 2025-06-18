import '../database.dart';

class ProfilesTable extends SupabaseTable<ProfilesRow> {
  @override
  String get tableName => 'profiles';

  @override
  ProfilesRow createRow(Map<String, dynamic> data) => ProfilesRow(data);
}

class ProfilesRow extends SupabaseDataRow {
  ProfilesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfilesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get publicName => getField<String>('public_name');
  set publicName(String? value) => setField<String>('public_name', value);

  String? get publicBio => getField<String>('public_bio');
  set publicBio(String? value) => setField<String>('public_bio', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);

  String? get shopUrlSlug => getField<String>('shop_url_slug');
  set shopUrlSlug(String? value) => setField<String>('shop_url_slug', value);

  String? get stripeAccountId => getField<String>('stripe_account_id');
  set stripeAccountId(String? value) =>
      setField<String>('stripe_account_id', value);

  String? get stripeKycStatus => getField<String>('stripe_kyc_status');
  set stripeKycStatus(String? value) =>
      setField<String>('stripe_kyc_status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}

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

  String? get shopSlug => getField<String>('shop_slug');
  set shopSlug(String? value) => setField<String>('shop_slug', value);

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

  double get commissionRateSeller =>
      getField<double>('commission_rate_seller')!;
  set commissionRateSeller(double value) =>
      setField<double>('commission_rate_seller', value);

  double get commissionRateBuyer => getField<double>('commission_rate_buyer')!;
  set commissionRateBuyer(double value) =>
      setField<double>('commission_rate_buyer', value);

  bool? get isPublic => getField<bool>('is_public');
  set isPublic(bool? value) => setField<bool>('is_public', value);
}

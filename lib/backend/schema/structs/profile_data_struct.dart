// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileDataStruct extends BaseStruct {
  ProfileDataStruct({
    String? id,
    String? email,
    String? publicName,
    String? publicBio,
    String? avatarUrl,
    String? stripeKycStatus,
    String? shopUrlSlug,
    String? stripeAccountId,
  })  : _id = id,
        _email = email,
        _publicName = publicName,
        _publicBio = publicBio,
        _avatarUrl = avatarUrl,
        _stripeKycStatus = stripeKycStatus,
        _shopUrlSlug = shopUrlSlug,
        _stripeAccountId = stripeAccountId;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "publicName" field.
  String? _publicName;
  String get publicName => _publicName ?? '';
  set publicName(String? val) => _publicName = val;

  bool hasPublicName() => _publicName != null;

  // "publicBio" field.
  String? _publicBio;
  String get publicBio => _publicBio ?? '';
  set publicBio(String? val) => _publicBio = val;

  bool hasPublicBio() => _publicBio != null;

  // "avatarUrl" field.
  String? _avatarUrl;
  String get avatarUrl => _avatarUrl ?? '';
  set avatarUrl(String? val) => _avatarUrl = val;

  bool hasAvatarUrl() => _avatarUrl != null;

  // "stripeKycStatus" field.
  String? _stripeKycStatus;
  String get stripeKycStatus => _stripeKycStatus ?? '';
  set stripeKycStatus(String? val) => _stripeKycStatus = val;

  bool hasStripeKycStatus() => _stripeKycStatus != null;

  // "shopUrlSlug" field.
  String? _shopUrlSlug;
  String get shopUrlSlug => _shopUrlSlug ?? '';
  set shopUrlSlug(String? val) => _shopUrlSlug = val;

  bool hasShopUrlSlug() => _shopUrlSlug != null;

  // "stripeAccountId" field.
  String? _stripeAccountId;
  String get stripeAccountId => _stripeAccountId ?? '';
  set stripeAccountId(String? val) => _stripeAccountId = val;

  bool hasStripeAccountId() => _stripeAccountId != null;

  static ProfileDataStruct fromMap(Map<String, dynamic> data) =>
      ProfileDataStruct(
        id: data['id'] as String?,
        email: data['email'] as String?,
        publicName: data['publicName'] as String?,
        publicBio: data['publicBio'] as String?,
        avatarUrl: data['avatarUrl'] as String?,
        stripeKycStatus: data['stripeKycStatus'] as String?,
        shopUrlSlug: data['shopUrlSlug'] as String?,
        stripeAccountId: data['stripeAccountId'] as String?,
      );

  static ProfileDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ProfileDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'email': _email,
        'publicName': _publicName,
        'publicBio': _publicBio,
        'avatarUrl': _avatarUrl,
        'stripeKycStatus': _stripeKycStatus,
        'shopUrlSlug': _shopUrlSlug,
        'stripeAccountId': _stripeAccountId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'publicName': serializeParam(
          _publicName,
          ParamType.String,
        ),
        'publicBio': serializeParam(
          _publicBio,
          ParamType.String,
        ),
        'avatarUrl': serializeParam(
          _avatarUrl,
          ParamType.String,
        ),
        'stripeKycStatus': serializeParam(
          _stripeKycStatus,
          ParamType.String,
        ),
        'shopUrlSlug': serializeParam(
          _shopUrlSlug,
          ParamType.String,
        ),
        'stripeAccountId': serializeParam(
          _stripeAccountId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProfileDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProfileDataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        publicName: deserializeParam(
          data['publicName'],
          ParamType.String,
          false,
        ),
        publicBio: deserializeParam(
          data['publicBio'],
          ParamType.String,
          false,
        ),
        avatarUrl: deserializeParam(
          data['avatarUrl'],
          ParamType.String,
          false,
        ),
        stripeKycStatus: deserializeParam(
          data['stripeKycStatus'],
          ParamType.String,
          false,
        ),
        shopUrlSlug: deserializeParam(
          data['shopUrlSlug'],
          ParamType.String,
          false,
        ),
        stripeAccountId: deserializeParam(
          data['stripeAccountId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProfileDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfileDataStruct &&
        id == other.id &&
        email == other.email &&
        publicName == other.publicName &&
        publicBio == other.publicBio &&
        avatarUrl == other.avatarUrl &&
        stripeKycStatus == other.stripeKycStatus &&
        shopUrlSlug == other.shopUrlSlug &&
        stripeAccountId == other.stripeAccountId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        email,
        publicName,
        publicBio,
        avatarUrl,
        stripeKycStatus,
        shopUrlSlug,
        stripeAccountId
      ]);
}

ProfileDataStruct createProfileDataStruct({
  String? id,
  String? email,
  String? publicName,
  String? publicBio,
  String? avatarUrl,
  String? stripeKycStatus,
  String? shopUrlSlug,
  String? stripeAccountId,
}) =>
    ProfileDataStruct(
      id: id,
      email: email,
      publicName: publicName,
      publicBio: publicBio,
      avatarUrl: avatarUrl,
      stripeKycStatus: stripeKycStatus,
      shopUrlSlug: shopUrlSlug,
      stripeAccountId: stripeAccountId,
    );

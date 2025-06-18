// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MediaItemDataStruct extends BaseStruct {
  MediaItemDataStruct({
    String? id,
    String? mediaType,
    String? storagePath,
    String? thumbnailStoragePath,
    int? orderInPack,
  })  : _id = id,
        _mediaType = mediaType,
        _storagePath = storagePath,
        _thumbnailStoragePath = thumbnailStoragePath,
        _orderInPack = orderInPack;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "mediaType" field.
  String? _mediaType;
  String get mediaType => _mediaType ?? '';
  set mediaType(String? val) => _mediaType = val;

  bool hasMediaType() => _mediaType != null;

  // "storagePath" field.
  String? _storagePath;
  String get storagePath => _storagePath ?? '';
  set storagePath(String? val) => _storagePath = val;

  bool hasStoragePath() => _storagePath != null;

  // "thumbnailStoragePath" field.
  String? _thumbnailStoragePath;
  String get thumbnailStoragePath => _thumbnailStoragePath ?? '';
  set thumbnailStoragePath(String? val) => _thumbnailStoragePath = val;

  bool hasThumbnailStoragePath() => _thumbnailStoragePath != null;

  // "orderInPack" field.
  int? _orderInPack;
  int get orderInPack => _orderInPack ?? 0;
  set orderInPack(int? val) => _orderInPack = val;

  void incrementOrderInPack(int amount) => orderInPack = orderInPack + amount;

  bool hasOrderInPack() => _orderInPack != null;

  static MediaItemDataStruct fromMap(Map<String, dynamic> data) =>
      MediaItemDataStruct(
        id: data['id'] as String?,
        mediaType: data['mediaType'] as String?,
        storagePath: data['storagePath'] as String?,
        thumbnailStoragePath: data['thumbnailStoragePath'] as String?,
        orderInPack: castToType<int>(data['orderInPack']),
      );

  static MediaItemDataStruct? maybeFromMap(dynamic data) => data is Map
      ? MediaItemDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'mediaType': _mediaType,
        'storagePath': _storagePath,
        'thumbnailStoragePath': _thumbnailStoragePath,
        'orderInPack': _orderInPack,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'mediaType': serializeParam(
          _mediaType,
          ParamType.String,
        ),
        'storagePath': serializeParam(
          _storagePath,
          ParamType.String,
        ),
        'thumbnailStoragePath': serializeParam(
          _thumbnailStoragePath,
          ParamType.String,
        ),
        'orderInPack': serializeParam(
          _orderInPack,
          ParamType.int,
        ),
      }.withoutNulls;

  static MediaItemDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      MediaItemDataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        mediaType: deserializeParam(
          data['mediaType'],
          ParamType.String,
          false,
        ),
        storagePath: deserializeParam(
          data['storagePath'],
          ParamType.String,
          false,
        ),
        thumbnailStoragePath: deserializeParam(
          data['thumbnailStoragePath'],
          ParamType.String,
          false,
        ),
        orderInPack: deserializeParam(
          data['orderInPack'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MediaItemDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MediaItemDataStruct &&
        id == other.id &&
        mediaType == other.mediaType &&
        storagePath == other.storagePath &&
        thumbnailStoragePath == other.thumbnailStoragePath &&
        orderInPack == other.orderInPack;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, mediaType, storagePath, thumbnailStoragePath, orderInPack]);
}

MediaItemDataStruct createMediaItemDataStruct({
  String? id,
  String? mediaType,
  String? storagePath,
  String? thumbnailStoragePath,
  int? orderInPack,
}) =>
    MediaItemDataStruct(
      id: id,
      mediaType: mediaType,
      storagePath: storagePath,
      thumbnailStoragePath: thumbnailStoragePath,
      orderInPack: orderInPack,
    );

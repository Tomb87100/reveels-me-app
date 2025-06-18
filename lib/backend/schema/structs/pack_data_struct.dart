// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PackDataStruct extends BaseStruct {
  PackDataStruct({
    String? id,
    String? name,
    String? description,
    double? baseSellerPrice,
    String? coverImagePath,
    int? clickCount,
    int? totalSales,
    double? totalRevenueNet,
    List<MediaItemDataStruct>? mediaItems,
  })  : _id = id,
        _name = name,
        _description = description,
        _baseSellerPrice = baseSellerPrice,
        _coverImagePath = coverImagePath,
        _clickCount = clickCount,
        _totalSales = totalSales,
        _totalRevenueNet = totalRevenueNet,
        _mediaItems = mediaItems;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "baseSellerPrice" field.
  double? _baseSellerPrice;
  double get baseSellerPrice => _baseSellerPrice ?? 0.0;
  set baseSellerPrice(double? val) => _baseSellerPrice = val;

  void incrementBaseSellerPrice(double amount) =>
      baseSellerPrice = baseSellerPrice + amount;

  bool hasBaseSellerPrice() => _baseSellerPrice != null;

  // "coverImagePath" field.
  String? _coverImagePath;
  String get coverImagePath => _coverImagePath ?? '';
  set coverImagePath(String? val) => _coverImagePath = val;

  bool hasCoverImagePath() => _coverImagePath != null;

  // "clickCount" field.
  int? _clickCount;
  int get clickCount => _clickCount ?? 0;
  set clickCount(int? val) => _clickCount = val;

  void incrementClickCount(int amount) => clickCount = clickCount + amount;

  bool hasClickCount() => _clickCount != null;

  // "totalSales" field.
  int? _totalSales;
  int get totalSales => _totalSales ?? 0;
  set totalSales(int? val) => _totalSales = val;

  void incrementTotalSales(int amount) => totalSales = totalSales + amount;

  bool hasTotalSales() => _totalSales != null;

  // "totalRevenueNet" field.
  double? _totalRevenueNet;
  double get totalRevenueNet => _totalRevenueNet ?? 0.0;
  set totalRevenueNet(double? val) => _totalRevenueNet = val;

  void incrementTotalRevenueNet(double amount) =>
      totalRevenueNet = totalRevenueNet + amount;

  bool hasTotalRevenueNet() => _totalRevenueNet != null;

  // "mediaItems" field.
  List<MediaItemDataStruct>? _mediaItems;
  List<MediaItemDataStruct> get mediaItems => _mediaItems ?? const [];
  set mediaItems(List<MediaItemDataStruct>? val) => _mediaItems = val;

  void updateMediaItems(Function(List<MediaItemDataStruct>) updateFn) {
    updateFn(_mediaItems ??= []);
  }

  bool hasMediaItems() => _mediaItems != null;

  static PackDataStruct fromMap(Map<String, dynamic> data) => PackDataStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        baseSellerPrice: castToType<double>(data['baseSellerPrice']),
        coverImagePath: data['coverImagePath'] as String?,
        clickCount: castToType<int>(data['clickCount']),
        totalSales: castToType<int>(data['totalSales']),
        totalRevenueNet: castToType<double>(data['totalRevenueNet']),
        mediaItems: getStructList(
          data['mediaItems'],
          MediaItemDataStruct.fromMap,
        ),
      );

  static PackDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? PackDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'description': _description,
        'baseSellerPrice': _baseSellerPrice,
        'coverImagePath': _coverImagePath,
        'clickCount': _clickCount,
        'totalSales': _totalSales,
        'totalRevenueNet': _totalRevenueNet,
        'mediaItems': _mediaItems?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'baseSellerPrice': serializeParam(
          _baseSellerPrice,
          ParamType.double,
        ),
        'coverImagePath': serializeParam(
          _coverImagePath,
          ParamType.String,
        ),
        'clickCount': serializeParam(
          _clickCount,
          ParamType.int,
        ),
        'totalSales': serializeParam(
          _totalSales,
          ParamType.int,
        ),
        'totalRevenueNet': serializeParam(
          _totalRevenueNet,
          ParamType.double,
        ),
        'mediaItems': serializeParam(
          _mediaItems,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static PackDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      PackDataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        baseSellerPrice: deserializeParam(
          data['baseSellerPrice'],
          ParamType.double,
          false,
        ),
        coverImagePath: deserializeParam(
          data['coverImagePath'],
          ParamType.String,
          false,
        ),
        clickCount: deserializeParam(
          data['clickCount'],
          ParamType.int,
          false,
        ),
        totalSales: deserializeParam(
          data['totalSales'],
          ParamType.int,
          false,
        ),
        totalRevenueNet: deserializeParam(
          data['totalRevenueNet'],
          ParamType.double,
          false,
        ),
        mediaItems: deserializeStructParam<MediaItemDataStruct>(
          data['mediaItems'],
          ParamType.DataStruct,
          true,
          structBuilder: MediaItemDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PackDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PackDataStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        baseSellerPrice == other.baseSellerPrice &&
        coverImagePath == other.coverImagePath &&
        clickCount == other.clickCount &&
        totalSales == other.totalSales &&
        totalRevenueNet == other.totalRevenueNet &&
        listEquality.equals(mediaItems, other.mediaItems);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        description,
        baseSellerPrice,
        coverImagePath,
        clickCount,
        totalSales,
        totalRevenueNet,
        mediaItems
      ]);
}

PackDataStruct createPackDataStruct({
  String? id,
  String? name,
  String? description,
  double? baseSellerPrice,
  String? coverImagePath,
  int? clickCount,
  int? totalSales,
  double? totalRevenueNet,
}) =>
    PackDataStruct(
      id: id,
      name: name,
      description: description,
      baseSellerPrice: baseSellerPrice,
      coverImagePath: coverImagePath,
      clickCount: clickCount,
      totalSales: totalSales,
      totalRevenueNet: totalRevenueNet,
    );

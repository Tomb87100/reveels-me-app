// ignore_for_file: unnecessary_getters_setters


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
    bool? isInShop,
    String? packSlug,
    bool? isActiveForSale,
    String? dedicatedCoverPath,
    int? mediaCount,
  })  : _id = id,
        _name = name,
        _description = description,
        _baseSellerPrice = baseSellerPrice,
        _coverImagePath = coverImagePath,
        _clickCount = clickCount,
        _totalSales = totalSales,
        _totalRevenueNet = totalRevenueNet,
        _mediaItems = mediaItems,
        _isInShop = isInShop,
        _packSlug = packSlug,
        _isActiveForSale = isActiveForSale,
        _dedicatedCoverPath = dedicatedCoverPath,
        _mediaCount = mediaCount;

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

  // "is_in_shop" field.
  bool? _isInShop;
  bool get isInShop => _isInShop ?? false;
  set isInShop(bool? val) => _isInShop = val;

  bool hasIsInShop() => _isInShop != null;

  // "packSlug" field.
  String? _packSlug;
  String get packSlug => _packSlug ?? '';
  set packSlug(String? val) => _packSlug = val;

  bool hasPackSlug() => _packSlug != null;

  // "is_active_for_sale" field.
  bool? _isActiveForSale;
  bool get isActiveForSale => _isActiveForSale ?? true;
  set isActiveForSale(bool? val) => _isActiveForSale = val;

  bool hasIsActiveForSale() => _isActiveForSale != null;

  // "dedicatedCoverPath" field.
  String? _dedicatedCoverPath;
  String get dedicatedCoverPath => _dedicatedCoverPath ?? '';
  set dedicatedCoverPath(String? val) => _dedicatedCoverPath = val;

  bool hasDedicatedCoverPath() => _dedicatedCoverPath != null;

  // "mediaCount" field.
  int? _mediaCount;
  int get mediaCount => _mediaCount ?? 0;
  set mediaCount(int? val) => _mediaCount = val;

  void incrementMediaCount(int amount) => mediaCount = mediaCount + amount;

  bool hasMediaCount() => _mediaCount != null;

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
        isInShop: data['is_in_shop'] as bool?,
        packSlug: data['packSlug'] as String?,
        isActiveForSale: data['is_active_for_sale'] as bool?,
        dedicatedCoverPath: data['dedicatedCoverPath'] as String?,
        mediaCount: castToType<int>(data['mediaCount']),
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
        'is_in_shop': _isInShop,
        'packSlug': _packSlug,
        'is_active_for_sale': _isActiveForSale,
        'dedicatedCoverPath': _dedicatedCoverPath,
        'mediaCount': _mediaCount,
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
        'is_in_shop': serializeParam(
          _isInShop,
          ParamType.bool,
        ),
        'packSlug': serializeParam(
          _packSlug,
          ParamType.String,
        ),
        'is_active_for_sale': serializeParam(
          _isActiveForSale,
          ParamType.bool,
        ),
        'dedicatedCoverPath': serializeParam(
          _dedicatedCoverPath,
          ParamType.String,
        ),
        'mediaCount': serializeParam(
          _mediaCount,
          ParamType.int,
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
        isInShop: deserializeParam(
          data['is_in_shop'],
          ParamType.bool,
          false,
        ),
        packSlug: deserializeParam(
          data['packSlug'],
          ParamType.String,
          false,
        ),
        isActiveForSale: deserializeParam(
          data['is_active_for_sale'],
          ParamType.bool,
          false,
        ),
        dedicatedCoverPath: deserializeParam(
          data['dedicatedCoverPath'],
          ParamType.String,
          false,
        ),
        mediaCount: deserializeParam(
          data['mediaCount'],
          ParamType.int,
          false,
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
        listEquality.equals(mediaItems, other.mediaItems) &&
        isInShop == other.isInShop &&
        packSlug == other.packSlug &&
        isActiveForSale == other.isActiveForSale &&
        dedicatedCoverPath == other.dedicatedCoverPath &&
        mediaCount == other.mediaCount;
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
        mediaItems,
        isInShop,
        packSlug,
        isActiveForSale,
        dedicatedCoverPath,
        mediaCount
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
  bool? isInShop,
  String? packSlug,
  bool? isActiveForSale,
  String? dedicatedCoverPath,
  int? mediaCount,
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
      isInShop: isInShop,
      packSlug: packSlug,
      isActiveForSale: isActiveForSale,
      dedicatedCoverPath: dedicatedCoverPath,
      mediaCount: mediaCount,
    );

// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocalFileDataStruct extends BaseStruct {
  LocalFileDataStruct({
    String? name,
    String? path,
  })  : _name = name,
        _path = path;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "path" field.
  String? _path;
  String get path => _path ?? '';
  set path(String? val) => _path = val;

  bool hasPath() => _path != null;

  static LocalFileDataStruct fromMap(Map<String, dynamic> data) =>
      LocalFileDataStruct(
        name: data['name'] as String?,
        path: data['path'] as String?,
      );

  static LocalFileDataStruct? maybeFromMap(dynamic data) => data is Map
      ? LocalFileDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'path': _path,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'path': serializeParam(
          _path,
          ParamType.String,
        ),
      }.withoutNulls;

  static LocalFileDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocalFileDataStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        path: deserializeParam(
          data['path'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LocalFileDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocalFileDataStruct &&
        name == other.name &&
        path == other.path;
  }

  @override
  int get hashCode => const ListEquality().hash([name, path]);
}

LocalFileDataStruct createLocalFileDataStruct({
  String? name,
  String? path,
}) =>
    LocalFileDataStruct(
      name: name,
      path: path,
    );

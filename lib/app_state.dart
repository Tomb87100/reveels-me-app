import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_packDraft')) {
        try {
          final serializedData = prefs.getString('ff_packDraft') ?? '{}';
          _packDraft =
              PackDataStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_currentUserProfile')) {
        try {
          final serializedData =
              prefs.getString('ff_currentUserProfile') ?? '{}';
          _currentUserProfile =
              ProfileDataStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<PackDataStruct> _allMyPacks = [];
  List<PackDataStruct> get allMyPacks => _allMyPacks;
  set allMyPacks(List<PackDataStruct> value) {
    _allMyPacks = value;
  }

  void addToAllMyPacks(PackDataStruct value) {
    allMyPacks.add(value);
  }

  void removeFromAllMyPacks(PackDataStruct value) {
    allMyPacks.remove(value);
  }

  void removeAtIndexFromAllMyPacks(int index) {
    allMyPacks.removeAt(index);
  }

  void updateAllMyPacksAtIndex(
    int index,
    PackDataStruct Function(PackDataStruct) updateFn,
  ) {
    allMyPacks[index] = updateFn(_allMyPacks[index]);
  }

  void insertAtIndexInAllMyPacks(int index, PackDataStruct value) {
    allMyPacks.insert(index, value);
  }

  PackDataStruct _packDraft = PackDataStruct();
  PackDataStruct get packDraft => _packDraft;
  set packDraft(PackDataStruct value) {
    _packDraft = value;
    prefs.setString('ff_packDraft', value.serialize());
  }

  void updatePackDraftStruct(Function(PackDataStruct) updateFn) {
    updateFn(_packDraft);
    prefs.setString('ff_packDraft', _packDraft.serialize());
  }

  ProfileDataStruct _currentUserProfile = ProfileDataStruct();
  ProfileDataStruct get currentUserProfile => _currentUserProfile;
  set currentUserProfile(ProfileDataStruct value) {
    _currentUserProfile = value;
    prefs.setString('ff_currentUserProfile', value.serialize());
  }

  void updateCurrentUserProfileStruct(Function(ProfileDataStruct) updateFn) {
    updateFn(_currentUserProfile);
    prefs.setString('ff_currentUserProfile', _currentUserProfile.serialize());
  }

  List<PackDataStruct> _shopPacks = [];
  List<PackDataStruct> get shopPacks => _shopPacks;
  set shopPacks(List<PackDataStruct> value) {
    _shopPacks = value;
  }

  void addToShopPacks(PackDataStruct value) {
    shopPacks.add(value);
  }

  void removeFromShopPacks(PackDataStruct value) {
    shopPacks.remove(value);
  }

  void removeAtIndexFromShopPacks(int index) {
    shopPacks.removeAt(index);
  }

  void updateShopPacksAtIndex(
    int index,
    PackDataStruct Function(PackDataStruct) updateFn,
  ) {
    shopPacks[index] = updateFn(_shopPacks[index]);
  }

  void insertAtIndexInShopPacks(int index, PackDataStruct value) {
    shopPacks.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

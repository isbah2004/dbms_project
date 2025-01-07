import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:dbms_project/models/user_data.dart';

class DataStore {
  static GetStorage storage = GetStorage();

  static UserData? profile;

  static UserData userProfile() {
    log(storage.read('userData').toString());
    final userData = storage.read('userData');

    profile = UserData.fromJson(userData);
    return profile!;
  }
}

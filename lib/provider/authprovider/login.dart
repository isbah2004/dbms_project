import 'dart:developer';

import 'package:dbms_project/constants/app_exports.dart';
import 'package:dbms_project/screens/todoscreen/home_screen.dart';

class LoginProvider with ChangeNotifier {
  final storage = GetStorage();
  String _phoneCode = '+92';
  String get phoneCode => _phoneCode;
  set phoneCode(String value) {
    _phoneCode = value;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login({
    required context,
    required String whatsAppNo,
    required String password,
  }) async {
    loading = true;
    // try {
    log('whatsAppNo: ${_phoneCode + whatsAppNo}, password: $password');
    final Response response = await Api.post(url: Url.login, body: {
      'whatsAppNo': _phoneCode + whatsAppNo,
      'password': password,
    });
    log(response.statusCode.toString());
    final String message = jsonDecode(response.body)['message'];

    if (response.statusCode == 200) {
      Utils.showSuccessFlushbar(context: context, message: message);
      final Map<String, dynamic> data = jsonDecode(response.body)['data'];

      UserData userData = UserData.fromJson(data);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
      storage.write('userData', userData.toJson());
    } else {
      Utils.showFailureFlushbar(context: context, message: message);
    }
    loading = false;
    // } catch (e) {
    //   log(e.toString());
    //   Utils.showFailureFlushbar(
    //       context: context, message: 'An unknown error occurred');
    // } finally {
    //   loading = false;
    // }
  }
}

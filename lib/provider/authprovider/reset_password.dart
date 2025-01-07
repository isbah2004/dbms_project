import 'dart:developer';

import 'package:dbms_project/constants/app_exports.dart';

class ResetPasswordProvider with ChangeNotifier {
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

  String _otp = '';

  String get otp => _otp;
  set otp(String value) {
    _otp = value;
    notifyListeners();
  }

  String _whatsappNo = '';
  String get whatsappNo => _whatsappNo;
  set whatsappNo(String value) {
    _whatsappNo = value;
    notifyListeners();
  }

  late Timer _timer;
  int _start = 60;
  bool _isResendEnabled = false;

  int get start => _start;
  bool get isResendEnabled => _isResendEnabled;

  ResetPasswordProvider() {
    startTimer();
  }

  void startTimer() {
    _isResendEnabled = false;
    _start = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        _isResendEnabled = true;
        _timer.cancel();
      } else {
        _start--;
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future resetPassword({required context, required String password}) async {
    loading = true;
    try {
      final Response response = await Api.post(url: Url.newPassword, body: {
        'whatsAppNo': _phoneCode + whatsappNo,
        'newPassword': password,
      });
      final String message = jsonDecode(response.body)['message'];

      if (response.statusCode == 200) {
        Utils.showSuccessFlushbar(context: context, message: message);
      } else {
        Utils.showFailureFlushbar(context: context, message: message);
      }
      log(message);
      log(response.statusCode.toString());
    } catch (e) {
      Utils.showFailureFlushbar(
          context: context, message: 'An unknown error occurred');
    } finally {
      loading = false;
    }
  }
}

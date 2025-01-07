import 'package:dbms_project/constants/app_exports.dart';

class SupportProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> sendMessage(
      {required String title,
      required String message,
      required context}) async {
    loading = true;

    try {
      final response = await Api.post(url: Url.support, body: {
        'title': title,
        'message': message,
        'userId': DataStore.userProfile().id,
      });
      if (response.statusCode == 201) {
        Utils.showSuccessFlushbar(
            context: context,
            message: 'Your message has been sent successfully');
      }
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}



import 'app_exports.dart';

class Utils {


  static void fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

 static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Please enter your email';
    }

    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

 static String? validatePassword(String password) {
    if (password.isEmpty) return 'Enter your password';
    if (password.length < 8) return 'At least 8 characters';
    if (!RegExp(r'[A-Z]').hasMatch(password)) return 'Add an uppercase letter';
    if (!RegExp(r'[a-z]').hasMatch(password)) return 'Add a lowercase letter';
    if (!RegExp(r'[0-9]').hasMatch(password)) return 'Add a number';

    if (!RegExp(r'[`~!@#\$%^&*()\-_=\+\[\{\|;:<>?,./"}]').hasMatch(password)) {
      return 'Add a special character';
    }

    return null;
  }
 static String? validatePhoneNumber(PhoneNumber number) {
    if (!number.isValidNumber()) return 'Invalid phone number';
   

    return null;
  }

  static void showSuccessFlushbar( {required   BuildContext context,required String message}) {
    Flushbar(
      message: message,
      backgroundColor: Theme.of(context).colorScheme.primary,
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  static void showFailureFlushbar({required BuildContext context,required String message}) {
    Flushbar(
      message: message,
      backgroundColor: Theme.of(context).colorScheme.error,
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  static void showNeutralFlushbar({required BuildContext context,required String message}) {
    Flushbar(
      message: message,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}

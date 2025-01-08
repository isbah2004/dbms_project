class Url {
  static const String baseUrl =
      'https://backend-squareonecommunity.vercel.app/';
  static const String signUp = '${baseUrl}auth/signup';
  static const String forgotPassword = '${baseUrl}auth/forgot-password';
  static const String newPassword = '${baseUrl}auth/new-password';
  static const String otpVerification = '${baseUrl}auth/verify-otp';
  static const String login = '${baseUrl}auth/login';
  static const String logout = '${baseUrl}auth/logout';
  static const String getProfile = '${baseUrl}auth/profile';
  static const String editProfile = '${baseUrl}auth/profile/edit';
  static const String deleteProfile = '${baseUrl}auth/profile/delete';
  static const String allBrands = '${baseUrl}brand/all/get';
  static const String support = '${baseUrl}support/create';
}

class Constants {
 static List<String> genders = ['male', 'female'];

 static List<String> areas = [
    "Abdullah Harron Road",
    "Abul Hassan Isphani Road",
    "Airport",
    "Bahadurabad",
    "Bahria Town Karachi",
    "Baldia Town",
    "Buffer Zone 2",
    "Cantt",
    "Clifton",
    "DHA Defence",
    "Federal B Area",
    "Gadap Town",
    "Garden West",
    "Gulberg Town",
    "Gulistan e Johar",
    "Gulshan e iqbal",
    "Jamshed Road",
    "Jamshed Town",
    "Kemari Town",
    "Korangi",
    "Landhi",
    "Landhi 1",
    "Liaqatabad",
    "Lyari Town",
    "M.A Jinnah Road",
    "Malir",
    "Mehmoodabad",
    "Nazimabad",
    "New Karachi",
    "North Karachi",
    "North Karachi Buffer Zone",
    "North Nazimabad",
    "Orangi Town",
    "Saddar Town",
    "Scheme 33",
    "Shah Faisal Town",
    "Shahrah e Faisal",
    "Sindh Industrial Trading Estate",
    "Tariq Road",
    "University Road"
  ];
}

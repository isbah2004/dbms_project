import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dbms_project/constants/app_exports.dart';

class ProfileProvider extends ChangeNotifier {
  static UserData userData = DataStore.userProfile();
  final storage = GetStorage();
  String _dateOfBirth = userData.dateOfBirth;
  String get dateOfBirth => _dateOfBirth;
  set dateOfBirth(String value) {
    _dateOfBirth = value;
    notifyListeners();
  }

  String _location = userData.location;
  String get location => _location;
  set location(String value) {
    _location = value;
    notifyListeners();
  }

  String _gender = userData.gender;
  String get gender => _gender;
  set gender(String value) {
    _gender = value;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  String? _imageUrl;
  File? _image;
  String? get imageUrl => _imageUrl;
  File? get image => _image;
  set imageUrl(String? value) {
    _imageUrl = value;
    notifyListeners();
  }

  set image(File? value) {
    _image = value;
    notifyListeners();
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    deleteFromCloudinary('rjpipjnhp2ssl17hkvox');
    try {
      final XFile? pickedImage = await picker.pickImage(source: source);
      if (pickedImage != null) {
        image = File(pickedImage.path);

        uploadToCloudinary(image!);
      }
    } catch (e) {
      log('Error picking image: $e');
    }
  }

  Future<String?> uploadToCloudinary(File imageFile) async {
    const String cloudName = 'dxhhsvyh9';
    const String uploadPreset = 'lsdkjo3u4';

    final uri =
        Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload');
    final request = http.MultipartRequest('POST', uri);

    request.fields['upload_preset'] = uploadPreset;

    request.files.add(await http.MultipartFile.fromPath(
      'file',
      imageFile.path,
    ));

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final jsonData = json.decode(responseData);
      log('Upload successful: ${jsonData['secure_url']}');
      return jsonData['secure_url'];
    } else {
      log('Upload failed: ${response.statusCode} ${response.request}');
      return null;
    }
  }

  Future<void> deleteFromCloudinary(String publicId) async {
    const String cloudName = 'dxhhsvyh9';
    const String apiKey = '139194639628115';
    const String apiSecret = 'crq7f6wso_OhEsFYJWBdwFju4Fo';

    final uri =
        Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/destroy');
    final request = http.MultipartRequest('POST', uri);

    request.fields['public_id'] = publicId;
    request.fields['api_key'] = apiKey;
    request.fields['timestamp'] =
        (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();

    final String signature = generateSignature({
      'public_id': publicId,
      'timestamp': request.fields['timestamp']!,
    }, apiSecret);

    request.fields['signature'] = signature;

    final response = await request.send();

    // Process the response
    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final jsonData = json.decode(responseData);
      log('Delete successful: ${jsonData['result']}');
    } else {
      log('Delete failed: ${response.statusCode} ${response.request}');
    }
  }

  String generateSignature(Map<String, String> data, String apiSecret) {
    final sortedKeys = data.keys.toList()..sort();
    final signatureString =
        sortedKeys.map((key) => '$key=${data[key]}').join('&');
    final bytes = utf8.encode(signatureString + apiSecret);
    return sha1.convert(bytes).toString();
  }
  // Future<void> uploadImage() async {
  //   loading = true;
  //   try {
  //     log('uploading image');
  //     final request = http.MultipartRequest(

  //       'POST',
  //       _url,
  //     )
  //       ..fields['upload_preset'] = 'lsdkjo3u4'
  //       ..files.add(
  //         await http.MultipartFile.fromPath(
  //           'file',
  //           _image!.path,
  //         ),
  //       );
  //        log('uploading image');
  //       final response = await request.send();
  //       if (response.statusCode == 200) {
  //         log('uploading image');
  //         final responseData = await response.stream.toBytes();
  //       final  responseString = String.fromCharCodes(responseData);
  //        final data = jsonDecode(responseString);
  //        _imageUrl = data['url'];
  //        log(_imageUrl!);

  //       }

  //       loading = false;
  //   } catch (e) {
  //     log( 'Error uploading image: $e');
  //     loading = false;
  //   }
  //   finally{
  //     loading = false;
  //   }

  //         // body: {'dateOfBirth': dateOfBirth, 'location': location});
  //   }
  //   // catch (e) {
  //   loading = false;
  // }
}

// void login({
//   required context,
//   required String whatsAppNo,
//   required String password,
// }) async {
//   loading = true;
//   try {

//     final Response response = await Api.post(url: Url.login, body: {
//       'whatsAppNo': _phoneCode+whatsAppNo,
//       'password': password,
//     });
//     final String message = jsonDecode(response.body)['message'];

//     if (response.statusCode == 200) {
//       Utils.showSuccessFlushbar(context: context, message: message);
//       final Map<String,dynamic> data = jsonDecode(response.body)['data'];
//        UserData userData = UserData.fromJson(data);
//       storage.write('userData', userData.toJson());
//     } else {
//       Utils.showFailureFlushbar(context: context, message: message);
//     }
//   } catch (e) {
//     Utils.showFailureFlushbar(
//         context: context, message: 'An unknown error occurred');

//   } finally {
//     loading = false;
//   }
// }

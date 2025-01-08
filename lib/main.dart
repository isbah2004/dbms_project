import 'package:dbms_project/constants/app_exports.dart';
import 'package:dbms_project/provider/todoprovider/todo.dart';
  import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();


// ...

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  await GetStorage.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => DashboardProviders()),
    ChangeNotifierProvider(create: (context) => ResetPasswordProvider()),
    ChangeNotifierProvider(create: (context) => BrandDataProvider()),
    ChangeNotifierProvider(create: (context) => SignUpProvider()),
    ChangeNotifierProvider(create: (context) => LoginProvider()),
    ChangeNotifierProvider(create: (context) => ProfileProvider()),
    ChangeNotifierProvider(create: (context) => DealProvider()),
    ChangeNotifierProvider(create: (context)=> TodoProvider())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppTheme.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}

// class ApiTester extends StatelessWidget {
//   const ApiTester({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             sendWhatsAppMessage(
//                 '485942147942394',
//                 'EAAG3xTezRZA4BO0eMAMflwgZCCbq8RkuZBDUf4tLokNW8LVqrfzz06fhg00aeQyZApH7aL7YHU9t9rZC2kY4cjJhsQuZCuA85PVv4uCXdfmUWjAEMbV5ZCxydn0q7Vc3ejnK476uE1TbbXnEHcRqbITMpPlBfRVHdOZBvZCHvukFElvGXs8zr403P4HG84DGq0Ww0zdNYY4k2V8j5NlDjxnqQGUyEZABAZD',
//                 '03123352687',);
//           },
//           child: const Text('Send'),
//         ),
//       ),
//     );
//   }
// }

// Future<void> sendWhatsAppMessage(
//     String id, String accessToken, String recipient) async {
//   final String url = 'https://graph.facebook.com/v21.0/$id/messages';

//   final Map<String, dynamic> body = {
//     "messaging_product": "whatsapp",
//     "to": recipient,
//     "type": "template",
//     "template": {
//       "name": "hello_world",
//       "language": {"code": "en_US"}
//     }
//   };

//   final response = await http.post(
//     Uri.parse(url),
//     headers: {
//       'Authorization': 'Bearer $accessToken',
//       'Content-Type': 'application/json',
//     },
//     body: jsonEncode(body),
//   );

//   if (response.statusCode == 200) {
//     print('Message sent successfully: ${response.body}');
//   } else {
//     print('Failed to send message: ${response.statusCode} - ${response.body}');
//   }
// }

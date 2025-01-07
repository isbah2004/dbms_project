import 'dart:developer';

import 'package:dbms_project/constants/app_exports.dart';
import 'package:http/http.dart' as http;

class Api {
  // getProfile({required String url, required }) async {
  //   try {
  //     final response = await http.get(Uri.parse(url),);
  //     if (response.statusCode == 200) {
  //       print(response.body);
  //     } else {
  //       print('Failed to load profile');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  static get({required String url}) async {
    final response = await http.get(
      Uri.parse(url),
    );

    return response;
  }

  static post({required String url, required Map<String, dynamic> body}) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return response;
  }

  static put({required String url, required Map<String, dynamic> body}) async {
    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return response;
  }

  static Future<void> sendWhatsAppMessage() async {
    final url =
        Uri.parse('https://graph.facebook.com/v21.0/485942147942394/messages');

    final headers = {
      'Authorization':
          'Bearer EAAG3xTezRZA4BO0m6HbVZAqb0vHIZCev5QPwYQHpB8ZABr2AqobIWmMfLQN9XnxJzeL0FOi4CX1D3y6SiSZCBd8ljR6ABeKZCztcYTPoZCS4vGVDfr1VZAcKZCFcXlRZCoZB3PjwLS27WLt9wljHJ6M8jxYxtrGisjXVEwlhsC63mKZA2bMzzpY4DTX0nKyzcf1vw4w2VZBrxjaZA0sJB6kSUZA3cvvnERYzECJ',
      'Content-Type': 'application/json',
    };

    final body = {
      "messaging_product": "whatsapp",
      "recipient_type": "individual",
      "to": '+92 3123352687',
      "type": "template",
      "template": {
        "name": "squareone_authentication",
        "language": {"code": "en_GB"},
        "components": [
          {
            "type": "body",
            "parameters": [
              {"type": "text", "text": "Dynamic Value 1"},
              {"type": "text", "text": "Dynamic Value 2"},
            ],
          },
        ],
      },
    };

    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      log("Message sent successfully: ${response.body}");
    } else {
      log("Failed to send message: ${response.body}");
    }
  }
}

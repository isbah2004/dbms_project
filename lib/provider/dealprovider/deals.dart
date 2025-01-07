import 'dart:developer';

import 'package:dbms_project/constants/app_exports.dart';

class DealProvider with ChangeNotifier {
  final List<Brand> _brands = [];
  bool _loading = false;
  List<Deal> _deals = [];

  List<Brand> get brands => _brands;
  bool get loading => _loading;
  List<Deal> get deals => _deals;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> fetchAllBrands() async {
    loading = true;

    try {
      final response = await Api.get(url: Url.allBrands);

      if (response.statusCode == 200) {
        final body = response.body;
        if (body != null) {
          final Map<String, dynamic> data = jsonDecode(body);

          for (var brand in data['data']) {
            _brands.add(Brand.fromJson(brand));
          }
        }

        seperateDeals();
      }
    } catch (error) {
      log('error: $error');
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  void seperateDeals() {
    List<Deal> allDeals = [];
    for (var brand in _brands) {
      allDeals.addAll(brand.deals);
    }

    _deals = allDeals.reversed.toList();
    log(_deals.reversed.toString());
  }
}

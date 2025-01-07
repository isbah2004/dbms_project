class Deal {
  final String dealId;
  final String dealTitle;
  final String dealDescription;
  final String dealTagline;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime createdAt;
  final String picture;
  final String banner;

  Deal({
    required this.dealId,
    required this.dealTitle,
    required this.dealDescription,
    required this.dealTagline,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.picture,
    required this.banner,
  });

  factory Deal.fromJson(Map<String, dynamic> json) {
    return Deal(
      dealId: json['dealid'] ?? '',
      dealTitle: json['dealtitle'] ?? '',
      dealDescription: json['dealdescription'] ?? '',
      dealTagline: json['dealtagline'] ?? '',
      startDate: json['startdate'] != null
          ? DateTime.parse(json['startdate'])
          : DateTime.now(),
      endDate: json['enddate'] != null
          ? DateTime.parse(json['enddate'])
          : DateTime.now(),
      createdAt: json['createdat'] != null
          ? DateTime.parse(json['createdat'])
          : DateTime.now(),
      picture: json['picture'] ?? '',
      banner: json['banner'] ?? '',
    );
  }
}

class Brand {
  final String brandId;
  final String brandName;
  final String category;
  final String logoImage;
  final String createdBy;
  final DateTime createdAt;
  final String brandWhatsappNo;
  final String description;
  final String workingHours;
  final List<Deal> deals;

  Brand({
    required this.brandId,
    required this.brandName,
    required this.category,
    required this.logoImage,
    required this.createdBy,
    required this.createdAt,
    required this.brandWhatsappNo,
    required this.description,
    required this.workingHours,
    required this.deals,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    // List<Deal> dealList = [];
    // if (json['deals'] != null && json['deals'] is List) {
    //   for (var deal in json['deals']) {
    //     dealList.add(Deal.fromJson(deal));
    //   }
    //   log(dealList.toString());
    // }
    var dealsFromJson = json['deals'] as List;
    List<Deal> dealList = dealsFromJson.map((i) => Deal.fromJson(i)).toList();

    return Brand(
      brandId: json['brandid'],
      brandName: json['brandname'],
      category: json['category'],
      logoImage: json['logoimage'],
      createdBy: json['createdby'],
      createdAt: DateTime.parse(json['createdat']),
      brandWhatsappNo: json['brandwhatsappno'],
      description: json['description'],
      workingHours: json['workinghours'],
      deals: dealList,
    );
  }
}

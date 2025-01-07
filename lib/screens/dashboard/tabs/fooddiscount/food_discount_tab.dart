import 'package:dbms_project/constants/app_exports.dart';

class FoodDiscountTab extends StatefulWidget {
  const FoodDiscountTab({super.key});

  @override
  State<FoodDiscountTab> createState() => _FoodDiscountTabState();
}

class _FoodDiscountTabState extends State<FoodDiscountTab> {
  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            GreyBgField(
              controller: searchController,
            ),
            const SizedBox(
              height: 20,
            ),
            CarouselExample(),
            Column(
              children: List.generate(
                5,
                (index) {
                  return DiscountCard(
                      category: 'Food and Beverages',
                      deal: Deal(
                        banner: '',
                        dealDescription: '',
                        dealId: '',
                        dealTagline: '',
                        dealTitle: '',
                        createdAt: DateTime.now(),
                        startDate: DateTime.now(),
                        endDate: DateTime.now(),
                        picture: '',
                      ),
                      imagePath:
                          'https://images.unsplash.com/photo-1726501602997-3a0fc988aa3b?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Zm9vZCUyMGltYWdlc3xlbnwwfDB8MHx8fDA%3D',
                      discount: 30,
                      title: 'OPTP',
                      location: 'At SquareOne');
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}

import 'package:dbms_project/constants/app_exports.dart';

class EventsTab extends StatefulWidget {
  const EventsTab({super.key});

  @override
  State<EventsTab> createState() => _EventsTabState();
}

class _EventsTabState extends State<EventsTab> {
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
                    imagePath:
                        'https://images.unsplash.com/photo-1513623935135-c896b59073c1?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZXZlbnR8ZW58MHwwfDB8fHww',
                    discount: 25,
                    title: 'Zellburry',
                    location: 'At SquareOne',
                    category: 'Clothing',
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
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}

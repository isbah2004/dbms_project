import 'dart:developer';

import 'package:dbms_project/constants/app_exports.dart';

class DiscountTab extends StatefulWidget {
  const DiscountTab({super.key});

  @override
  State<DiscountTab> createState() => _DiscountTabState();
}

class _DiscountTabState extends State<DiscountTab> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // log(DataStore.userProfile().fullName);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DealProvider>(context, listen: false).fetchAllBrands();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Consumer<DealProvider>(builder: (context, provider, child) {
            return Column(
              children: [
                GreyBgField(
                  controller: searchController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CarouselExample(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: context.height / 8,
                        width: context.width / 2.25,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1732494644033-fedc311f0442?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxNnx8fGVufDB8fHx8fA%3D%3D',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        height: context.height / 8,
                        width: context.width / 2.25,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1732468170768-4ae7fe38376b?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw3MHx8fGVufDB8fHx8fA%3D%3D',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //  BrandList(brand: provider.brands,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Recommended Discounts',
                      style: AppTheme.darkText(context: context, isBold: true),
                    ),
                  ),
                ),
                Column(
                  children: List.generate(
                    provider.deals.length,
                    (index) {
                      final deal = provider.deals[index];
                      if (deal.dealId == '') {
                        return const SizedBox();
                      }
                      return DiscountCard(
                        deal: deal,
                        imagePath: deal.picture,
                        discount: 20,
                        title: deal.dealTitle,
                        location: 'At SquareOne',
                        category: deal.dealId,
                      );
                    },
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

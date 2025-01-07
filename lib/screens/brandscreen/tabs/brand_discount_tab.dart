import 'package:dbms_project/constants/app_exports.dart';

class BrandDiscountTab extends StatelessWidget {
  final String imageUrl;
  const BrandDiscountTab({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.left,
                    'Aplha Romeo',
                    style: AppTheme.darkText(
                        context: context, isBold: true, fontSize: 26),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    textAlign: TextAlign.left,
                    'Cars and Automobiles',
                    style: AppTheme.darkText(
                        context: context, isBold: false, fontSize: 19),
                  ),
                ],
              ),
            ),
          ),
          DiscountCard(
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
            imagePath: imageUrl,
            discount: 20,
          ),
          DiscountCard(
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
            imagePath: imageUrl,
            discount: 20,
          ),
          DiscountCard(
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
            imagePath: imageUrl,
            discount: 20,
          ),
          DiscountCard(
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
            imagePath: imageUrl,
            discount: 20,
          ),
          DiscountCard(
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
            imagePath: imageUrl,
            discount: 20,
          ),
          DiscountCard(
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
            imagePath: imageUrl,
            discount: 20,
          ),
          DiscountCard(
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
            imagePath: imageUrl,
            discount: 20,
          ),
          DiscountCard(
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
            imagePath: imageUrl,
            discount: 20,
          ),
          DiscountCard(
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
            imagePath: imageUrl,
            discount: 20,
          ),
          DiscountCard(
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
            imagePath: imageUrl,
            discount: 20,
          ),
        ],
      ),
    );
  }
}

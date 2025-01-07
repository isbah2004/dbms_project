import 'package:dbms_project/constants/app_exports.dart';

class DiscountCard extends StatelessWidget {
  final String? location, title, category;
  final int discount;
  final String imagePath;
  final Deal deal;

  const DiscountCard(
      {super.key,
      required this.imagePath,
      required this.discount,
      this.title,
      this.location,
      this.category,
      required this.deal});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RedeemScreen()));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            height: context.height / 6,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.onSecondary,
                  spreadRadius: 2,
                  offset: const Offset(5, 5),
                  blurRadius: 6,
                ),
              ],
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10),
            ),
            width: context.width,
            child: Row(
              children: [
                SizedBox(
                  width: context.width / 1.8,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: Image.network(
                      imagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.end,
                        'FLAT',
                        style: AppTheme.darkText(
                            fontSize: 12, context: context, isBold: true),
                      ),
                      Text(
                        textAlign: TextAlign.start,
                        '$discount%',
                        style: AppTheme.redText(
                            isBold: true, fontSize: 27, context: context),
                      ),
                      Text(
                        'OFF',
                        style: AppTheme.darkText(
                          fontSize: 12,
                          context: context,
                          isBold: true,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          title == null && category == null && location == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title ?? '',
                            style: AppTheme.darkText(
                                context: context, isBold: true, fontSize: 14),
                          ),
                          Text(
                            category ?? '',
                            style: AppTheme.darkText(
                                context: context, isBold: false, fontSize: 12),
                          ),
                        ],
                      ),
                      Text(
                        location ?? 'At SquareOne',
                        style: AppTheme.redText(
                            isBold: true, fontSize: 14, context: context),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

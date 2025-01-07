import 'package:dbms_project/constants/app_exports.dart';

class BrandScreen extends StatelessWidget {
  final String imageUrl;

  const BrandScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Consumer<BrandDataProvider>(builder: (context, provider, child) {
        return Stack(
          children: [
            SizedBox(
              height: context.height / 2.5,
              width: context.width,
              child: Image.network(
                  fit: BoxFit.fill,
                  'https://images.unsplash.com/photo-1660602880433-dd978d9ec9f9?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnJhbmQlMjBsb2dvfGVufDB8fDB8fHww'),
            ),
            SizedBox(
              width: context.width,
              height: context.height - (context.height / 2.5),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: context.height / 2.7,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              provider.switchTab(true);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: context.width / 3,
                              decoration: BoxDecoration(
                                  color: AppTheme.red,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.discount,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Discount',
                                    style: AppTheme.whiteText(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              provider.switchTab(false);
                            },
                            child: Container(
                              height: 40,
                              width: context.width / 3,
                              decoration: BoxDecoration(
                                  color: AppTheme.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.info),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Info',
                                    style: AppTheme.darkText(
                                        context: context, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  provider.discountTab
                      ? BrandDiscountTab(imageUrl: imageUrl)
                      : const BrandInfoTab(),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
  // return Scaffold(
  //     body: Stack(
  //       alignment: Alignment.topCenter,
  //       children: [
  //         SizedBox(
  //           height: context.height / 3.5,
  //           width: context.width,
  //           child: Stack(
  //             fit: StackFit.expand,
  //             alignment: Alignment.bottomCenter,
  //             children: [
  //               Image.network(
  //                 'https://images.unsplash.com/photo-1660602880433-dd978d9ec9f9?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnJhbmQlMjBsb2dvfGVufDB8fDB8fHww',
  //                 fit: BoxFit.fill,
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(bottom: 35),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   children: [
  //                     Container(
  //                       alignment: Alignment.center,
  //                       height: 40,
  //                       width: context.width / 3,
  //                       decoration: BoxDecoration(
  //                           color: AppTheme.red,
  //                           borderRadius: BorderRadius.circular(30)),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           const Icon(
  //                             Icons.discount,
  //                             color: Colors.white,
  //                           ),
  //                           const SizedBox(
  //                             width: 10,
  //                           ),
  //                           Text(
  //                             'Discount',
  //                             style: AppTheme.whiteText(fontSize: 14),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     Container(
  //                       height: 40,
  //                       width: context.width / 3,
  //                       decoration: BoxDecoration(
  //                           color: AppTheme.white,
  //                           borderRadius: BorderRadius.circular(30)),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           const Icon(Icons.info),
  //                           const SizedBox(
  //                             width: 10,
  //                           ),
  //                           Text(
  //                             'Info',
  //                             style: AppTheme.darkText(
  //                                 context: context, fontSize: 14),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         SingleChildScrollView(
  //           scrollDirection: Axis.vertical,
  //           child: Column(
  //             children: [
  //               SizedBox(
  //                 height: context.height / 3.78,
  //               ),
  //               Container(
  //                 height: context.height - (context.height / 3.5),
  //                 width: context.width,
  //                 decoration: const BoxDecoration(
  //                   color: AppTheme.white,
  //                   borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(20),
  //                     topRight: Radius.circular(20),
  //                   ),
  //                 ),
  //                 child: Padding(
  //                   padding: const EdgeInsets.symmetric(
  //                       horizontal: 15, vertical: 20),
  //                   child: Column(
  //                     children: [
  //                       Align(
  //                         alignment: Alignment.topLeft,
  //                         child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text(
  //                               textAlign: TextAlign.left,
  //                               'Aplha Romeo',
  //                               style: AppTheme.darkText(
  //                                   context: context,
  //                                   isBold: true,
  //                                   fontSize: 20),
  //                             ),
  //                             const SizedBox(
  //                               height: 5,
  //                             ),
  //                             Text(
  //                               textAlign: TextAlign.left,
  //                               'Cars and Automobiles',
  //                               style: AppTheme.darkText(
  //                                   context: context,
  //                                   isBold: false,
  //                                   fontSize: 15),
  //                             ),
  //                           ],
  //                         ),
  //                       ),

  //                       ListView.builder(
  //                         shrinkWrap: true,
  //                         physics: const NeverScrollableScrollPhysics(),
  //                         itemCount: 5, // Number of discount cards
  //                         itemBuilder: (context, index) {
  //                           return Card(
  //                             margin: const EdgeInsets.symmetric(vertical: 10),
  //                             child: Padding(
  //                               padding: const EdgeInsets.all(15.0),
  //                               child: Column(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Text(
  //                                     'Discount ${index + 1}',
  //                                     style: AppTheme.darkText(
  //                                         context: context,
  //                                         isBold: true,
  //                                         fontSize: 18),
  //                                   ),
  //                                   const SizedBox(height: 5),
  //                                   Text(
  //                                     'Get ${10 * (index + 1)}% off on your next purchase!',
  //                                     style: AppTheme.darkText(
  //                                         context: context,
  //                                         isBold: false,
  //                                         fontSize: 14),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                           );
  //                         },
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
   
import 'package:dbms_project/constants/app_exports.dart';

// class BrandList extends StatelessWidget {
//   final List<Brand> brand;
//   const BrandList({super.key, required this.brand});

//   // final List<String> imageUrls = [
//   //   'https://images.unsplash.com/photo-1620288627223-53302f4e8c74?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bG9nb3xlbnwwfHwwfHx8MA%3D%3D',
//   //   'https://images.unsplash.com/photo-1615915468538-0fbd857888ca?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bG9nb3xlbnwwfHwwfHx8MA%3D%3D',
//   //   'https://images.unsplash.com/photo-1617566347924-ad5ebdaa014e?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bG9nb3xlbnwwfHwwfHx8MA%3D%3D',
//   //   'https://images.unsplash.com/photo-1618836436067-3665afbc4ee9?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGxvZ298ZW58MHx8MHx8fDA%3D',
//   //   'https://images.unsplash.com/photo-1605152277138-359efd4a6862?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGxvZ298ZW58MHx8MHx8fDA%3D',
//   //   'https://images.unsplash.com/photo-1620288627223-53302f4e8c74?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bG9nb3xlbnwwfHwwfHx8MA%3D%3D',
//   //   'https://images.unsplash.com/photo-1615915468538-0fbd857888ca?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bG9nb3xlbnwwfHwwfHx8MA%3D%3D',
//   //   'https://images.unsplash.com/photo-1617566347924-ad5ebdaa014e?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bG9nb3xlbnwwfHwwfHx8MA%3D%3D',
//   //   'https://images.unsplash.com/photo-1618836436067-3665afbc4ee9?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGxvZ298ZW58MHx8MHx8fDA%3D',
//   //   'https://images.unsplash.com/photo-1605152277138-359efd4a6862?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGxvZ298ZW58MHx8MHx8fDA%3D',
//   //   'https://images.unsplash.com/photo-1620288627223-53302f4e8c74?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bG9nb3xlbnwwfHwwfHx8MA%3D%3D',
//   //   'https://images.unsplash.com/photo-1615915468538-0fbd857888ca?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bG9nb3xlbnwwfHwwfHx8MA%3D%3D',
//   //   'https://images.unsplash.com/photo-1617566347924-ad5ebdaa014e?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bG9nb3xlbnwwfHwwfHx8MA%3D%3D',
//   //   'https://images.unsplash.com/photo-1618836436067-3665afbc4ee9?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGxvZ298ZW58MHx8MHx8fDA%3D',
//   //   'https://images.unsplash.com/photo-1605152277138-359efd4a6862?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGxvZ298ZW58MHx8MHx8fDA%3D',
//   //   'https://images.unsplash.com/photo-1620288627223-53302f4e8c74?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bG9nb3xlbnwwfHwwfHx8MA%3D%3D',
//   //   'https://images.unsplash.com/photo-1615915468538-0fbd857888ca?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bG9nb3xlbnwwfHwwfHx8MA%3D%3D',
//   //   'https://images.unsplash.com/photo-1617566347924-ad5ebdaa014e?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bG9nb3xlbnwwfHwwfHx8MA%3D%3D',
//   //   'https://images.unsplash.com/photo-1618836436067-3665afbc4ee9?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGxvZ298ZW58MHx8MHx8fDA%3D',
//   //   'https://images.unsplash.com/photo-1605152277138-359efd4a6862?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGxvZ298ZW58MHx8MHx8fDA%3D',
//   //   'https://images.unsplash.com/photo-1620288627223-53302f4e8c74?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bG9nb3xlbnwwfHwwfHx8MA%3D%3D',
//   //   'https://images.unsplash.com/photo-1615915468538-0fbd857888ca?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bG9nb3xlbnwwfHwwfHx8MA%3D%3D',
//   //   'https://images.unsplash.com/photo-1617566347924-ad5ebdaa014e?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bG9nb3xlbnwwfHwwfHx8MA%3D%3D',
//   //   'https://images.unsplash.com/photo-1618836436067-3665afbc4ee9?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGxvZ298ZW58MHx8MHx8fDA%3D',
//   //   'https://images.unsplash.com/photo-1605152277138-359efd4a6862?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGxvZ298ZW58MHx8MHx8fDA%3D',
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     return AutoScrollRow(
//       scrollDuration: Duration(seconds: brand.length * 3),
//       enableUserScroll: true,
//       children: List.generate(brand.length, (index) {
//         ImageProvider imageUrl = NetworkImage(brand[index].logoImage);
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => BrandScreen(
//                     imageUrl: brand[index].logoImage,
//                   ),
//                 ),
//               );
//             },
//             child: CircleAvatar(
//               backgroundColor: Theme.of(context).colorScheme.onPrimary,
//               radius: 35,
//               backgroundImage: imageUrl,
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }

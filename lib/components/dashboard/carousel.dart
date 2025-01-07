import 'package:dbms_project/constants/app_exports.dart';

class CarouselExample extends StatelessWidget {
  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1720048169707-a32d6dfca0b3?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1732494644033-fedc311f0442?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxNnx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1719937206667-ac87c15ad3e9?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyMXx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1732468170768-4ae7fe38376b?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw3MHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1733031510035-3fda1ac87b8d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw0NHx8fGVufDB8fHx8fA%3D%3D',
  ];

  CarouselExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
        autoPlayAnimationDuration: const Duration(milliseconds: 1500),
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 3),
        aspectRatio: 16 / 8,
        viewportFraction: 1,
      ),
      items: imageUrls.map(
        (url) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: context.width / 1.1,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(url, fit: BoxFit.fill)),
              );
            },
          );
        },
      ).toList(),
    );
  }
}

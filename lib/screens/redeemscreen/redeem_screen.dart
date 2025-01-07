import 'package:dbms_project/constants/app_exports.dart';

class RedeemScreen extends StatelessWidget {
  const RedeemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height,
        width: context.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: const NetworkImage(
                'https://plus.unsplash.com/premium_photo-1675003662084-f2adbb7ccea7?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8d2hpdGUlMjBjYWtlfGVufDB8MXwwfHx8MA%3D%3D'),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ButtonBack(),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      backgroundImage: const NetworkImage(
                          'https://images.unsplash.com/photo-1620288627223-53302f4e8c74?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bG9nb3xlbnwwfHwwfHx8MA%3D%3D'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text('Lamborghini',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Lamborghini stands as a beacon of innovation and uncompromising performance, redefining the art of automotive engineering.Its unmistakable design.',
                  style: AppTheme.whiteText(fontSize: 14),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: context.height / 8,
                  width: context.width,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Flat 25% off',
                          style: AppTheme.darkText(
                              fontSize: 20, isBold: true, context: context),
                        ),
                        Text(
                          'Lamborghini stands as a beacon of innovation and uncompromising performance.',
                          style:
                              AppTheme.darkText(context: context, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: context.width / 2.7,
                        decoration: BoxDecoration(
                            color: AppTheme.red,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Redeem',
                          style: AppTheme.whiteText(fontSize: 16),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: context.width / 2.7,
                        decoration: BoxDecoration(
                            color: AppTheme.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'All offers',
                          style:
                              AppTheme.darkText(context: context, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:dbms_project/constants/app_exports.dart';

class BrandInfoTab extends StatelessWidget {
  const BrandInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: context.height - (context.height / 2.7),
      ),
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
                        context: context, isBold: true, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    textAlign: TextAlign.left,
                    'Cars and Automobiles',
                    style: AppTheme.darkText(
                        context: context, isBold: false, fontSize: 17),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.phone, color: AppTheme.red),
                      title: Text(
                        'Phone Number',
                        style:
                            AppTheme.darkText(context: context, isBold: true),
                      ),
                      subtitle: Text(
                        '+1234567890',
                        style:
                            AppTheme.greyText(context: context, fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: ListTile(
                      leading:
                          const Icon(Icons.location_on, color: AppTheme.red),
                      title: Text(
                        'Address',
                        style:
                            AppTheme.darkText(context: context, isBold: true),
                      ),
                      subtitle: Text(
                        '123 Main Street, New York, USA,123 Main Street, New York, USA123 Main Street, New York, USA123 Main Street, New York, USA123 Main Street, New York, USA',
                        style:
                            AppTheme.greyText(context: context, fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ExpandableTile(
                    title: 'Timing',
                    icon: Icons.access_time,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Text(
                          'Monday: 9:00 AM - 5:00 PM',
                          style:
                              AppTheme.greyText(context: context, fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Text(
                          'Tuesday: 9:00 AM - 5:00 PM',
                          style:
                              AppTheme.greyText(context: context, fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Text(
                          'Wednesday: 9:00 AM - 5:00 PM',
                          style:
                              AppTheme.greyText(context: context, fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Text(
                          'Thursday: 9:00 AM - 5:00 PM',
                          style:
                              AppTheme.greyText(context: context, fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Text(
                          'Friday: 9:00 AM - 5:00 PM',
                          style:
                              AppTheme.greyText(context: context, fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Text(
                          'Saturday: 10:00 AM - 4:00 PM',
                          style:
                              AppTheme.greyText(context: context, fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Text(
                          'Sunday: Closed',
                          style:
                              AppTheme.greyText(context: context, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpandableTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const ExpandableTile({
    required this.title,
    required this.icon,
    required this.children,
    super.key,
  });

  @override
  _ExpandableTileState createState() => _ExpandableTileState();
}

class _ExpandableTileState extends State<ExpandableTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(widget.icon, color: AppTheme.red),
            title: Text(
              widget.title,
              style: AppTheme.darkText(context: context, isBold: true),
            ),
            trailing: IconButton(
              icon: Icon(
                _isExpanded ? Icons.expand_less : Icons.expand_more,
                color: AppTheme.red,
              ),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _isExpanded
                  ? widget.children
                  : widget.children.take(2).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

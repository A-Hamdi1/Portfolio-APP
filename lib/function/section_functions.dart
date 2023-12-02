import 'package:flutter/material.dart';

class TSettingsMenuTile extends StatelessWidget {
  const TSettingsMenuTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: Colors.blue),
      title: Text(title, style: TextStyle(fontSize: 18)),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.titleMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    Key? key,
    this.textColor,
    required this.title,
  }) : super(key: key);

  final Color? textColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style:
              Theme.of(context).textTheme.titleLarge!.apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
class ChildWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;

  const ChildWidget({
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
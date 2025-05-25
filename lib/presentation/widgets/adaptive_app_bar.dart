import 'package:flutter/material.dart';

class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final double? elevation;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;

  const AdaptiveAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.elevation,
    this.centerTitle = true,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      actions: actions,
      backgroundColor: backgroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      bottom: bottom,
      title: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
} 
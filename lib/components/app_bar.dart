import 'package:flutter/material.dart';

class AppDefaultBar extends StatefulWidget implements PreferredSizeWidget {
  const AppDefaultBar({super.key, required this.title});
  final String title;

  @override
  State<AppDefaultBar> createState() => _AppDefaultBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _AppDefaultBarState extends State<AppDefaultBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: [
          DropdownButton(
            items: const [],
            onChanged: (value) {},
            icon: Icon(Icons.more_vert, color: Theme.of(context).primaryColor),
          ),
        ],
        leading: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Builder(builder: (context) {
              return IconButton(
                onPressed: () => {Scaffold.of(context).openDrawer()},
                icon: Icon(Icons.menu_sharp,
                    color: Theme.of(context).primaryColor),
              );
            })),
        title: Title(
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            widget.title,
           style: Theme.of(context).textTheme.titleLarge,
          ),
        ));
  }
}

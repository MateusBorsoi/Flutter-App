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
            icon:  Icon(Icons.more_vert, color: Theme.of(context).colorScheme.secondary,),
          ),
        ],
        leading: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Builder(builder: (context) {
              return IconButton(
                onPressed: () => {Scaffold.of(context).openDrawer()},
                icon: const Icon(Icons.menu_sharp),
              );
            })),
        title: Title(
          color: Colors.red,
          child: Text(
            widget.title,
            selectionColor: Colors.blue,
          ),
        ));
  }
}

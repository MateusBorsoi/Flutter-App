import 'package:appauth/classes/routes.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key, required this.title});
  final String title;

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

List<Routes> routes = [
  const Routes('Início', '/home'),
  const Routes('Usuarios Github', '/git_users')
];

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                )),
            DrawerHeader(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Text(
                widget.title,
                style: const TextStyle(color: Colors.indigo),
              ),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: routes.length,
                itemBuilder: (context, index) {
                  final route = routes[index];
                  return ListTile(
                    title: Text(route.route),
                    onTap: () {
                      Navigator.pushNamed(context, route.pathName);
                    },
                  );
                })
          ],
        ),
      ],
    ));
  }
}

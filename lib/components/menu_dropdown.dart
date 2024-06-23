import 'package:flutter/material.dart';

class MenuDropDown extends StatefulWidget {
  const MenuDropDown({super.key});

  @override
  State<MenuDropDown> createState() => _MenuDropDownState();
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "USA", child: Text("USA")),
    const DropdownMenuItem(value: "Canada", child: Text("Canada")),
    const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
    const DropdownMenuItem(value: "England", child: Text("England")),
  ];
  return menuItems;
}

class _MenuDropDownState extends State<MenuDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: dropdownItems,
      onChanged: (value) {
        {}
      },
    );
  }
}

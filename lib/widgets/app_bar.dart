import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Extra Classes"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.book_online),
            title: Text("Courses"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Payment"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/app_bar_search.dart';
import '../widgets/menu_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55), child: CustomAppBar()),
      drawer: MenuButton(),
    );
  }
}

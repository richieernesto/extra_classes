import 'package:flutter/material.dart';

import '../widgets/box_decoration.dart';
import '../widgets/menu_button.dart';
import '../widgets/app_bar_search.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55), child: CustomAppBar()),
      drawer: MenuButton(),
      resizeToAvoidBottomInset: false,
      backgroundColor: mC,
      body: Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                labelColor: Colors.black,
                controller: _tabController,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.purple,
                tabs: [
                  Tab(
                    text: "Mobile Money",
                  ),
                  Tab(
                    text: "Card",
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 300,
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                    child: Column(
                  children: [
                    Text("Mobile Money"),
                  ],
                )),
                Container(
                  child: Text("Card"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

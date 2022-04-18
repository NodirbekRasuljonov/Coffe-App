import 'package:coffeapp/core/constants/color_const.dart';
import 'package:coffeapp/provider/text_field_provider.dart';
import 'package:coffeapp/screens/adminpages/add_page.dart';
import 'package:coffeapp/screens/adminpages/orders_page.dart';
import 'package:coffeapp/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminHomepage extends StatefulWidget {
  const AdminHomepage({Key? key}) : super(key: key);

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          context: context,
          title: 'Admin Home Page',
          function: () {
            context.read<MytextFieldProvider>().signOut(context: context);
          }),
          body: TabBarView(
            controller: _tabController,
            children: [
              AdminAddPage(),
              AdminOrderPage()
            ]),
          bottomNavigationBar: TabBar(
            indicatorColor: MyColorConst.kPrimaryColor,
            labelColor: MyColorConst.kPrimaryColor,
            controller: _tabController,
            tabs: [Tab(
              icon: Icon(Icons.home,),
              text: 'Home',
            
            ),Tab(
              icon: Icon(Icons.shopping_cart_checkout),
              text: 'Orders',
            )]),
          
    );
  }
}

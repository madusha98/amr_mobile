import 'package:amr_mobile/controller/home/bottomNavController.dart';
import 'package:amr_mobile/view/billPaymentView.dart';
import 'package:amr_mobile/view/home/historyView.dart';
import 'package:amr_mobile/view/home/homeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BottomNav extends GetView<BottomNavController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Obx(
            () => IndexedStack(
              index: controller.tabIndex.value,
              children: [
                Home(),
                History(),
                BillPayment(),
                Text('3'),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 51,
          child: Obx(
            () => BottomNavigationBar(
              backgroundColor: Color.fromRGBO(249, 249, 249, 1),
              selectedItemColor: Theme.of(context).accentColor,
              unselectedItemColor: Color.fromRGBO(153, 153, 153, 1),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history,
                  ),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.credit_card,
                  ),
                  label: 'Payment',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline,
                  ),
                  label: 'Profile',
                ),
              ],
              currentIndex: controller.tabIndex.value,
              onTap: controller.changeTabIndex,
              selectedFontSize: 11.0,
              unselectedFontSize: 11.0,
            ),
          ),
        ),
      );
}

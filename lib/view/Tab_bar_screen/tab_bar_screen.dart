import 'package:e_cart/view/Cleaning_service_screen/Cleaning_service_screen.dart';
import 'package:flutter/material.dart';

class TabbarScreen extends StatelessWidget {
  const TabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 16,
          ),
          title: const Text(
            "Cleaning Services",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              color: Colors.greenAccent.withValues(alpha: 0.3),
              child: TabBar(
                dividerColor: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 12),
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                tabAlignment: TabAlignment.start,
                labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                indicatorPadding: const EdgeInsets.symmetric(vertical: 6),
                indicator: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: "Deep cleaning"),
                  Tab(text: "Maid Services"),
                  Tab(text: "Car Cleaning"),
                  Tab(text: "Carpet Cleaning"),
                ],
              ),
            ),
          ),
        ),

        body: const TabBarView(
          children: [
            CleaningserviceScreen(),
            Center(child: Text("Other Services")),
            Center(child: Text("Car Cleaning")),
            Center(child: Text("Carpet Cleaning")),
          ],
        ),
      ),
    );
  }
}

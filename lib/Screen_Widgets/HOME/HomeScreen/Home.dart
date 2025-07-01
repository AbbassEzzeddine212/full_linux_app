import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/HOME/HomeScreen/widgets/BarPicture.dart';
import 'package:full_app/Screen_Widgets/HOME/HomeScreen/widgets/SLiderContainer_Controller.dart';
import 'package:full_app/Screen_Widgets/HOME/HomeScreen/widgets/clickableContainer.dart';
import 'package:full_app/Screen_Widgets/HOME/HomeScreen/widgets/sliderContainer.dart';
import 'package:get/get.dart';

import 'package:full_app/constant/Dimensions.dart';
import 'package:full_app/constant/MyAppBar.dart';

import '../../Navigation_Pages/controller.dart';
import '../Benfits/BenefitsPage.dart';
import '../Booking/Booking.dart';
import '../Invoices/invoices.dart';

import '../News/newPage.dart';
import '../Polls and surveys/PollsAndSurveys.dart';
import '../Requests/requestsPage.dart';
import '../Services/ServicesPage.dart';
import '../Vists/Vists.dart';

class Home extends StatelessWidget {
  const Home({super.key});



  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(viewportFraction: 0.9);
    final SliderController sliderController = Get.put(SliderController());
    final NavigationController navController = Get.find<NavigationController>();
    final totalPages = 3;

    return Scaffold(
      appBar: MyAppBar(title: "Welcome User", leading: Barpicture()),
      body: SafeArea(
        child: Wrap(
          runSpacing: 20,
          alignment: WrapAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 220,
              child: PageView(
                controller: pageController,
                onPageChanged: (index) =>
                sliderController.currentpage.value = index,
                children: List.generate(totalPages, (index) {
                  return Slidercontainer(
                    index: index,
                    controller: sliderController,
                    totalPages: totalPages,
                  );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: DimensionsApp.width * 0.05,
                vertical: DimensionsApp.height * 0.03,
              ),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ClicableContainer(
                    title: 'Requests',
                    icon: Icons.sticky_note_2_sharp,
                    onTap: () => navController.openSubPage(Requests()),
                  ),
                  ClicableContainer(
                    title: 'Visits',
                    icon: Icons.edit_calendar_outlined,
                    onTap: () => navController.openSubPage(Vists()),
                  ),
                  ClicableContainer(
                    title: 'Booking',
                    icon: Icons.menu_book_outlined,
                    onTap: () => navController.openSubPage(Booking()),
                  ),
                  ClicableContainer(
                    title: 'Invoices',
                    icon: Icons.credit_card,
                    onTap: () => navController.openSubPage(InvoicesPage()),
                  ),
                  ClicableContainer(
                    title: 'Services',
                    icon: Icons.handyman,
                    onTap: () => navController.openSubPage(ServicesPage()),
                  ),
                  ClicableContainer(
                    title: 'News & Events',
                    icon: Icons.sticky_note_2_sharp,
                    onTap: () => navController.openSubPage(NewsPage()),
                  ),
                  ClicableContainer(
                    title: 'Benefits',
                    icon: Icons.workspace_premium,
                    onTap: () => navController.openSubPage(BenefitsPage()),
                  ),
                  ClicableContainer(
                    title: 'Suggestions',
                    icon: Icons.lightbulb_outline_rounded,
                    onTap: () {}, // you can add later
                  ),
                  ClicableContainer(
                    title: 'Polls & surveys',
                    icon: Icons.sticky_note_2_sharp,
                    onTap: () => navController.openSubPage(PollsAndSurveysPage()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

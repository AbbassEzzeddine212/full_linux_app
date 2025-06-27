import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/Booking/Booking.dart';
import 'package:full_app/Screen_Widgets/HomeScreen/widgets/BarPicture.dart';
import 'package:full_app/Screen_Widgets/HomeScreen/widgets/SLiderContainer_Controller.dart';
import 'package:full_app/Screen_Widgets/HomeScreen/widgets/clickableContainer.dart';
import 'package:full_app/Screen_Widgets/HomeScreen/widgets/sliderContainer.dart';
import 'package:full_app/Screen_Widgets/News/newPage.dart';
import 'package:full_app/Screen_Widgets/Requests/requestsPage.dart';
import 'package:full_app/Screen_Widgets/Vists/Vists.dart';
import 'package:full_app/constant/Dimensions.dart';
import 'package:full_app/constant/MyAppBar.dart';
import 'package:get/get.dart';

import '../Benfits/BenefitsPage.dart';
import '../Invoices/invoices.dart';
import '../Polls and surveys/PollsAndSurveys.dart';
import '../Services/ServicesPage.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final PageController _pageController = PageController(viewportFraction: 0.9);
  final SliderController sliderController = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                controller: _pageController,
                onPageChanged: (index)=>sliderController.currentpage.value=index,
                children: List.generate(totalPages, (index) {
                  return Slidercontainer(
                    index: index,
                    controller: sliderController,
                    totalPages: totalPages,
                  );
                }),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: width*0.05,
            //     vertical: height*0.03
            //   ),
            //   child: Column(
            //     spacing: 20,
            //     children: [
            //       Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           ClicableContainer(
            //             title: 'Requests',
            //             icon: Icons.sticky_note_2_sharp,
            //             onTap: () {
            //               Get.to(Requests());
            //             },
            //           ),
            //           ClicableContainer(
            //             title: 'Visits',
            //             icon: Icons.edit_calendar_outlined,
            //             onTap: () => Get.to(Vists()),
            //           ),
            //           ClicableContainer(
            //             title: 'Booking',
            //             icon: Icons.menu_book_outlined,
            //             onTap: () => Get.to(Booking()),
            //           ),
            //         ],
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           ClicableContainer(
            //             title: 'Invoices',
            //             icon: Icons.credit_card,
            //             onTap: () => Get.to(InvoicesPage()),
            //           ),
            //           ClicableContainer(
            //             title: 'Services',
            //             icon: Icons.handyman,
            //             onTap: () => Get.to(ServicesPage()),
            //           ),
            //           ClicableContainer(
            //             title: 'News & Events',
            //             icon: Icons.sticky_note_2_sharp,
            //             onTap: ()=>Get.to(NewsPage()),
            //           ),
            //         ],
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           ClicableContainer(
            //             title: 'Benefits',
            //             icon: Icons.workspace_premium,
            //             onTap: ()=>Get.to(BenefitsPage()),
            //           ),
            //           ClicableContainer(
            //             title: 'Suggestions',
            //             icon: Icons.lightbulb_outline_rounded,
            //           ),
            //           ClicableContainer(
            //             title: 'Polls & surveys',
            //             icon: Icons.sticky_note_2_sharp,
            //             onTap: ()=>Get.to(PollsAndSurveysPage()),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
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
                  ClicableContainer(title: 'Requests', icon: Icons.sticky_note_2_sharp, onTap: () => Get.to(Requests())),
                  ClicableContainer(title: 'Visits', icon: Icons.edit_calendar_outlined, onTap: () => Get.to(Vists())),
                  ClicableContainer(title: 'Booking', icon: Icons.menu_book_outlined, onTap: () => Get.to(Booking())),
                  ClicableContainer(title: 'Invoices', icon: Icons.credit_card, onTap: () => Get.to(InvoicesPage())),
                  ClicableContainer(title: 'Services', icon: Icons.handyman, onTap: () => Get.to(ServicesPage())),
                  ClicableContainer(title: 'News & Events', icon: Icons.sticky_note_2_sharp, onTap: () => Get.to(NewsPage())),
                  ClicableContainer(title: 'Benefits', icon: Icons.workspace_premium, onTap: () => Get.to(BenefitsPage())),
                  ClicableContainer(title: 'Suggestions', icon: Icons.lightbulb_outline_rounded),
                  ClicableContainer(title: 'Polls & surveys', icon: Icons.sticky_note_2_sharp, onTap: () => Get.to(PollsAndSurveysPage())),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

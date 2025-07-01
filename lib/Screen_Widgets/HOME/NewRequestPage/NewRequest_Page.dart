import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/HOME/NewRequestPage/widgets/Controller.dart';
import 'package:full_app/Screen_Widgets/HOME/NewRequestPage/widgets/PhotoContainer.dart';


import 'package:full_app/constant/MyAppBar.dart';
import 'package:get/get.dart';
import '../../../constant/Dimensions.dart';


class NewrequestPage extends StatelessWidget {
  const NewrequestPage({super.key, required this.issueType});

  final String issueType;

  @override
  Widget build(BuildContext context) {
    Get.put(NewRequestController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MyAppBar(title: 'New Request'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: DimensionsApp.height * 0.03,
            horizontal: DimensionsApp.width * 0.05,
          ),
          child: Wrap(
             runSpacing: 20,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  issueType,
                  style: Theme.of(context).textTheme.headlineLarge
                ),
              ),

              // Title
              Text(
                'Title:',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextFormField(),

              // Description
              Text(
                'Description:',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextFormField(
                maxLines: 5,
              ),


              // Upload Image
              Text(
                'Upload Image:',
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  UploadPhoto(index: 0,),
                  UploadPhoto(index: 1,),
                  UploadPhoto(index: 2,),
                ],
              ),


              // Submit Button
              Center(
                child: SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Submit',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/NewRequestPage/widgets/PhotoContainer.dart';
import 'package:full_app/constant/MyAppBar.dart';
import '../../constant/Dimensions.dart';

class NewrequestPage extends StatelessWidget {
  const NewrequestPage({super.key, required this.issueType});

  final String issueType;

  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),

              // Title
              Text(
                'Title:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              // Description
              Text(
                'Description:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),


              // Upload Image
              Text(
                'Upload Image:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  UplpoadPhoto(),
                  UplpoadPhoto(),
                  UplpoadPhoto(),
                ],
              ),
              SizedBox(height: 30),

              // Submit Button
              Center(
                child: SizedBox(
                  width: 120,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.black),
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

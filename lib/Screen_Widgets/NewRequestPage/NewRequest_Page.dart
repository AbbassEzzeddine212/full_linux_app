import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/NewRequestPage/widgets/PhotoContainer.dart';
import 'package:full_app/constant/MyAppBar.dart';

class NewrequestPage extends StatelessWidget {
  const NewrequestPage({super.key, required this.issueType});

  final String issueType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'New Request'),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
        child: Column(
          spacing: 30,
          children: [
            Center(
              child: Text(
                issueType,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),

            Row(
              children: [
                Text(
                  'Title:            ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Text('Description: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Flexible(
                  child: TextFormField(
                    maxLines: 7,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),


            Row(
              spacing: 25,
              children: [
                Text('Upload Image: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                UplpoadPhoto(),
                UplpoadPhoto(),
                UplpoadPhoto(),
              ],
            ),
            
            
            OutlinedButton(onPressed: (){}, child: Text('Submit',style: TextStyle(color: Colors.black),)),


          ],
        ),
      ),
    );
  }
}

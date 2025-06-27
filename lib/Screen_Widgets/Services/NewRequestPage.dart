import 'package:flutter/material.dart';
import 'package:full_app/constant/Colors.dart';
import 'package:full_app/constant/MyAppBar.dart';

import '../../constant/Dimensions.dart';
import '../Requests/WIdgets/NewRequestRow.dart';

class NewRquestInvoice extends StatelessWidget {
  const NewRquestInvoice({super.key, required this.Title});

  final String Title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'New Request'),
      body: SafeArea(
        child: SingleChildScrollView( // scroll when keyboard opens
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: DimensionsApp.width * 0.05,
              vertical: DimensionsApp.height * 0.02,
            ),
            child: Column(
              spacing: 20,
              children: [
                Center(child: Text(Title, style: TextStyle(fontSize: 30))),
                ..._buildFieldsBasedOnTitle(Title),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Image'),
                    Flexible(
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(child: Icon(Icons.add)),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.Appbar,
                    ),
                    child: Text('Submit', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFieldsBasedOnTitle(String title) {
    switch (title.toLowerCase()) {
      case 'carwash':
        return [
          RowNewRequest(title: 'Car Type'),
          RowNewRequest(title: 'Plate Number'),
          RowNewRequest(title: 'Location'),
        ];
      case 'cleaning':
        return [
          RowNewRequest(title: 'Number of Rooms'),
          RowNewRequest(title: 'Clean Level'),
          RowNewRequest(title: 'Date'),
        ];
      case 'packing':
        return [
          RowNewRequest(title: 'Box Count'),
          RowNewRequest(title: 'Room Location'),
        ];
      case 'housekeeping':
        return [
          RowNewRequest(title: 'Room Count'),
          RowNewRequest(title: 'Service Time'),
        ];
      default:
        return [
          RowNewRequest(title: 'Details'),
        ];
    }
  }

}

import 'package:flutter/material.dart';
import 'package:full_app/constant/Colors.dart';
import 'package:full_app/constant/MyAppBar.dart';
import 'package:get/get.dart';


import '../../../constant/Dimensions.dart';
import '../Requests/WIdgets/NewRequestRow.dart';
import 'Widgets/ServicesController.dart';

class NewRquestInvoice extends StatelessWidget {
  const NewRquestInvoice({super.key, required this.Title});

  final String Title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServicesController());
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
                    const Text('Image'),
                    GestureDetector(
                      onTap: controller.pickImage,
                      child: Obx(() {
                        final image = controller.images[0];
                        return Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15),
                            image: image != null
                                ? DecorationImage(
                              image: FileImage(image),
                              fit: BoxFit.cover,
                            )
                                : null,
                          ),
                          child: image == null
                              ? const Icon(Icons.add, size: 30, color: Colors.black45)
                              : null,
                        );
                      }),
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

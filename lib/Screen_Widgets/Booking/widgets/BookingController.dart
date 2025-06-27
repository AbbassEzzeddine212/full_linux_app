import 'package:get/get.dart';

import 'Model.dart';




class BookingController extends GetxController {
  var selectedCategory = 'Courts'.obs;

  final allItems = <BookingItem>[
    BookingItem(
      category: 'Courts',
      imagePath: 'assets/images/football.jpg',
      number: 'Football 1101',
      location: 'Building 1',
    ),
    BookingItem(
      category: 'Courts',
      imagePath: 'assets/images/tinnes.jpg',
      number: 'Tennis 1023',
      location: 'Building 1',
    ),
    BookingItem(
      category: 'Meeting Rooms',
      imagePath: 'assets/images/mettingRooms.jpeg',
      number: 'Meeting 201',
      location: 'Building 2',
    ),
    BookingItem(
      category: 'Office',
      imagePath: 'assets/images/office.jpg',
      number: 'Office 305',
      location: 'Building 3',
    ),
  ].obs;

  List<BookingItem> get filteredItems => allItems
      .where((item) => item.category == selectedCategory.value)
      .toList();
}
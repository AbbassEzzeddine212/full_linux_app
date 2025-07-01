

class BookingItem {
  final String category;
  final String imagePath;
  final String number;
  final String location;
  final String? status;
  final String? dateAndTime;

  BookingItem({
    required this.category,
    required this.imagePath,
    required this.number,
    required this.location,
    this.status,
    this.dateAndTime,
  });
}
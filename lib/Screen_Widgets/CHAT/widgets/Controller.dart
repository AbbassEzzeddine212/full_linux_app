import 'package:get/get.dart';

class ChatController extends GetxController {
  var messages = <Map<String, dynamic>>[].obs;

  void sendTextMessage(String text) {
    if (text.trim().isEmpty) return;

    messages.add({
      'type': 'text',
      'content': text.trim(),
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }
}
import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class ChatController extends GetxController {
  final chats = <Map<String, dynamic>>[
    {
      "name": "Andrew Parker",
      "message": "What kind of strategy is better?",
      "date": "11/16/19",
      "image": "assets/images/andrew.png", // Placeholder
      "isOnline": false,
      "unread": 0,
    },
    {
      "name": "Maximilian Jacobson",
      "message": "Bro, I have a good idea!",
      "date": "10/30/19",
      "image": "assets/images/max.png",
      "isOnline": false,
      "unread": 0,
    },
    {
      "name": "Martha Craig",
      "message": "Photo",
      "date": "10/28/19",
      "image": "assets/images/martha.png",
      "isOnline": false,
      "type": "photo",
      "unread": 0,
    },
    {
      "name": "Tabitha Potter",
      "message":
          "Actually I wanted to check with you about your online business plan on our...",
      "date": "8/25/19",
      "image": "assets/images/tabitha.png",
      "isOnline": true,
      "unread": 2,
    },
    {
      "name": "Maisy Humphrey",
      "message": "Welcome, to make design process faster, look at Pixellz",
      "date": "8/20/19",
      "image": "assets/images/maisy.png",
      "isOnline": false,
      "unread": 0,
    },
    {
      "name": "Kieron Dotson",
      "message": "Ok, have a good trip!",
      "date": "7/29/19",
      "image": "assets/images/kieron.png",
      "isOnline": true,
      "unread": 0,
    },
  ].obs;

  void onChatTap(Map<String, dynamic> chat) {
    Get.toNamed(Routes.CONTACT_PROFILE, arguments: chat);
  }
}

import 'package:chat_app/widgets/chat_messages.dart';
import 'package:chat_app/widgets/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;

    await fcm.requestPermission();
    // fcm.subscribeToTopic('chat');
    await FirebaseMessaging.instance.subscribeToTopic("chat");
    // final token = await fcm
    //     .getToken(); // fqLSGNNEThi_YCPtX7MkHk:APA91bH4Pz820y60a8FDYLrgmEiJY-RK9W1h-sIoz8GuXlKR_SRuaqpOl_siOyGDlJxrRyqEHhKNjMuW_ZGJmuMCpD2DZr0M90oMDUXdQ6dhiFEP2Mtlk1dj_mB2GgXEo_ua_cjcdk1l
    // print(
    //     token); // you could send this token(via HTTP or the Firestore SDK) to a backend
  }

  @override
  void initState() {
    super.initState();
    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Chat'),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app,
                  color: Theme.of(context).colorScheme.primary),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
        body: const Column(
          children: [
            Expanded(
              child: ChatMessages(),
            ),
            NewMessage()
          ],
        ));
  }
}

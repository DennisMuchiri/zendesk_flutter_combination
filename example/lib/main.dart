import 'package:flutter/material.dart';
import 'package:zendesk_messaging/zendesk_messaging.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const String androidChannelKey = "KEY_HERE";
  static const String iosChannelKey = "KEY_HERE";

  final List<String> channelMessages = [];

  @override
  void initState() {
    super.initState();
    // Optional, observe all incoming messages
    ZendeskMessaging.setMessageHandler((type, arguments) {
      setState(() {
        channelMessages.add("$type - args=$arguments");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var message = channelMessages.join("\n");

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Zendesk Messaging Example'),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                Text(message),
                ElevatedButton(
                  onPressed: () => ZendeskMessaging.initialize(androidChannelKey: androidChannelKey, iosChannelKey: iosChannelKey),
                  child: const Text("Initialize"),
                ),
                ElevatedButton(onPressed: () => ZendeskMessaging.show(), child: const Text("Show messaging")),
                ElevatedButton(onPressed: () => _login(), child: const Text("Login")),
                ElevatedButton(onPressed: () => ZendeskMessaging.logoutUser(), child: const Text("Logout")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    // You can attach local observer when calling some methods to be notified when ready
    ZendeskMessaging.loginUserCallbacks(
      jwt: "my_jwt",
      onSuccess: (id, externalId) => setState(() => channelMessages.add("Login observer SUCCESS: $id, $externalId")),
      onFailure: () => setState(() => channelMessages.add("Login observer FAILURE !")),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';

const appId = "b8a3c315e42f404d942bf27038aaaefd";
const token =
    "007eJxTYNAT2h9zNME49vvV+THP4va3vnFoLTiu5ap0f2PS472ak28pMCRZJBonGxuappoYpZkYmKRYmhglpRmZGxhbJCYmpqalWKbvTm0IZGTwV33HzMgAgSA+K0NyYk5OMQMDANOpITY=";
const channel = "calls";

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: appId,
      channelName: channel,
      tempToken: token,
    ),
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
    ],
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: client,
                layoutType: Layout.oneToOne,
              ),
              AgoraVideoButtons(
                client: client,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

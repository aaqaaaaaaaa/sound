// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_sound/public/flutter_sound_recorder.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);
//
//   @override
//   State<MainPage> createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   final recorder = FlutterSoundRecorder();
//   bool isRecorderReady = false;
//
//   @override
//   void initState() {
//     super.initState();
//     initRecorder();
//   }
//
//   @override
//   void dispose() {
//     recorder.closeRecorder();
//     super.dispose();
//   }
//
//   Future initRecorder() async {
//     final status = await Permission.microphone.request();
//     if (status != PermissionStatus.granted) {
//       throw 'Microphone permission not granted!';
//     }
//     await recorder.openRecorder();
//     isRecorderReady = true;
//     recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
//   }
//
//   Future record() async {
//     if (!isRecorderReady) return;
//     await recorder.startRecorder(toFile: 'audio');
//   }
//
//   Future stop() async {
//     if (!isRecorderReady) return;
//     final path = await recorder.stopRecorder();
//     final audioFile = File(path!);
//     print('Recorder audio: ${audioFile.absolute}');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade800,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             StreamBuilder<RecordingDisposition>(
//               stream: recorder.onProgress,
//               builder: (context, snapshot) {
//                 final duration =
//                 snapshot.hasData ? snapshot.data?.duration : Duration.zero;
//                 String twoDigits(int? n) => n.toString().padLeft(1);
//
//                 final twoDigitsMinutes =
//                 twoDigits(duration?.inMinutes.remainder(60));
//                 final twoDigitsSeconds =
//                 twoDigits(duration?.inSeconds.remainder(60));
//                 return Text(
//                   '$twoDigitsMinutes:$twoDigitsSeconds',
//                   style: const TextStyle(
//                       fontSize: 80, fontWeight: FontWeight.bold),
//                 );
//               },
//             ),
//             ElevatedButton(
//               style: ButtonStyle(
//                   shape: MaterialStateProperty.all(const CircleBorder())),
//               child: Icon(
//                 recorder.isRecording ? Icons.stop : Icons.mic_rounded,
//                 size: 60,
//               ),
//               onPressed: () async {
//                 if (recorder.isRecording) {
//                   await stop();
//                 } else {
//                   await record();
//                 }
//                 setState(() {});
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

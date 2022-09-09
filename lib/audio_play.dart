// import 'dart:io';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
//
// class AudioPlayPage extends StatefulWidget {
//   const AudioPlayPage({Key? key}) : super(key: key);
//
//   @override
//   State<AudioPlayPage> createState() => _AudioPlayPageState();
// }
//
// class _AudioPlayPageState extends State<AudioPlayPage> {
//   final audioPlayer = AudioPlayer();
//   bool isPlaying = false;
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;
//
//   @override
//   void initState() {
//     setAudio();
//     super.initState();
//     audioPlayer.onPlayerStateChanged.listen((event) {
//       setState(() {
//         isPlaying = event == PlayerState.playing;
//       });
//     });
//
//     audioPlayer.onPositionChanged.listen((event) {
//       setState(() {
//         position = event;
//       });
//     });
//
//     audioPlayer.onDurationChanged.listen((event) {
//       setState(() {
//         duration = event;
//       });
//     });
//   }
//
//   Future setAudio() async {
//     audioPlayer.setReleaseMode(ReleaseMode.loop);
//
//     final result = await FilePicker.platform.pickFiles();
//     if (result != null) {
//       final file = File(result.files.single.path!);
//       await audioPlayer.setSourceUrl(
//         file.path,
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image.network(
//                 'https://images.unsplash.com/photo-1656942942279-5f3530a68048?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
//                 width: double.infinity,
//                 height: 350,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const Text(
//               'Flutter Song',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               'Song Abs',
//               style: TextStyle(fontSize: 20),
//             ),
//             Slider(
//               min: 0,
//               max: duration.inSeconds.toDouble(),
//               value: position.inSeconds.toDouble(),
//               onChanged: (value) async {
//                 final position = Duration(seconds: value.toInt());
//                 await audioPlayer.seek(position);
//                 await audioPlayer.resume();
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(formatTime(duration)),
//                   Text(formatTime(duration - position)),
//                 ],
//               ),
//             ),
//             CircleAvatar(
//               radius: 35,
//               child: IconButton(
//                 icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
//                 iconSize: 50,
//                 onPressed: () async {
//                   if (isPlaying) {
//                     await audioPlayer.pause();
//                   } else {
//                     await audioPlayer.resume();
//                   }
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   String formatTime(Duration duration) {
//     String twoDuration(int n) => n.toString().padLeft(2, '0');
//     final hours = twoDuration(duration.inHours);
//     final minutes = twoDuration(duration.inMinutes.remainder(60));
//     final seconds = twoDuration(duration.inSeconds.remainder(60));
//
//     return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
//   }
// }

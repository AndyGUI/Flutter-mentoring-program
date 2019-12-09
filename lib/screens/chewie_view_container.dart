import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieViewContainer extends StatefulWidget {
  @override
  createState() => _ChewieViewContainerState();
}

class _ChewieViewContainerState extends State<ChewieViewContainer> {
  VideoPlayerController videoPlayerController;

  ChewieController chewieController;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Chewie(
          controller: chewieController,
        ));
  }
}

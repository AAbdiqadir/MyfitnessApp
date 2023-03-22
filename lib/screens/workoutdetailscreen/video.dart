import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class videoplayer extends StatefulWidget {
  // videoplayer({Key? key}) : super(key: key);

  videoplayer({
    super.key,

 required this.video





  });

  String video;


  @override
  State<videoplayer> createState() => _videoplayerState();
}

class _videoplayerState extends State<videoplayer> {

  late VideoPlayerController _controller;


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      widget.video,
    )..addListener(() { })..setLooping(true)..initialize().
    then((value) => _controller.play());

  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void _toggleVideoPlay() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    }
    _controller.pause();
    // } else {
    //   _controller.play();
    // }
    // setState(() {
    //   isVideoPlaying = _controller.value.isPlaying;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return  _controller!= null? Container(
        alignment: Alignment.topCenter,
        child: VideoPlayer( _controller),
    ):
    Container(
      child: Center (
        child: CircularProgressIndicator(),
      ),
    );
  }
}

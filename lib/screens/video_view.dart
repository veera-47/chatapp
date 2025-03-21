import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key, required this.file});
  final String file;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _controller;
  bool _isVideoLoaded = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() async {
    if (!File(widget.file).existsSync()) {
      print("Error: Video file does not exist.");
      return;
    }

    _controller = VideoPlayerController.file(File(widget.file));
    try {
      await _controller.initialize();
      setState(() {
        _isVideoLoaded = true;
      });
    } catch (e) {
      print("Error initializing video: $e");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.crop_rotate, size: 27, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.emoji_emotions_outlined,
                  size: 27, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.title, size: 27, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit, size: 27, color: Colors.white)),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: _isVideoLoaded
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : CircularProgressIndicator(),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.black38,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              child: TextFormField(
                style: TextStyle(color: Colors.white, fontSize: 17),
                maxLines: 6,
                minLines: 1,
                decoration: InputDecoration(
                  hintText: 'Add Caption....',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 27),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.add_photo_alternate,
                      color: Colors.white, size: 27),
                  suffixIcon: CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.tealAccent[700],
                    child: Icon(Icons.check, color: Colors.white, size: 27),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Colors.black38,
              radius: 30,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

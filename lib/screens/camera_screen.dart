import 'package:camera/camera.dart';
import 'package:chatapp/main.dart';
import 'package:chatapp/screens/camera_view.dart';
import 'package:chatapp/screens/video_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CameraScreen extends StatefulWidget {
  CameraScreen({super.key, required this.cameras});
  List<CameraDescription> cameras;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;

  late Future<void> cameraValue;
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: FutureBuilder(
                future: cameraValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Transform.scale(
                      scale: 1.3,
                      child: AspectRatio(
                          aspectRatio: _cameraController.value.aspectRatio,
                          child: CameraPreview(_cameraController)),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(bottom: 5, top: 5),
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          )),
                      GestureDetector(
                        onLongPress: () async {
                          if (!_cameraController.value.isInitialized ||
                              _cameraController.value.isRecordingVideo) {
                            return;
                          }
                          try {
                            await _cameraController.startVideoRecording();
                            setState(() {
                              isRecording = true;
                            });
                          } catch (e) {
                            print("Error starting video recording: $e");
                          }
                        },
                        onLongPressUp: () async {
                          if (isRecording) {
                            XFile videoFile =
                                await _cameraController.stopVideoRecording();
                            setState(() {
                              isRecording = false;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      VideoView(file: videoFile.path)),
                            );
                          }
                        },
                        child: InkWell(
                          onTap: () {
                            if (!isRecording) takePhoto(context);
                          },
                          child: isRecording
                              ? Icon(
                                  Icons.radio_button_on,
                                  color: Colors.red,
                                  size: 80,
                                )
                              : Icon(
                                  Icons.panorama_fish_eye,
                                  color: Colors.white,
                                  size: 70,
                                ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.flip_camera_android,
                            color: Colors.white,
                            size: 28,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Hold for Video, Tap for Photo',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    XFile file = await _cameraController.takePicture();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => CameraView(
                  file: file.path,
                )));
  }
}

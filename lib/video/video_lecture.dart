// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';
import '../res/app_icons.dart';
import '../res/app_video.dart';
import '../res/formatNumber.dart';

class VideoLecture extends StatefulWidget {
  final String videoUrl;
  final String videoImage;
  final String title;
  final int views;
  final int likes;
  final int comments;
  final String description;
  const VideoLecture(
      {super.key,
        required this.videoUrl,
        required this.title,
        required this.views,
        required this.likes,
        required this.comments, required this.videoImage, required this.description});

  @override
  State<VideoLecture> createState() => _VideoLectureState();
}

class _VideoLectureState extends State<VideoLecture> {
  late VideoPlayerController videoController;
  double currentSliderValue = 0.0;
  bool isSliderMoving = false;
  Duration videoDuration = Duration.zero;
  late Duration videoPosition = Duration.zero;
  bool areControlsVisible = true;
  late VideoPlayerController videoController1;

  void toggleControlsVisibility() {
    setState(() {
      areControlsVisible = !areControlsVisible;
    });
  }
  @override
  void initState() {
    super.initState();
    videoController1 = VideoPlayerController.asset(AppVideo.video2);
    videoController1.initialize().then((_) => {});
    videoController =  VideoPlayerController.asset(widget.videoUrl,)
      ..initialize().then((_) {
        setState(() {
          videoDuration = videoController.value.duration;
          videoController.addListener(() {
            if (!isSliderMoving) {
              final duration = videoController.value.duration.inMilliseconds.toDouble();
              final position = videoController.value.position.inMilliseconds.toDouble();
              setState(() {
                videoPosition = videoController.value.position;
                currentSliderValue = position / duration;
              });
            }
          });
        });
      });
  }

  @override
  void dispose() {
    videoController.dispose();
    videoController1.dispose();
    super.dispose();
  }

  void onSliderChanged(double value) {
    setState(() {
      currentSliderValue = value;
    });
  }

  void onSliderChangeStart(double value) {
    setState(() {
      isSliderMoving = true;
    });
  }

  void onSliderChangeEnd(double value) {
    // Mettre à jour la position de la vidéo en fonction du slider
    final newPosition = value * videoDuration.inMilliseconds;
    videoController.seekTo(Duration(milliseconds: newPosition.round()));
    setState(() {
      isSliderMoving = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    GestureDetector(
                      onTap:() => toggleControlsVisibility(),
                      child:(!videoController.value.isPlaying && videoPosition == Duration.zero)?
                      Image.asset(widget.videoImage,fit: BoxFit.cover,):
                      AspectRatio(
                        aspectRatio:videoController.value.aspectRatio,
                        child: VideoPlayer(videoController),
                      ),

                    ),
                    if(areControlsVisible)
                      Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        videoController.value.isPlaying
                                            ? videoController.pause()
                                            : videoController.play();
                                      });
                                    },
                                    icon: Icon(
                                      videoController.value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      size: 40,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        '${videoPosition.inMinutes}:${(videoPosition.inSeconds % 60).toString().padLeft(2, '0')}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.only(right: 8)),
                                      Expanded(
                                        child: Slider(

                                          activeColor:
                                          Color.fromRGBO(29, 117, 189, 1),
                                          value: currentSliderValue,
                                          onChanged: onSliderChanged,
                                          onChangeStart: onSliderChangeStart,
                                          onChangeEnd: onSliderChangeEnd,
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.only(left: 8)),
                                      Text(
                                        '${videoDuration.inMinutes}:${(videoDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                  ],
                ),

              ),
              Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              widget.title,
                              style: TextStyle(fontSize: 16),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${NumberFormatter.formatNumber(widget.views)} vues',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(153, 153, 153, 1),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border)),
                            Text(
                              '${NumberFormatter.formatNumber(widget.likes)} Likes',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  AppIcons.shareIcons,
                                  width: 26,
                                  height: 26,
                                )),
                            Text('Shares',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  AppIcons.favorisIcons,
                                  width: 26,
                                  height: 26,
                                )),
                            Text('Favoris',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                )),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                                widget.description,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromRGBO(85, 85, 85, 1),
                                )))
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text('Commentaires',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        Padding(padding: EdgeInsets.only(left: 40)),
                        Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color.fromRGBO(250, 216, 125, 1),
                          ),
                          child: Text(
                            '${widget.comments}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(51, 51, 51, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            hintText: 'Comment',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color.fromRGBO(217, 217, 217, 1),
                            suffixIcon: Container(
                              margin: EdgeInsets.all(2),
                              width: 30,
                              decoration: BoxDecoration(

                                shape: BoxShape.circle,
                                color: Color.fromRGBO(29, 117, 189, 1),
                              ),
                              // padding: EdgeInsets.all(5.0),
                              child: IconButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   widget.comments++;
                                    // });
                                  },
                                  icon: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                    size: 24,
                                  )),
                            ),
                          ),
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Text(
                          'Videos Similaires',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 25,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width ,
                      height: 250,
                      child: Stack(
                        fit: StackFit.expand,
                        children:[
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child:VideoPlayer(videoController1)
                            //  Image.asset(
                            //    'images/masdjid.jpeg',
                            //    fit: BoxFit.cover,
                            //  ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () { },
                                icon: Icon(Icons.play_arrow,size: 40,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text("Islam et la Negritude par MCATS",
                          style: TextStyle(fontSize: 16,color: Color.fromRGBO(51, 51, 51, 1)),
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(onPressed: null, icon: SvgPicture.asset(AppIcons.shareIcons,width: 24,height: 24,)),
                            IconButton(onPressed: null, icon: SvgPicture.asset(AppIcons.favorisIcons,width: 24,height: 24,)),
                          ],
                        )

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("513 vues . poste le 02 jan",
                          style: TextStyle(fontSize: 12,color: Color.fromRGBO(153, 153, 153, 1)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}

import 'package:flutter/material.dart';
import 'package:pinkvilla_flutter/ColorConstants/colors.dart';
import 'package:video_player/video_player.dart';

import 'RightPanel.dart';
import 'header_home_page.dart';
import 'left_panel.dart';
class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String title;
  final String name;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  VideoPlayerItem(
      {Key key,
        @required this.size,
        this.title,
        this.profileImg,
        this.likes,
        this.comments,
        this.shares,
        this.videoUrl, this.name})
      : super(key: key);

  final Size size;

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  VideoPlayerController _videoController;
  bool isShowPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _videoController = VideoPlayerController.network(widget.videoUrl)..setLooping(true)
      ..initialize().then((value) {
        _videoController.play();
        setState(() {

          isShowPlaying = false;
        });
      });


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoController.dispose();


  }
  Widget isPlaying(){
    return _videoController.value.isPlaying && !isShowPlaying  ? Container() : Icon(Icons.play_arrow,size: 80,color: white.withOpacity(0.5),);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _videoController.value.isPlaying
              ? _videoController.pause()
              : _videoController.play();
        });
      },
      child: RotatedBox(
        quarterTurns: -1,
        child: Container(
            height: widget.size.height,
            width: widget.size.width,
            child: Stack(
              children: <Widget>[
                Container(
                  height: widget.size.height,
                  width: widget.size.width,
                  decoration: BoxDecoration(color: black),
                  child: Stack(
                    children: <Widget>[
                      VideoPlayer(_videoController),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                          ),
                          child: isPlaying(),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: widget.size.height,
                  width: widget.size.width,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          HeaderHomePage(),
                          Expanded(
                              child: Row(
                                children: <Widget>[
                                  LeftPanel(
                                    size: widget.size,
                                    name: "${widget.name}",
                                  ),
                                  RightPanel(
                                    size: widget.size,
                                    likes: "${widget.likes}",
                                    comments: "${widget.comments}",
                                    shares: "${widget.shares}",
                                    profileImg: "${widget.profileImg}",

                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
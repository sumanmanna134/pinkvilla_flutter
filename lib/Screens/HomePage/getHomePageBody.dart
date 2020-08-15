import 'package:flutter/material.dart';
import 'package:pinkvilla_flutter/widgets/VideoPlayer.dart';
class getHomePageData extends StatefulWidget {
  final List pinkVila;



  const getHomePageData({Key key, this.pinkVila}) : super(key: key);

  @override
  _getHomePageDataState createState() => _getHomePageDataState();
}

class _getHomePageDataState extends State<getHomePageData> with SingleTickerProviderStateMixin {
  TabController _tabController;


  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: widget.pinkVila.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
        controller: _tabController,
        children: List.generate(widget.pinkVila.length, (index) {
          return VideoPlayerItem(
            videoUrl: widget.pinkVila[index].videoUrl,
            size: size,
            name: widget.pinkVila[index].name,
            profileImg: widget.pinkVila[index].profileImg,
            likes: widget.pinkVila[index].likes.toString(),
            comments: widget.pinkVila[index].comments.toString(),
            shares: widget.pinkVila[index].shares.toString(),
          );
        }),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/screens/video_player_view_container.dart';
import 'package:flutter_mentoring_programm/screens/web_view_container.dart';

import 'chewie_view_container.dart';
import 'map_view_container.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _webViewButton(context),
              _mapViewButton(context),
              _videoPlayerViewButton(context),
              _chewieViewButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _webViewButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: FlatButton(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        child: Text('https://google.com'),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WebViewContainer('https://google.com'),
          ),
        ),
      ),
    );
  }

  Widget _mapViewButton(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: FlatButton(
            color: Theme.of(context).primaryColor,
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
            child: Text("Go for G"),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MapViewContainer()))));
  }

  Widget _videoPlayerViewButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: FlatButton(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        child: Text("Let's play some video..."),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VideoPlayerViewContainer(),
          ),
        ),
      ),
    );
  }

  Widget _chewieViewButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: FlatButton(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        child: Text("Let's play video with chewie!"),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChewieViewContainer(),
          ),
        ),
      ),
    );
  }
}

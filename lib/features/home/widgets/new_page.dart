import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NewPage extends StatelessWidget {
  final List<String> videoUrls = [
    'https://www.youtube.com/shorts/wPKiH7Qv7TI', // Example YouTube shorts URLs
    'https://www.youtube.com/shorts/jtIrwHY39jo', // Add more shorts URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SocioGram Player'),
      ),
      body: Container(
        color: Colors.white38,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: PageView.builder(
                itemCount: videoUrls.length,
                itemBuilder: (context, index) {
                  return VideoPlayer(videoUrl: videoUrls[index]);
                },
              ),
            ),
            SizedBox(height: 16), // Space between video player and text
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Text(
                    'Ashwatthama was the son of Guru Dronacharya – the teacher of both Kauravas and the Pandavas. Guru Dronacharya, or Guru Drona (as often called) was a brilliant sage, adept in the art of warfare and master of the divine weapons or astra. Guru Dronas son, Ashwathama was born with a mani or a divine gem on his forehead.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18, // Adjusted font size for better readability
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayer extends StatelessWidget {
  final String videoUrl;

  const VideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  String getVideoIdFromUrl(String url) {
    // Extracting video ID for YouTube shorts
    final Uri uri = Uri.parse(url);
    final List<String> pathSegments = uri.pathSegments;
    return pathSegments.contains('shorts') ? pathSegments.last : '';
  }

  @override
  Widget build(BuildContext context) {
    final String videoId = getVideoIdFromUrl(videoUrl);
    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black,
      ),
      clipBehavior: Clip.antiAlias,
      child: AspectRatio(
        aspectRatio: 16 / 9, // Aspect ratio of YouTube videos
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          topActions: <Widget>[
            SizedBox(width: 30.0),
            Expanded(
              child: Text(
                _controller.metadata.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.white, size: 22.0),
              onPressed: () {},
            ),
          ],
          onReady: () {
            _controller.addListener(() {});
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NewPage(),
  ));
}

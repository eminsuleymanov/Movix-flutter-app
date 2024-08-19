import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailerDialog extends StatefulWidget {
  const MovieTrailerDialog({super.key, required this.trailerUrl});
  final String trailerUrl;

  @override
  State<MovieTrailerDialog> createState() => _MovieTrailerDialogState();
}

class _MovieTrailerDialogState extends State<MovieTrailerDialog> {
  late YoutubePlayerController _controller;

 @override
  void initState() {
    super.initState();
    if (widget.trailerUrl.isNotEmpty) {
      _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.trailerUrl) ?? '',
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );

      _controller.addListener(() {
        if (_controller.value.isFullScreen) {
          // Entering fullscreen
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
        } else {
          // Exiting fullscreen
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]);
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.all(10),
      backgroundColor: Colors.transparent,
      content: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () => debugPrint('YouTube Player is ready'),
        bottomActions: const [
          CurrentPosition(),
          ProgressBar(
            isExpanded: true,
            colors: ProgressBarColors(
              playedColor: Colors.orange,
              handleColor: Colors.orangeAccent,
            ),
          ),
          PlaybackSpeedButton(),
          FullScreenButton(),
        ],
      ),
    );
  }
}

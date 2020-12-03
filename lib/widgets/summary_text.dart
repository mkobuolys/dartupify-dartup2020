import 'package:flutter/widgets.dart';

import 'package:dartupify/helpers/time_helper.dart';

class SummaryText extends StatelessWidget {
  final int songsCount;
  final int duration;

  const SummaryText({
    @required this.songsCount,
    @required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Text(
          '${songsCount} ${songsCount == 1 ? 'song' : 'songs'}, ${TimeHelper.secondsToText(duration)}',
        ),
      ),
    );
  }
}

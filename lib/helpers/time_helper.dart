class TimeHelper {
  static String secondsToText(int seconds) {
    var minutes = seconds ~/ 60;
    var hours = seconds ~/ 3600;

    var formatWithLeadingZero =
        (int number) => number.toString().padLeft(2, '0');

    if (hours > 0) {
      return '${formatWithLeadingZero(hours)}:${formatWithLeadingZero(minutes - hours * 60)}:${formatWithLeadingZero(seconds - minutes * 60)}';
    } else if (minutes > 0) {
      return '${formatWithLeadingZero(minutes)}:${formatWithLeadingZero(seconds - minutes * 60)}';
    } else {
      return '0:${formatWithLeadingZero(seconds)}';
    }
  }
}

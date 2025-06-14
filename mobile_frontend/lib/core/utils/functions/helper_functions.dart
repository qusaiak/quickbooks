import 'dart:math';

import "package:html/parser.dart" as html_parser;
import 'package:intl/intl.dart';


String arabicToDecimal(String number) {
  List<int> chars = List<int>.filled(number.length, 0);

  for (int i = 0; i < number.length; i++) {
    int ch = number.codeUnitAt(i);
    if (ch >= 0x0660 && ch <= 0x0669) {
      ch -= 0x0660 - '0'.codeUnitAt(0);
    } else if (ch >= 0x06f0 && ch <= 0x06F9) {
      ch -= 0x06f0 - '0'.codeUnitAt(0);
    }
    chars[i] = ch;
  }

  return String.fromCharCodes(chars);
}

String prettyCount(int number) {
  List<String> suffix = [' ', 'k', 'M', 'B', 'T', 'P', 'E'];
  int value = (number > 0) ? (log(number) / log(10)).floor() : 0;
  int base = value ~/ 3;

  if (value >= 3 && base < suffix.length) {
    NumberFormat formatter = NumberFormat('#0.0');
    double formattedNumber = number / pow(10, base * 3);
    return formatter.format(formattedNumber) + suffix[base];
  } else {
    NumberFormat formatter = NumberFormat('#,##0');
    return formatter.format(number);
  }
}

String formatTime(String duration) {
  int secondsDuration = int.parse(duration);

  int minutes = secondsDuration ~/ 60;
  int seconds = secondsDuration % 60;

  if (minutes >= 60) {
    int hours = secondsDuration ~/ 3600;
    minutes -= (hours * 60);
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  } else {
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}

int convertToSecs(String time) {
  if (!time.contains(":")) {
    time = "0:$time";
  }
  int hours = 0, minutes, seconds;
  List<String> units = time.split(":");
  if (units.length == 2) {
    minutes = int.parse(units[0]);
    seconds = int.parse(units[1]);
  } else {
    hours = int.parse(units[0]);
    minutes = int.parse(units[1]);
    seconds = int.parse(units[2]);
  }
  return (3600 * hours + 60 * minutes + seconds);
}

String ms2Text(int milliSeconds) {
  int seconds = milliSeconds ~/ 1000;
  if (milliSeconds % 1000 > 499) {
    seconds++;
  }
  int minutes = seconds ~/ 60;
  int hours = minutes ~/ 60;
  int remainingSeconds = seconds % 60;
  int remainingMinutes = minutes % 60;
  if (hours > 0) {
    return "${hours.toString().padLeft(2, '0')}:${remainingMinutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
  } else {
    return "${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
  }
}

String getReleaseYear(String releaseYear) {
  int l = releaseYear.length;
  if (l > 4) {
    List<String> separated = releaseYear.split("-");
    return separated[0];
  } else {
    return releaseYear;
  }
}

String parseHtmlToPlainText(String htmlString) {
  final document = html_parser.parse(htmlString);
  return document.body?.text ?? '';
}

String formatPrettyTime(String input) {
  if (!input.contains(':')) return 'Invalid time format';

  final parts = input.split(':');
  final minutes = int.tryParse(parts[0]) ?? 0;
  final hours = minutes ~/ 60;
  final remainingMinutes = minutes % 60;

  if (hours > 0) {
    return ' ${hours}h ${remainingMinutes}m';
  } else {
    return ' ${remainingMinutes}m';
  }
}
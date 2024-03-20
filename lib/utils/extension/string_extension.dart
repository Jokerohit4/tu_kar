part of 'extension.dart';

extension StrExtension on String {
  bool isNumeric() => double.tryParse(this) != null;

  bool validDouble() => double.tryParse(this) != null && double.parse(this) > 0;

  Color colorFromHex() {
    final hexCode = replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}

extension ColorExtension on String {
  Color toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "ff$hexColor";
      return Color(int.parse("0x$hexColor"));
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return Colors.white;
  }
}

extension TimeExtension on String {
// TimeOfDay _startTime = TimeOfDay(hour:int.parse(s.split(":")[0]),minute: int.parse(s.split(":")[1]));
  TimeOfDay toTime() {
    var time = TimeOfDay(
        hour: int.parse(split(":")[0]), minute: int.parse(split(":")[1]));

    return time;
  }
}

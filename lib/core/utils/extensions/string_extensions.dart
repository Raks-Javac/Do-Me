import 'package:intl/intl.dart';

extension StringExtension on String {
  List<String> splitByLength({int length = 2, bool ignoreEmpty = false}) {
    List<String> pieces = [];

    for (int i = 0; i < this.length; i += length) {
      int offset = i + length;
      String piece = substring(i, offset >= this.length ? this.length : offset);

      if (ignoreEmpty) {
        piece = piece.replaceAll(RegExp(r'\s+'), '');
      }

      pieces.add(piece);
    }
    return pieces;
  }

  String filterHashTags() {
    final List<String> hashTags = [];

    RegExp regex = RegExp(r'#\S+');
    Iterable<Match> matches = regex.allMatches(this);

    for (Match match in matches) {
      hashTags.add(match.group(0)!);
    }

    if (hashTags.isEmpty) {
      return "";
    } else {
      return hashTags[0];
    }
  }

  //

  String toFormattedDate() {
    // Parse the input string as DateTime
    DateTime dateTime = DateTime.parse(this);

    // Format the DateTime object to the desired format
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

    return formattedDate;
  }

  //

  String toFormattedTime() {
    // Parse the input string as DateTime
    DateTime dateTime = DateTime.parse(this);

    // Extract the time components
    String formattedTime =
        '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';

    return formattedTime;
  }
}

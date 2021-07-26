import 'dart:math' as Math;

enum Bases { Metric, Binary }

class ProperFilesize {
  /// Available units
  static const List<String> units = ['', 'K', 'M', 'G', 'T', 'P', 'E'];

  /// Establishes relation between type of Bases and their logarithmic value
  static const Map<Bases, num> basesValue = {
    Bases.Metric: 1000,
    Bases.Binary: 1024
  };

  /// Establishes relation between type of Bases and their human readable representation
  static const Map<Bases, String> basesString = {
    Bases.Metric: 'B',
    Bases.Binary: 'iB'
  };

  // converts natural logarithms to base 1000 or base 1024 logarithms
  static double _logBase(num x, num base) => Math.log(x) / Math.log(base);

  /// Generates a human readable string in xiB or xB from an int size in bytes
  /// Provide base (binary/metric) and decimals
  /// Defaults to binary units and 3 decimals
  static String generateHumanReadableFilesize(num size,
      {Bases base = Bases.Binary, int decimals = 3}) {
    if (size > (basesValue[base] ?? 1024)) {
      int index = ((_logBase(size, basesValue[base] ?? 1024)).floor());
      String unit = units[index];

      num value = size / (Math.pow(basesValue[base] ?? 1024, index) * 1.0);

      return "${value.toStringAsFixed(decimals)} $unit${basesString[base]}";
    }
    return "${size.toStringAsFixed(decimals)} B";
  }

  /// Converts a human readable filesize string (either in metric or in binary units) to an integer number of bytes
  static num parseHumanReadableFilesize(String input) {
    num size = 0;

    //converts xiB or xB to bytes
    for (var base in basesString.entries.toList().reversed) {
      for (var unit in units.reversed) {
        if (input.contains("$unit${basesString[base.key]}")) {
          num value = num.parse(
              input.replaceAll("$unit${basesString[base.key]}", "").trim());
          size = (value *
              (Math.pow(basesValue[base.key] ?? 1024, units.indexOf(unit))));

          return size;
        }
      }
    }

    return size;
  }
}

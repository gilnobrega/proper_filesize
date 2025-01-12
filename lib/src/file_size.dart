import 'dart:math' as Math;

import 'package:proper_filesize/src/format_type.dart';
import 'package:proper_filesize/src/unit_type.dart';
import 'package:proper_filesize/src/unit_data.dart';

import 'base_type.dart';

class FileSize {
  // converts natural logarithms to base 1000 or base 1024 logarithms
  static double _logBase(num x, num _base) => Math.log(x) / Math.log(_base);

  /// Generates a human readable string in xiB or xB from an int size in bytes
  /// Provide base (binary/metric) and decimals
  /// Defaults to binary units and 3 decimals
  static String generateHumanReadableFilesize(
    num size, {
    BaseType baseType = BaseType.binary,
    int decimals = 3,
    FormatType representationType = FormatType.short,
  }) {
    final unit = UnitData(
        unitType: UnitType.values.firstWhere((unit) =>
            unit.exponent == ((_logBase(size, baseType.value)).floor())),
        baseType: baseType,
        formatType: representationType);

    num value = size / (Math.pow(unit.baseType.value, unit.unitType.exponent));

    return "${value.toStringAsFixed(decimals)} $unit";
  }

  /// Converts a human readable filesize string (either in metric or in binary units) to an integer number of bytes
  static num parseHumanReadableFilesize(String input) {
    input = input.trim().toLowerCase();
    final detectedUnit = UnitType.values
        .expand((prefix) => prefix.representation.entries.expand(
              (baseType) => baseType.value.entries.map(
                (unit) => UnitData(
                    unitType: prefix,
                    baseType: baseType.key,
                    formatType: unit.key),
              ),
            ))
        .firstWhere(
          (unit) => input.endsWith(
            unit.toString().toLowerCase(),
          ),
        );

    final parsedValue = num.parse(
      input.substring(0, input.length - detectedUnit.toString().length),
    );

    return (parsedValue *
        Math.pow(
          detectedUnit.baseType.value,
          detectedUnit.unitType.exponent,
        ));
  }
}

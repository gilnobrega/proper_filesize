import 'dart:math' as Math;

import 'package:proper_filesize/src/format_type.dart';
import 'package:proper_filesize/src/unit.dart';

import 'base_type.dart';

final class FileSize {
  /// Size in bytes
  final num size;

  FileSize(
    num size, {
    Unit inputUnit = Unit.byte,
  }) : size = size *
            Math.pow(
              inputUnit.baseType.value,
              inputUnit.orderOfMagnitude,
            );

  /// Converts a human readable filesize string (either in metric or in binary units) to an integer number of bytes
  FileSize.parse(
    String input,
  ) : size = (() {
          input = input.trim();

          final detectedUnit = Unit.parse(input);

          final parsedValue = num.parse(
            input.substring(
                input.codeUnits.indexWhere((codeUnit) => codeUnit.isNumeric()),
                input.codeUnits
                        .lastIndexWhere((codeUnit) => codeUnit.isNumeric()) +
                    1),
          );

          return (parsedValue *
              Math.pow(
                detectedUnit.baseType.value,
                detectedUnit.orderOfMagnitude,
              ));
        })();

  /// Generates a human readable string in xiB or xB from an int size in bytes
  /// Provide base (binary/metric) and decimals
  /// Defaults to binary units and 3 decimals
  @override
  String toString({
    Unit? unit,
    FormatType formatType = FormatType.short,
    int decimals = 3,
  }) {
    unit ??= Unit.auto(
      size: size,
      baseType: BaseType.binary,
    );

    num value = toSize(unit: unit);

    return "${value.toStringAsFixed(decimals)} ${unit.representation[formatType]}";
  }

  num toSize({required Unit unit}) {
    return size / (Math.pow(unit.baseType.value, unit.orderOfMagnitude));
  }
}

extension _IntX on int {
  bool isNumeric() => '0123456789'.codeUnits.contains(this);
}

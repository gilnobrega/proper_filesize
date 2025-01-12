import "dart:math" as math;

import "package:proper_filesize/src/base_type.dart";

import "package:proper_filesize/src/format_type.dart";
import "package:proper_filesize/src/unit.dart";

final class FileSize {

  FileSize(
    final num size, {
    final Unit inputUnit = Unit.byte,
  }) : size = size *
            math.pow(
              inputUnit.baseType.value,
              inputUnit.orderOfMagnitude,
            );

  /// Converts a human readable filesize string (either in metric or 
  /// in binary units) to an integer number of bytes
  FileSize.parse(
    final String input,
  ) : size = (() {
          final Unit detectedUnit = Unit.parse(input);
          final num parsedValue = num.parse(input.numericPart);
          final num multiplierToBytes = math.pow(
                detectedUnit.baseType.value,
                detectedUnit.orderOfMagnitude,
          );
          return parsedValue * multiplierToBytes;
        })();
  /// Size in bytes
  final num size;

  /// Generates a human readable string in xiB or xB from an int size in bytes
  /// Provide base (binary/metric) and decimals
  /// Defaults to binary units and 3 decimals
  @override
  String toString({
    Unit? unit,
    final FormatType formatType = FormatType.short,
    final int decimals = 3,
  }) {
    unit ??= Unit.auto(
      size: size,
      baseType: BaseType.binary,
    );

    final num value = toSize(unit: unit);

    final String valueStr = ((value % 1 == 0)
        ? value.toInt().toString()
        : value.toStringAsFixed(decimals));

    final String unitStr = unit.representation[formatType]!;

    return "$valueStr $unitStr";
  }

  num toSize({required final Unit unit}) =>
      size / (math.pow(unit.baseType.value, unit.orderOfMagnitude));
}

extension _IntX on int {
  bool isNumeric() => "0123456789".codeUnits.contains(this);
}

extension _StringX on String {
  String get numericPart => substring(
        codeUnits.indexWhere((final int codeUnit) => codeUnit.isNumeric()),
        codeUnits.lastIndexWhere((final int codeUnit) => codeUnit.isNumeric()) +
            1,
      );
}

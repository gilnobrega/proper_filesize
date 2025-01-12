import "dart:math" as math;

import "package:proper_filesize/src/base_type.dart";
import "package:proper_filesize/src/format_type.dart";

enum Unit {
  byte(
    orderOfMagnitude: 0,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "B",
      FormatType.long: "byte",
    },
  ),
  kilobyte(
    orderOfMagnitude: 1,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "KB",
      FormatType.long: "kilobyte",
    },
  ),
  megabyte(
    orderOfMagnitude: 2,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "MB",
      FormatType.long: "megabyte",
    },
  ),
  gigabyte(
    orderOfMagnitude: 3,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "GB",
      FormatType.long: "gigabyte",
    },
  ),
  terabyte(
    orderOfMagnitude: 4,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "TB",
      FormatType.long: "terabyte",
    },
  ),
  petabyte(
    orderOfMagnitude: 5,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "PB",
      FormatType.long: "petabyte",
    },
  ),
  exabyte(
    orderOfMagnitude: 6,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "EB",
      FormatType.long: "exabyte",
    },
  ),
  zetabyte(
    orderOfMagnitude: 7,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "ZB",
      FormatType.long: "zettabyte",
    },
  ),
  yottabyte(
    orderOfMagnitude: 8,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "YB",
      FormatType.long: "yottabyte",
    },
  ),
  kibibyte(
    orderOfMagnitude: 1,
    baseType: BaseType.binary,
    representation: <FormatType, String>{
      FormatType.short: "KiB",
      FormatType.long: "kibibyte",
    },
  ),
  mebibyte(
    orderOfMagnitude: 2,
    baseType: BaseType.binary,
    representation: <FormatType, String>{
      FormatType.short: "MiB",
      FormatType.long: "mebibyte",
    },
  ),
  gibibyte(
    orderOfMagnitude: 3,
    baseType: BaseType.binary,
    representation: <FormatType, String>{
      FormatType.short: "GiB",
      FormatType.long: "gibibyte",
    },
  ),
  tebibyte(
    orderOfMagnitude: 4,
    baseType: BaseType.binary,
    representation: <FormatType, String>{
      FormatType.short: "TiB",
      FormatType.long: "tebibyte",
    },
  ),
  pebibyte(
    orderOfMagnitude: 5,
    baseType: BaseType.binary,
    representation: <FormatType, String>{
      FormatType.short: "PiB",
      FormatType.long: "pebibyte",
    },
  ),
  exbibyte(
    orderOfMagnitude: 6,
    baseType: BaseType.binary,
    representation: <FormatType, String>{
      FormatType.short: "EiB",
      FormatType.long: "exbibyte",
    },
  ),
  zebibyte(
    orderOfMagnitude: 7,
    baseType: BaseType.binary,
    representation: <FormatType, String>{
      FormatType.short: "ZiB",
      FormatType.long: "zebibyte",
    },
  ),
  yobibyte(
    orderOfMagnitude: 8,
    baseType: BaseType.binary,
    representation: <FormatType, String>{
      FormatType.short: "YiB",
      FormatType.long: "yobibyte",
    },
  ),
  ;

  const Unit({
    required this.orderOfMagnitude,
    required this.baseType,
    required this.representation,
  });
  final int orderOfMagnitude;
  final BaseType baseType;
  final Map<FormatType, String> representation;

  /// Largest unit for a given number of bytes
  static Unit auto({
    required final num size,
    required final BaseType baseType,
  }) {
    final int inputOrderOfMagnitude =
        size < baseType.value ? 0 : _logBase(size, baseType.value).floor();
    return Unit.values
        .where((final Unit unit) => unit.baseType == baseType)
        .toList()
        .sortFromSmallestToLargest()
        .lastWhere(
          (final Unit unit) => unit.orderOfMagnitude <= inputOrderOfMagnitude,
          orElse: () => Unit.byte,
        );
  }

  static Unit parse(final String input) =>
      Unit.values.toList().sortFromLargestToSmallest().firstWhere(
            (final Unit unit) => unit.representation.entries.any(
              (final MapEntry<FormatType, String> entry) =>
                  input.contains(entry.value),
          ),
          orElse: () => Unit.byte,
          );
}

// converts natural logarithms to base 1000 or base 1024 logarithms
double _logBase(final num x, final num basee) => math.log(x) / math.log(basee);

extension _ListUnitX on List<Unit> {
  List<Unit> sortFromSmallestToLargest() => this
    ..sort(
      (final Unit unitA, final Unit unitB) =>
          unitA.orderOfMagnitude.compareTo(unitB.orderOfMagnitude),
    );

  List<Unit> sortFromLargestToSmallest() => this
    ..sort(
      (final Unit unitA, final Unit unitB) =>
          unitB.orderOfMagnitude.compareTo(unitA.orderOfMagnitude),
    );
}

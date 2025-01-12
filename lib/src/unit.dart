import "dart:math" as math;

import "package:proper_filesize/src/base_type.dart";
import "package:proper_filesize/src/format_type.dart";

/// An enum representing the units of file size.
enum Unit {
  /// The byte unit.
  byte(
    orderOfMagnitude: 0,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "B",
      FormatType.long: "byte",
    },
  ),

  /// The kilobyte unit.
  kilobyte(
    orderOfMagnitude: 1,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "KB",
      FormatType.long: "kilobyte",
    },
  ),

  /// The megabyte unit.
  megabyte(
    orderOfMagnitude: 2,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "MB",
      FormatType.long: "megabyte",
    },
  ),

  /// The gigabyte unit.
  gigabyte(
    orderOfMagnitude: 3,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "GB",
      FormatType.long: "gigabyte",
    },
  ),

  /// The terabyte unit.
  terabyte(
    orderOfMagnitude: 4,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "TB",
      FormatType.long: "terabyte",
    },
  ),

  /// The petabyte unit.
  petabyte(
    orderOfMagnitude: 5,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "PB",
      FormatType.long: "petabyte",
    },
  ),

  /// The exabyte unit.
  exabyte(
    orderOfMagnitude: 6,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "EB",
      FormatType.long: "exabyte",
    },
  ),

  /// The zetabyte unit.
  zetabyte(
    orderOfMagnitude: 7,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "ZB",
      FormatType.long: "zettabyte",
    },
  ),

  /// The yottabyte unit.
  yottabyte(
    orderOfMagnitude: 8,
    baseType: BaseType.metric,
    representation: <FormatType, String>{
      FormatType.short: "YB",
      FormatType.long: "yottabyte",
    },
  ),

  /// The kibibyte unit.
  kibibyte(
    orderOfMagnitude: 1,
    baseType: BaseType.binary,
    representation: <FormatType, String>{
      FormatType.short: "KiB",
      FormatType.long: "kibibyte",
    },
  ),

  /// The mebibyte unit.
  mebibyte(
    orderOfMagnitude: 2,
    baseType: BaseType.binary,
    representation: <FormatType, String>{
      FormatType.short: "MiB",
      FormatType.long: "mebibyte",
    },
  ),

  /// The gibibyte unit.
  gibibyte(
    orderOfMagnitude: 3,
    baseType: BaseType.binary,
    representation: <FormatType, String>{
      FormatType.short: "GiB",
      FormatType.long: "gibibyte",
    },
  ),

  /// The tebibyte unit.
  tebibyte(
    orderOfMagnitude: 4,
    baseType: BaseType.binary,
    representation: <FormatType, String>{
      FormatType.short: "TiB",
      FormatType.long: "tebibyte",
    },
  ),

  /// The pebibyte unit.
  pebibyte(
    orderOfMagnitude: 5,
    baseType: BaseType.binary,
    representation: <FormatType, String>{
      FormatType.short: "PiB",
      FormatType.long: "pebibyte",
    },
  ),

  /// The exbibyte unit.
  exbibyte(
    orderOfMagnitude: 6,
    baseType: BaseType.binary,
    representation: <FormatType, String>{
      FormatType.short: "EiB",
      FormatType.long: "exbibyte",
    },
  ),

  /// The zebibyte unit.
  zebibyte(
    orderOfMagnitude: 7,
    baseType: BaseType.binary,
    representation: <FormatType, String>{
      FormatType.short: "ZiB",
      FormatType.long: "zebibyte",
    },
  ),

  /// The yobibyte unit.
  yobibyte(
    orderOfMagnitude: 8,
    baseType: BaseType.binary,
    representation: <FormatType, String>{
      FormatType.short: "YiB",
      FormatType.long: "yobibyte",
    },
  ),
  ;

  /// Creates a [Unit] object.
  ///
  /// The [orderOfMagnitude] parameter specifies the order of magnitude of the
  /// unit.
  /// The [baseType] parameter specifies the base type of the unit.
  /// The [representation] parameter specifies the string representation of the
  /// unit.
  const Unit({
    required this.orderOfMagnitude,
    required this.baseType,
    required this.representation,
  });

  /// The order of magnitude of the unit.
  final int orderOfMagnitude;

  /// The base type of the unit.
  final BaseType baseType;

  /// The string representation of the unit.
  final Map<FormatType, String> representation;

  /// Returns the largest unit for the given [size] in bytes.
  ///
  /// The [baseType] parameter specifies the base type of the unit.
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

  /// Returns the unit corresponding to the given [input] string.
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

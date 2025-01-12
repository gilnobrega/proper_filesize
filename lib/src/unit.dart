import 'package:proper_filesize/src/base_type.dart';
import 'package:proper_filesize/src/format_type.dart';
import 'dart:math' as Math;

enum Unit {
  byte(
    orderOfMagnitude: 0,
    baseType: BaseType.metric,
    representation: {
      FormatType.short: 'B',
      FormatType.long: 'byte',
    },
  ),
  kilobyte(
    orderOfMagnitude: 1,
    baseType: BaseType.metric,
    representation: {
      FormatType.short: 'KB',
      FormatType.long: 'kilobyte',
    },
  ),
  megabyte(
    orderOfMagnitude: 2,
    baseType: BaseType.metric,
    representation: {
      FormatType.short: 'MB',
      FormatType.long: 'megabyte',
    },
  ),
  gigabyte(
    orderOfMagnitude: 3,
    baseType: BaseType.metric,
    representation: {
      FormatType.short: 'GB',
      FormatType.long: 'gigabyte',
    },
  ),
  terabyte(
    orderOfMagnitude: 4,
    baseType: BaseType.metric,
    representation: {
      FormatType.short: 'TB',
      FormatType.long: 'terabyte',
    },
  ),
  petabyte(
    orderOfMagnitude: 5,
    baseType: BaseType.metric,
    representation: {
      FormatType.short: 'PB',
      FormatType.long: 'petabyte',
    },
  ),
  exabyte(
    orderOfMagnitude: 6,
    baseType: BaseType.metric,
    representation: {
      FormatType.short: 'EB',
      FormatType.long: 'exabyte',
    },
  ),
  zetabyte(
    orderOfMagnitude: 7,
    baseType: BaseType.metric,
    representation: {
      FormatType.short: 'ZB',
      FormatType.long: 'zettabyte',
    },
  ),
  yottabyte(
    orderOfMagnitude: 8,
    baseType: BaseType.metric,
    representation: {
      FormatType.short: 'YB',
      FormatType.long: 'yottabyte',
    },
  ),
  kibibyte(
    orderOfMagnitude: 1,
    baseType: BaseType.metric,
    representation: {
      FormatType.short: 'KiB',
      FormatType.long: 'kibibyte',
    },
  ),
  mebibyte(
    orderOfMagnitude: 2,
    baseType: BaseType.binary,
    representation: {
      FormatType.short: 'MiB',
      FormatType.long: 'mebibyte',
    },
  ),
  gibibyte(
    orderOfMagnitude: 3,
    baseType: BaseType.binary,
    representation: {
      FormatType.short: 'GiB',
      FormatType.long: 'gibibyte',
    },
  ),
  tebibyte(
    orderOfMagnitude: 4,
    baseType: BaseType.binary,
    representation: {
      FormatType.short: 'TiB',
      FormatType.long: 'tebibyte',
    },
  ),
  pebibyte(
    orderOfMagnitude: 5,
    baseType: BaseType.binary,
    representation: {
      FormatType.short: 'PiB',
      FormatType.long: 'pebibyte',
    },
  ),
  exbibyte(
    orderOfMagnitude: 6,
    baseType: BaseType.binary,
    representation: {
      FormatType.short: 'EiB',
      FormatType.long: 'exbibyte',
    },
  ),
  zebibyte(
    orderOfMagnitude: 7,
    baseType: BaseType.binary,
    representation: {
      FormatType.short: 'ZiB',
      FormatType.long: 'zebibyte',
    },
  ),
  yobibyte(
    orderOfMagnitude: 8,
    baseType: BaseType.binary,
    representation: {
      FormatType.short: 'YiB',
      FormatType.long: 'yobibyte',
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
    required num size,
    required BaseType baseType,
  }) {
    final inputOrderOfMagnitude = _logBase(size, baseType.value).floor();
    return Unit.values
        .where((unit) => unit.baseType == baseType)
        .toList()
        .sortFromSmallestToLargest()
        .lastWhere((unit) => unit.orderOfMagnitude <= inputOrderOfMagnitude);
  }

  static Unit parse(String input) {
    input = input.trim();

    return Unit.values.toList().sortFromLargestToSmallest().firstWhere((unit) =>
        unit.representation.entries
            .any((entry) => input.contains(entry.value)));
  }
}

// converts natural logarithms to base 1000 or base 1024 logarithms
double _logBase(num x, num _base) => Math.log(x) / Math.log(_base);

extension ListUnitX on List<Unit> {
  List<Unit> sortFromSmallestToLargest() => this
    ..sort((unitA, unitB) =>
        unitA.orderOfMagnitude.compareTo(unitB.orderOfMagnitude));

  List<Unit> sortFromLargestToSmallest() => this
    ..sort((unitA, unitB) =>
        unitB.orderOfMagnitude.compareTo(unitA.orderOfMagnitude));
}

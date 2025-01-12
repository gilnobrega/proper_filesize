import 'package:proper_filesize/src/base_type.dart';
import 'package:proper_filesize/src/unit_type.dart';
import 'package:proper_filesize/src/format_type.dart';

final class UnitData {
  const UnitData({
    required this.unitType,
    required this.baseType,
    required this.formatType,
  });
  final BaseType baseType;
  final FormatType formatType;
  final UnitType unitType;

  @override
  String toString() {
    return unitType.representation[baseType]![formatType]!;
  }
}

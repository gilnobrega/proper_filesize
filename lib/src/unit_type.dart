import 'package:proper_filesize/src/base_type.dart';
import 'package:proper_filesize/src/format_type.dart';

enum UnitType {
  k(1, {
    BaseType.binary: {FormatType.short: 'KiB', FormatType.long: 'kibibyte'},
    BaseType.metric: {FormatType.short: 'KB', FormatType.long: 'kilobyte'},
  }),
  m(2, {
    BaseType.binary: {FormatType.short: 'MiB', FormatType.long: 'mibibyte'},
    BaseType.metric: {FormatType.short: 'MB', FormatType.long: 'megabyte'},
  }),
  g(3, {
    BaseType.binary: {FormatType.short: 'GiB', FormatType.long: 'gibibyte'},
    BaseType.metric: {FormatType.short: 'GB', FormatType.long: 'gigabyte'},
  }),
  t(4, {
    BaseType.binary: {FormatType.short: 'TiB', FormatType.long: 'tebibyte'},
    BaseType.metric: {FormatType.short: 'TB', FormatType.long: 'terabyte'},
  }),
  p(5, {
    BaseType.binary: {FormatType.short: 'PiB', FormatType.long: 'pebibyte'},
    BaseType.metric: {FormatType.short: 'PB', FormatType.long: 'pettabyte'},
  }),
  e(6, {
    BaseType.binary: {FormatType.short: 'EiB', FormatType.long: 'exbibyte'},
    BaseType.metric: {FormatType.short: 'EB', FormatType.long: 'exabyte'},
  }),
  z(7, {
    BaseType.binary: {FormatType.short: 'ZiB', FormatType.long: 'zebibyte'},
    BaseType.metric: {FormatType.short: 'ZB', FormatType.long: 'zettabyte'},
  }),
  y(
    8,
    {
      BaseType.binary: {FormatType.short: 'YiB', FormatType.long: 'yobibyte'},
      BaseType.metric: {FormatType.short: 'YB', FormatType.long: 'yottabyte'},
    },
  ),
  none(0, {
    BaseType.metric: {
      FormatType.short: 'B',
      FormatType.long: 'byte',
    }
  }),
  ;

  const UnitType(this.exponent, this.representation);
  final int exponent;
  final Map<BaseType, Map<FormatType, String>> representation;
}

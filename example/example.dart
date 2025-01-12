// ignore_for_file: avoid_print, document_ignores

import "package:proper_filesize/proper_filesize.dart";

void main() {
  // Suppose you want to convert this string into an
  // integer representation of bytes
  const String binaryFilesize = "1.2 EiB";
  final int binaryBytes = FileSize.parse(binaryFilesize).size.toInt();

  print(
    "$binaryFilesize is $binaryBytes bytes",
  ); // 1.2 EiB is 1383505805528216320 bytes

  // Also supports metric units
  const String metricFilesize = "1.2 EB";
  final int metricBytes = FileSize.parse(metricFilesize).size.toInt();

  print(
    "$metricFilesize is $metricBytes bytes",
  ); // 1.2 EB is 1200000000000000000 bytes

  // Now suppose you want to generate a human readable filesize from 1.24356e9 
  // bytes up to 3 decimals
  final int bytes = 1.24356e9.toInt();
  final String metricHumanReadableFilesize = FileSize(bytes).toString(
    unit: Unit.auto(size: bytes, baseType: BaseType.metric),
  );
  print(
    "$bytes bytes is $metricHumanReadableFilesize",
  ); // 1243560000 bytes is 1.244 GB

  final String binaryHumanReadableFilesize = FileSize(bytes).toString();
  print(
    "$bytes bytes is $binaryHumanReadableFilesize",
  ); // 1243560000 bytes is 1.158 GiB

  // Generate a binary unit string with 2 decimal places
  final String binaryFilesize2Decimals = FileSize(bytes).toString(decimals: 2);
  print(
    "$bytes bytes is $binaryFilesize2Decimals",
  ); // 1243560000 bytes is 1.16 GiB

  // Generate a metric unit string with the full unit name ("gigabyte")
  final String metricFilesizeLong = FileSize(bytes).toString(
    unit: Unit.auto(size: bytes, baseType: BaseType.metric),
    formatType: FormatType.long,
  );
  print(
    "$bytes bytes is $metricFilesizeLong",
  ); // 1243560000 bytes is 1.244 gigabyte

  // Generate a binary unit string with the full unit name ("gibibyte")
  final String binaryFilesizeLong = FileSize(bytes).toString(
    unit: Unit.auto(size: bytes, baseType: BaseType.binary),
    formatType: FormatType.long,
  );
  print(
    "$bytes bytes is $binaryFilesizeLong",
  ); // 1243560000 bytes is 1.158 gibibyte

  // Generate a string with the explicit unit "gigabyte"
  final String explicitUnitFilesize =
      FileSize(bytes).toString(unit: Unit.gigabyte);
  print(
    "$bytes bytes is $explicitUnitFilesize",
  ); // 1243560000 bytes is 1.244 GB

  // Parse a long-format string
  const String longFormatFilesize = "1.45 gibibytes";
  final int longFormatBytes = FileSize.parse(longFormatFilesize).size.toInt();
  print(
    "$longFormatFilesize is $longFormatBytes bytes",
  ); // 1.45 gibibytes is 1556925644 bytes

  // Convert a unit to a String with explicit unit conversion
  const num terabyteSize = 20.59;
  final String explicitUnitConversionStr =
      FileSize(terabyteSize, inputUnit: Unit.terabyte)
          .toString(unit: Unit.gibibyte);
  print(
    "$terabyteSize terabytes is $explicitUnitConversionStr",
  ); // 20.59 terabytes is 19175.932 GiB

  // Convert a unit to a another size with explicit unit
  const num gigabytesize = 401.26;
  final num explicitUnitConversion =
      FileSize(gigabytesize, inputUnit: Unit.gigabyte)
      .toSize(unit: Unit.mebibyte);
  print(
    "$gigabytesize gigabytes is $explicitUnitConversion mebibytes",
  ); // 401.26 gigabytes is 382671.3562011719 mebibytes
}

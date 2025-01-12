import 'package:proper_filesize/proper_filesize.dart';

main() {
  // Suppose you want to convert this string into an integer representation of bytes
  String binaryFilesize = "1.2 EiB";

  int binaryBytes =
      FileSize.parseHumanReadableFilesize(binaryFilesize).toInt();

  print("$binaryFilesize is $binaryBytes bytes");
  // this will print
  // 1.2 EiB is 1383505805528216320 bytes

  // Also supports metric units
  String metricFilesize = "1.2 EB";

  int metricBytes =
      FileSize.parseHumanReadableFilesize(metricFilesize).toInt();

  print("$metricFilesize is $metricBytes bytes");
  // this will print
  // 1.2 EB is 1200000000000000000 bytes

  // Now suppose you want to generate a human readable filesize from 1.24356e9 bytes up to 3 decimals
  int bytes = 1.24356e9.toInt();

  String metricHumanReadableFilesize =
      FileSize.generateHumanReadableFilesize(
      bytes,
      baseType: BaseType.metric,
      decimals: 3);
  print("$bytes bytes is $metricHumanReadableFilesize");
  //this will print
  // 1243560000 bytes is 1.244 GB

  String binaryHumanReadableFilesize =
      FileSize.generateHumanReadableFilesize(
      bytes,
      baseType: BaseType.binary,
      decimals: 3);
  print("$bytes bytes is $binaryHumanReadableFilesize");
  //this will print
  // 1243560000 bytes is 1.158 GiB
}

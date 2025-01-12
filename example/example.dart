import 'package:proper_filesize/proper_filesize.dart';

main() {
  // Suppose you want to convert this string into an integer representation of bytes
  String binaryFilesize = "1.2 EiB";

  int binaryBytes = FileSize.parse(binaryFilesize).size.toInt();

  print("$binaryFilesize is $binaryBytes bytes");
  // this will print
  // 1.2 EiB is 1383505805528216320 bytes

  // Also supports metric units
  String metricFilesize = "1.2 EB";

  int metricBytes = FileSize.parse(metricFilesize).size.toInt();

  print("$metricFilesize is $metricBytes bytes");
  // this will print
  // 1.2 EB is 1200000000000000000 bytes

  // Now suppose you want to generate a human readable filesize from 1.24356e9 bytes up to 3 decimals
  num bytes = 1.24356e9.toInt();

  String metricHumanReadableFilesize = FileSize(bytes).toString(
    unit: Unit.auto(size: bytes, baseType: BaseType.metric),
  );
  print("$bytes bytes is $metricHumanReadableFilesize");
  //this will print
  // 1243560000 bytes is 1.244 GB

  String binaryHumanReadableFilesize = FileSize(bytes).toString();
  print("$bytes bytes is $binaryHumanReadableFilesize");
  //this will print
  // 1243560000 bytes is 1.158 GiB
}

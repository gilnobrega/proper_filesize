# proper_filesize
a self-contained dart library that converts bytes to human readable file sizes and backwards. 

Supports binary and metric units. (KB, KiB, MB, MiB, GB, GiB, TB, TiB, PB, PiB, EB, EiB, etc.)

## Usage
Add ``proper_filesize`` as a dependency to your project's ``pubspec.yaml`` file.

#### String to bytes

Converts human readable string and its units to an integer number of bytes

```dart
  String metricFilesize = "1.2 EB";
  int metricBytes = ProperFilesize.parseHumanReadableFilesize(metricFilesize).toInt();
  print("$metricFilesize is $metricBytes bytes");
```

This will print:
```
1.2 EB is 1200000000000000000 bytes
```

Also works with binary units:


```dart
  String binaryFilesize = "1.2 EiB";
  int binaryBytes = ProperFilesize.parseHumanReadableFilesize(binaryFilesize).toInt();
  print("$binaryFilesize is $binaryBytes bytes");
```

This will print:
```
1.2 EiB is 1383505805528216320 bytes
```

#### Bytes to String

Converts integer number of bytes to a human-readable filesize string

```dart
  int bytes = 1.24356e9.toInt();
  String binaryHumanReadableFilesize = ProperFilesize.generateHumanReadableFilesize(bytes, base: Bases.Binary, decimals: 3);
  print("$bytes bytes is $binaryHumanReadableFilesize");
```

This will print:
```
1243560000 bytes is 1.158 GiB
```

# proper_filesize

**A self-contained Dart library that converts between bytes and human-readable file sizes.**

Easily convert raw byte values into human-readable file sizes like "1.2 KB" or "3.5 MB", and vice versa.
Supports both binary (KiB, MiB, GiB) and metric (KB, MB, GB) units.

## Features

*   Converts bytes to human-readable strings (e.g., `1024 bytes` to `"1 KiB"`).
*   Converts human-readable strings to bytes (e.g., `"1.2 GB"` to `1200000000 bytes`).
*   Supports both binary and metric units (KB, KiB, MB, MiB, GB, GiB, TB, TiB, PB, PiB, EB, EiB, etc.).
*   Customizable decimal precision.
*   Supports short and long format types (e.g., "KB" vs "kilobyte").

## Installation

Add `proper_filesize` as a dependency to your project's `pubspec.yaml` file:

```yaml
dependencies:
  proper_filesize: ^1.0.0
```

## Usage

### Parsing File Size String to Numeric Value

Converts a human-readable file size string (e.g., "1.2 KB", "3.5 MB", "1.5 GiB") to its corresponding byte value.

```dart
import 'package:proper_filesize/proper_filesize.dart';

String metricFilesize = "1.2 EB";
int metricBytes = FileSize.parse(metricFilesize).size.toInt();
print("$metricFilesize is $metricBytes bytes");
// Output: 1.2 EB is 1200000000000000000 bytes

String binaryFilesize = "1.2 EiB";
int binaryBytes = FileSize.parse(binaryFilesize).size.toInt();
print("$binaryFilesize is $binaryBytes bytes");
// Output: 1.2 EiB is 1383505805528216320 bytes

String longFormatFilesize = "1.45 gibibytes";
int longFormatBytes = FileSize.parse(longFormatFilesize).size.toInt();
print("$longFormatFilesize is $longFormatBytes bytes");
// Output: 1.45 gibibytes is 1556488978432 bytes
```

### Converting Numeric Value to File Size String

Converts a byte value to a human-readable file size string.

```dart
import 'package:proper_filesize/proper_filesize.dart';

int bytes = 1243560000;

// Using metric units (KB, MB, GB)
String metricFilesize = FileSize(bytes).toString(
  unit: Unit.auto(size: bytes, baseType: BaseType.metric),
);
print("$bytes bytes is $metricFilesize"); 
// Output: 1243560000 bytes is 1.244 GB

// Using binary units (KiB, MiB, GiB)
String binaryFilesize = FileSize(bytes).toString();
print("$bytes bytes is $binaryFilesize"); 
// Output: 1243560000 bytes is 1.158 GiB
```

#### Further Examples

For detailed examples of usage, including:

  * Parsing file size strings to numeric values
  * Converting numeric values to file size strings
  * Customizing decimal precision
  * Using long format types
  * Providing explicit units
  * Parsing long-format strings
  * Converting units with explicit unit conversion

Please refer to the comprehensive examples provided in the [example.dart](example/example.dart) file.
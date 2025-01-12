import "package:proper_filesize/proper_filesize.dart";
import "package:test/test.dart";

void main() {
  group("FileSize.parse()", () {
    test('''
        SHOULD return 1000 bytes 
        WHEN input is "1 KB"
        ''', () {
      // Arrange
      const String fileSize = "1 KB";

      // Act
      final int result = FileSize.parse(fileSize).size.toInt();

      // Assert
      expect(result, 1000);
    });

    test('''
        SHOULD return 1024 bytes 
        WHEN input is "1 KiB"
        ''', () {
      // Arrange
      const String fileSize = "1 KiB";

      // Act
      final int result = FileSize.parse(fileSize).size.toInt();

      // Assert
      expect(result, 1024);
    });

    test('''
        SHOULD return 1383505805528216320 bytes 
        WHEN input is "1.2 EiB"
        ''', () {
      // Arrange
      const String fileSize = "1.2 EiB";

      // Act
      final int result = FileSize.parse(fileSize).size.toInt();

      // Assert
      expect(result, 1383505805528216320);
    });

    test('''
        SHOULD return 1556925644 bytes 
        WHEN input is "1.45 gibibytes"
        ''', () {
      // Arrange
      const String fileSize = "1.45 gibibytes";

      // Act
      final int result = FileSize.parse(fileSize).size.toInt();

      // Assert
      expect(result, 1556925644);
    });
  });

  group("FileSize.toString()", () {
    test('''
        SHOULD return "1000 B" 
        WHEN filesize is 1000 bytes
        ''', () {
      // Arrange
      const int bytes = 1000;

      // Act
      final String result = FileSize.fromBytes(bytes).toString();

      // Assert
      expect(result, "1000 B");
    });

    test('''
        SHOULD return "1 KiB" 
        WHEN filesize is 1024 bytes
        ''', () {
      // Arrange
      const int bytes = 1024;

      // Act
      final String result = FileSize.fromBytes(bytes).toString();

      // Assert
      expect(result, "1 KiB");
    });

    test('''
        SHOULD return "1.158 GiB" 
        WHEN filesize is 1243560000 bytes
        ''', () {
      // Arrange
      const int bytes = 1243560000;

      // Act
      final String result = FileSize.fromBytes(bytes).toString();

      // Assert
      expect(result, "1.158 GiB");
    });

    test('''
        SHOULD return "1.244 GB" 
        WHEN filesize is 1243560000 bytes and unit is metric
        ''', () {
      // Arrange
      const int bytes = 1243560000;

      // Act
      final String result = FileSize.fromBytes(bytes).toString(
        unit: Unit.auto(size: bytes, baseType: BaseType.metric),
      );

      // Assert
      expect(result, "1.244 GB");
    });

    test('''
        SHOULD return "1.16 GiB" 
        WHEN filesize is 1243560000 bytes and decimals are 2
        ''', () {
      // Arrange
      const int bytes = 1243560000;

      // Act
      final String result = FileSize.fromBytes(bytes).toString(decimals: 2);

      // Assert
      expect(result, "1.16 GiB");
    });

    test('''
        SHOULD return "1 kilobyte" 
        WHEN filesize is 1000 bytes and formatType is long
        ''', () {
      // Arrange
      const int bytes = 1000;

      // Act
      final String result = FileSize.fromBytes(bytes).toString(
        unit: Unit.auto(size: bytes, baseType: BaseType.metric),
        formatType: FormatType.long,
      );

      // Assert
      expect(result, "1 kilobyte");
    });

    test('''
        SHOULD return "1 kibibyte" 
        WHEN filesize is 1024 bytes and formatType is long
        ''', () {
      // Arrange
      const int bytes = 1024;

      // Act
      final String result = FileSize.fromBytes(bytes).toString(
        unit: Unit.auto(size: 1024, baseType: BaseType.binary),
        formatType: FormatType.long,
      );

      // Assert
      expect(result, "1 kibibyte");
    });

    test('''
        SHOULD return "0.244 GB" 
        WHEN filesize is 243560000 bytes and unit is gigabyte
        ''', () {
      // Arrange
      const int bytes = 243560000;

      // Act
      final String result =
          FileSize.fromBytes(bytes).toString(unit: Unit.gigabyte);

      // Assert
      expect(result, "0.244 GB");
    });
  });

  group("FileSize.toSize()", () {
    test("""
        SHOULD return 382671.3562011719 
        WHEN converting 401.26 gigabytes to mebibytes
        """, () {
      // Arrange
      const num gigabytes = 401.26;

      // Act
      final num result = FileSize.fromUnit(size: gigabytes, unit: Unit.gigabyte)
          .toSize(unit: Unit.mebibyte);

      // Assert
      expect(result, 382671.3562011719);
    });
  });
}

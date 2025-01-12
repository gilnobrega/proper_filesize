import 'package:proper_filesize/proper_filesize.dart';
import 'package:test/test.dart';

void main() {
  group('FileSize', () {
    test('parse()', () {
      expect(FileSize.parse('1 KB').size, 1000);
      expect(FileSize.parse('1 KiB').size, 1024);
      expect(FileSize.parse('1.2 EiB').size, 1383505805528216320);
      expect(FileSize.parse('1.45 gibibytes').size, 1556925644.8);
    });

    test('toString()', () {
      expect(FileSize(1000).toString(), '1000 B');
      expect(FileSize(1024).toString(), '1 KiB');
      expect(FileSize(1243560000).toString(), '1.158 GiB');
      expect(
        FileSize(1243560000).toString(
          unit: Unit.auto(size: 1243560000, baseType: BaseType.metric),
        ),
        '1.244 GB',
      );
      expect(FileSize(1243560000).toString(decimals: 2), '1.16 GiB');
      expect(
        FileSize(1000).toString(
          unit: Unit.auto(size: 1000, baseType: BaseType.metric),
          formatType: FormatType.long,
        ),
        '1 kilobyte',
      );
      expect(
        FileSize(1024).toString(
          unit: Unit.auto(size: 1024, baseType: BaseType.binary),
          formatType: FormatType.long,
        ),
        '1 kibibyte',
      );
      expect(FileSize(243560000).toString(unit: Unit.gigabyte), '0.244 GB');
    });

    test('toSize()', () {
      expect(
        FileSize(401.26, inputUnit: Unit.gigabyte).toSize(unit: Unit.mebibyte),
        382671.3562011719,
      );
    });
  });
}

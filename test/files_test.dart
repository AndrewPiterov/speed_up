import 'package:speed_up/src/files.dart';
import 'package:test/test.dart';

void main() {
  test('10 B with decimal', () async {
    const bytes = 10;

    final size = await FileSizeInfo.getSize(bytes);
    expect(size.totalBytes, bytes);
    expect(size.getTitle(), '10.00 B');
    expect(size.suffixSize, 10);
    expect(size.suffix, FileSizeSuffix.B);
  });

  test('1 KB w/o decimal', () async {
    const bytes = 1024;

    final size = await FileSizeInfo.getSize(bytes);
    expect(size.totalBytes, bytes);
    expect(size.getTitle(decimals: 0), '1 KB');
    expect(size.suffixSize, 1);
    expect(size.suffix, FileSizeSuffix.KB);
  });

  test('1 MB w/o decimal', () async {
    const bytes = 1024 * 1024;

    final size = await FileSizeInfo.getSize(bytes);
    expect(size.totalBytes, bytes);
    expect(size.getTitle(decimals: 0), '1 MB');
    expect(size.suffixSize, 1);
    expect(size.suffix, FileSizeSuffix.MB);
  });

  test('1 MB as KB', () async {
    const bytes = 1024 * 1024;

    final sizeInMb = await FileSizeInfo.getSize(bytes);

    final sizeInKb = sizeInMb.asSuffix(FileSizeSuffix.KB);

    expect(sizeInKb.totalBytes, bytes);
    expect(sizeInKb.getTitle(), '1024.00 KB');
    expect(sizeInKb.suffixSize, 1024);
    expect(sizeInKb.suffix, FileSizeSuffix.KB);
  });

  test('1 MB as KB w/o decimals', () async {
    const bytes = 1024 * 1024;

    final sizeInMb = await FileSizeInfo.getSize(bytes);

    final sizeInKb = sizeInMb.asSuffix(FileSizeSuffix.KB);

    expect(sizeInKb.totalBytes, bytes);
    expect(sizeInKb.getTitle(decimals: 0), '1024 KB');
    expect(sizeInKb.suffixSize, 1024);
    expect(sizeInKb.suffix, FileSizeSuffix.KB);
  });
}

import 'dart:io';
import 'dart:math';

import 'package:speed_up/speed_up.dart';

enum FileExtension {
  unknown,
  jpeg,
  png,
  webp,
}

// ignore: avoid_classes_with_only_static_members
class FilePathExtensions {
  static bool isPng(String filePath) => filePath.toLowerCase().endsWith('.png');
  static bool isWebp(String filePath) =>
      filePath.toLowerCase().endsWith('.webp');
  static bool isJpeg(String filePath) =>
      filePath.toLowerCase().endsWith('.jpeg') ||
      filePath.toLowerCase().endsWith('.jpg');

  static FileExtension getExtension(String filePath) => isPng(filePath)
      ? FileExtension.png
      : isJpeg(filePath)
          ? FileExtension.jpeg
          : isWebp(filePath)
              ? FileExtension.webp
              : FileExtension.unknown;
}

// ignore: constant_identifier_names
enum FileSizeSuffix { B, KB, MB, GB, TB, PB, EB, ZB, YB }

class FileSizeInfo {
  const FileSizeInfo(
    this.totalBytes,
    this.suffixSize,
    this.suffix,
  );

  final int totalBytes;
  String getTitle({int decimals = 2}) {
    return '${suffixSize.toStringAsFixed(decimals)} ${getEnumTitle(suffix)}';
  }

  final double suffixSize;
  final FileSizeSuffix suffix;

  static Future<FileSizeInfo> getFileSize(
    String filePath, {
    int decimals = 2,
  }) async {
    final file = File(filePath);
    final bytes = await file.length();
    if (bytes <= 0) {
      return const FileSizeInfo(0, 0, FileSizeSuffix.B);
    }

    return getSize(bytes);
  }

  ///
  static Future<FileSizeInfo> getSize(int bytes) async {
    final i = (log(bytes) / log(1024)).floor();

    final sizeInSuffix = bytes / pow(1024, i);
    final suffix = FileSizeSuffix.values[i];

    return FileSizeInfo(bytes, sizeInSuffix, suffix);
  }

  ///
  FileSizeInfo asSuffix(FileSizeSuffix suffix) {
    final i = FileSizeSuffix.values.indexOf(suffix);
    final size = totalBytes / pow(1024, i);
    return FileSizeInfo(totalBytes, size, suffix);
  }
}

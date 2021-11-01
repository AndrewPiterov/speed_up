# speed_up

[![pub package](https://img.shields.io/pub/v/speed_up.svg?label=speed_up&color=blue)](https://pub.dev/packages/speed_up)
[![likes](https://badges.bar/speed_up/likes)](https://pub.dev/packages/speed_up/score)
[![codecov](https://codecov.io/gh/AndrewPiterov/speed_up/branch/main/graph/badge.svg?token=VM9LTJXGQS)](https://codecov.io/gh/AndrewPiterov/speed_up)
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)
[![Dart](https://github.com/AndrewPiterov/speed_up/actions/workflows/dart.yml/badge.svg)](https://github.com/AndrewPiterov/speed_up/actions/workflows/dart.yml)

Package to speed up your productivity.

## Usage

### String extensions

### Collection extension

#### Sum

```dart
final sum = [1,2,3,4,5,6].sum();
print(sum); // Prints 21
```

```dart
final sum = [Product(price: 100.99), Product(price: 49.99)].sum((p) => p.price);
print(sum); // Prints 150.98
```

#### Next After

#### Random

#### Check String is null or empty

```dart
isStringNullOrEmpty('Some String');
isStringNullOrEmpty('');
isStringNullOrEmpty(null);
```

#### Get enum title

```dart
enum AccountType {
  general,
  owner,
}

debugPrint('Account type: ' + getEnumTitle(UserType.general)); // prints Account type: general
```

#### Get image file size

```dart

const fileSize = 1024 * 1024;

// Get file size in closest size suffix
final sizeInMb = FileSizeInfo.getSize(bytes);
log(sizeInKb.getTitle())); // prints '1.oo MB'
log(sizeInKb.getTitle(decimals: 0))); // prints '1 MB'

// Convert to desired suffix
final sizeInKb = sizeInMb.asSuffix(FileSizeSuffix.KB);
log(sizeInKb.getTitle())); // prints '1024 KB'

log();

```

#### RangeValue type

```dart
final numRange = RangeValue(1, 10);
print(numRange.isValid); // true

final start = DateTime.now();
final end = DateTime.now().add(Duration(days: 1));
final dateTimeRange = RangeValue(end, start);

print(dateTimeRange.isValid); // false
```

## Contributing

We accept the following contributions:

* Improving documentation
* Reporting issues
* Fixing bugs

## Maintainers

* [Andrew Piterov](mailto:piterov1990@gmail.com?subject=[GitHub]%20Source%20Dart%20speed_up)

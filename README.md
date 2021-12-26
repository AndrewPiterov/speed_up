# speed_up

[![pub package](https://img.shields.io/pub/v/speed_up.svg?label=speed_up&color=blue)](https://pub.dev/packages/speed_up)
[![likes](https://badges.bar/speed_up/likes)](https://pub.dev/packages/speed_up/score)
[![codecov](https://codecov.io/gh/AndrewPiterov/speed_up/branch/main/graph/badge.svg?token=VM9LTJXGQS)](https://codecov.io/gh/AndrewPiterov/speed_up)
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)
[![Dart](https://github.com/AndrewPiterov/speed_up/actions/workflows/dart.yml/badge.svg)](https://github.com/AndrewPiterov/speed_up/actions/workflows/dart.yml)

Package to speed up your productivity.

## Usage

### Object

```dart
someObj.isNull;
someObj.isNotNull;
```

### String extensions

#### Check String is null or empty

```dart
'Some String'.isNullOrEmpty
'Some String'.isNotNullOrEmpty
```

#### Capitalization

```dart
'flutter'.capitalized; // 'Flutter'

'flutter is awesome'.titleCased; // 'Flutter Is Awesome'
```

#### Equality

```dart
str1.isEqualTo(str2);
str1.isEqualTo(str2, ignoreCase: true);
```

### Collection extension

```dart
 final sum = [1, 2, 3].sum(); // 6

 final sum = [Product(price: 100.99), Product(price: 49.99)].sum((p) => p.price);
```

```dart
final ordered = orders.orderBy((x) => x.amount, desc: true);
```

```dart
final groups = people.groupBy((p) => p.age, map: (p) => p.name);
```

#### Next After

#### Random

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
* [Reporting issues](https://github.com/AndrewPiterov/speed_up/issues/new)
* Fixing bugs

## Maintainers

* [Andrew Piterov](mailto:contact@andrewpiterov.com?subject=[GitHub]%20Source%20Dart%20speed_up)

<a href="https://www.buymeacoffee.com/devcraft.ninja" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>

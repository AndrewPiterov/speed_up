# SpeedUp

Package to speed up your productivity

## Usage

### String extensions

#### Check String is null or empty

```dart
isStringNullOrEmpty('Some String');
isStringNullOrEmpty('');
isStringNullOrEmpty(null);
```

will print

```dart
false
true
true
```

#### Get enum title

```dart
enum AccountType {
  general,
  owner,
}

debugPrint('Account type: ' + getEnumTitle(UserType.general));
```

will print

```dart
Account type: general
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

## Contributing

We accept the following contributions:

* Improving documentation
* Reporting issues
* Fixing bugs

## Maintainers

* [Andrew Piterov](mailto:piterov1990@gmail.com?subject=[GitHub]%20Source%20Dart%20fluent_result)

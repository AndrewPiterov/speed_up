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

## Contributing

We accept the following contributions:

* Improving documentation
* Reporting issues
* Fixing bugs

## Maintainers

* [Andrew Piterov](mailto:piterov1990@gmail.com?subject=[GitHub]%20Source%20Dart%20fluent_result)

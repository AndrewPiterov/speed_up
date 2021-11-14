@Deprecated('Use `title` getter of Enum instead. Will be removed in 1.0.0')
String getEnumTitle(dynamic someEnum) => someEnum.toString().split('.').last;

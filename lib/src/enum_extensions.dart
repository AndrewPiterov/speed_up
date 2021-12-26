@Deprecated(
  'Use `MyEnum.value1.name` instead if you use Flutter >= 2.15. Will be removed in 1.0.0',
)
extension EnumExtensions on Enum? {
  String get title => toString().split('.').last;
}

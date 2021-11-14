extension EnumExtensions on Enum? {
  String get title => toString().split('.').last;
}

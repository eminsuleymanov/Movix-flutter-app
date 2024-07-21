extension IntExtensions on int? {
  bool get isSuccess => this! > 199 && this! < 300;
}
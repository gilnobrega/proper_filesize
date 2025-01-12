/// An enum representing the base type of the unit.
enum BaseType {
  /// The metric base type, which uses 1000 as the base.
  metric(1000),

  /// The binary base type, which uses 1024 as the base.
  binary(1024);

  /// Creates a [BaseType] object.
  ///
  /// The [value] parameter specifies the logarithmic value of the base type.
  const BaseType(this.value);

  /// The logarithmic value of the base type.
  final num value;
}

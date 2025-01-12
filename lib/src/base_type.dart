enum BaseType {
  metric(1000),
  binary(1024);

  const BaseType(this.value);

  /// Establishes relation between type of Bases and their logarithmic value
  final num value;
}

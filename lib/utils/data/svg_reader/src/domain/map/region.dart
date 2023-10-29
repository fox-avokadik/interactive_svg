class Region {
  final String id;
  final String path;
  final String color;
  final String zone;

  const Region({
    required this.id,
    required this.path,
    required this.zone,
    this.color = 'D7D3D2',
  });
}

class Product {
  Product(
    this.archive,
    this.description,
    this.name,
    this.picture,
    this.stock,
    this.threshold,
    this.uniprice,
  );

  final bool archive;
  final String description;
  final String name;
  final String picture;
  final int stock;
  final int threshold;
  final int uniprice;
}

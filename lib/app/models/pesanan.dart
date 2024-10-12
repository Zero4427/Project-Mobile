class Order {
  final String name;
  final double price;
  final String imagePath;
  final DateTime estimatedArrivalTime;

  Order({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.estimatedArrivalTime,
  });
}

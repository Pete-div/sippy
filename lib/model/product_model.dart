
class Product {
  final String? id;
final String image;
final String description;
final String name;
final double amount;
bool isFavorite;

  Product({
     this.id,
  required this.image, required this.description, required this.name, required this.amount,this.isFavorite=false
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      
      amount: (json['amount'] as num).toDouble(), image: json['image'], description: json['description'],
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'description':description,
      'image':image
    };
  }
}

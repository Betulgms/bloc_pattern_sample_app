//give me product class properties=>id,title,photoPath,price,description,category. write dart class.

class ProductModel {
  final int id;
  final String title;
  final String photoPath;
  final double price;
  final String description;
  final int categoryId;

  ProductModel(this.id, this.title, this.photoPath, this.price, this.description, this.categoryId);

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        photoPath = json['photoPath'],
        price = json['price'],
        description = json['description'],
        categoryId = json['categoryId'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'photoPath': photoPath,
        'price': price,
        'description': description,
        'categoryId': categoryId,
      };
}

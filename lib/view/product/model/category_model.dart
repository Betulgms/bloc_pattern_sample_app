class CategoryModel {
  final int id;
  final String title;
  final String photoPath;
  CategoryModel(this.id, this.title, this.photoPath);

  CategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        photoPath = json['photoPath'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'photoPath': photoPath,
      };
}

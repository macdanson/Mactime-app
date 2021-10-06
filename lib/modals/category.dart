class Category {
  String id, title, color;

  Category(this.id, this.title, this.color);

Category.fromJson(Map<String, dynamic> jsonObject){
  this.id = jsonObject['category_id'].toString();
  this.title = jsonObject['category'].toString();
  this.color = jsonObject['color'].toString();
  }
}

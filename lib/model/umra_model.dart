// TODO Implement this library.
class UmraModel {
  final int? id;
  final String? name;
  final String? title;
  final String? content;
  final String? menu_id;

  UmraModel({this.id, this.name, this.title, this.content, this.menu_id});

  factory UmraModel.fromMap(Map<String, dynamic> json) =>
      UmraModel(
        id: json['id'],
        name: json['name'],
        title: json['title'],
        content: json['content'],
        menu_id: json['menu_id'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'content': content,
      'menu_id': menu_id,
    };
  }
}


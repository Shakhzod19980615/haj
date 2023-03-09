class UmraModel {
  final int? id;
  final String? title;
  final String? titleBig;
  final String? content;
  final String? image;
  final int? big_step_id;
  final String? isFinished;

  UmraModel(
      {this.id,
        this.title,
        this.titleBig,
        this.content,
        this.image,
        this.big_step_id,
        this.isFinished});

  factory UmraModel.fromMap(Map<String, dynamic> json) => UmraModel(
    id: json['id'],
    title: json['title'],
    titleBig: json['title_big'],
    content: json['content'],
    image: json['image'],
    big_step_id: json['big_step_id'],
    isFinished: json["isFinished"],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'title_big': titleBig,
      'content': content,
      'image': image,
      'big_step_id': big_step_id,
      "isFinished": isFinished
    };
  }
}

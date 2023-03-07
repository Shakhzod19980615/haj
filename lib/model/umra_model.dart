class UmraModel {
  final int? id;
  final String? title;
  final String? content;
  final String? image;
  final int? big_step_id;
  final String? isFinished;

  UmraModel({this.id, this.title, this.content, this.image, this.big_step_id, this.isFinished});

  factory UmraModel.fromMap(Map<String, dynamic> json) =>
      UmraModel(
        id: json['id'],
        title: json['name'],
        content: json['content'],
        image: json['image'],
        big_step_id: json['big_step_id'],
        isFinished:json["isFinished"],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': title,
      'content': content,
      'image': image,
      'big_step_id': big_step_id,
      "isFinished":isFinished
    };
  }
}


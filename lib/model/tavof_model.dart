class TavofModel {
  final int? id;
  final String? title;
  final String? arab;
  final String? uzbek;
  final String? transcription;
  final int? step_id;
  final String? description;
  final String? audio;

  TavofModel(
      {this.id,
        this.title,
        this.arab,
        this.uzbek,
        this.transcription,
        this.step_id,
        this.description,
        this.audio});

  factory TavofModel.fromMap(Map<String, dynamic> json) => TavofModel(
    id: json['id'],
    title: json['title'],
    arab: json['arab'],
    uzbek: json['uzbek'],
    transcription: json['transcription'],
    step_id: json['step_id'],
    description: json["description"],
    audio: json["audio"]
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'title_big': arab,
      'content': uzbek,
      'image': transcription,
      'big_step_id': step_id,
      "isFinished": description
    };
  }
}

class DemoModel {
  DemoModel({
      this.title, 
      this.subList,});

  DemoModel.fromJson(dynamic json) {
    title = json['title'];
    if (json['subList'] != null) {
      subList = [];
      json['subList'].forEach((v) {
        subList?.add(SubList.fromJson(v));
      });
    }
  }
  String? title;
  List<SubList>? subList;
DemoModel copyWith({  String? title,
  List<SubList>? subList,
}) => DemoModel(  title: title ?? this.title,
  subList: subList ?? this.subList,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    if (subList != null) {
      map['subList'] = subList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class SubList {
  SubList({
      this.subTitle,});

  SubList.fromJson(dynamic json) {
    subTitle = json['subTitle'];
  }
  String? subTitle;
SubList copyWith({  String? subTitle,
}) => SubList(  subTitle: subTitle ?? this.subTitle,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subTitle'] = subTitle;
    return map;
  }

}

var demoList = [
  DemoModel(title: "Умра ахкомлари",subList: [SubList(subTitle: "Сафар олди")]),
  DemoModel(title: "Ехром",subList: [
    SubList(subTitle: "Ехром боғлаш"),
    SubList(subTitle: "Нафл намоз"),
    SubList(subTitle: "Умра нияти")

  ])
];
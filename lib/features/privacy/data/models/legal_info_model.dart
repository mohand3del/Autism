import 'dart:convert';

class LegalInfoItem {
  final String title;
  final String content;

  LegalInfoItem({
    required this.title,
    required this.content,
  });

  factory LegalInfoItem.fromJson(Map<String, dynamic> json) {
    return LegalInfoItem(
      title: json['title'] ?? '',
      content: json['content'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
    };
  }
}

class LegalInfoModel {
  final List<LegalInfoItem> items;

  LegalInfoModel({
    required this.items,
  });

  factory LegalInfoModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> legalInfoList = json['LegalInfo'] ?? [];
    final items =
        legalInfoList.map((item) => LegalInfoItem.fromJson(item)).toList();
    return LegalInfoModel(items: items);
  }

  static LegalInfoModel parseRawJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return LegalInfoModel.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return {
      'LegalInfo': items.map((item) => item.toJson()).toList(),
    };
  }
}

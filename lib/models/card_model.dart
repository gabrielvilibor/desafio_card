class Cards {
  int? id;
  String? title;
  String? content;

  Cards({required this.id, required this.title, required this.content});

  Cards.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}
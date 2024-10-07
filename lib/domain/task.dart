class Task {
  int? id;
  String? content;
  int? status;

  Task({this.id, this.content, this.status});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['status'] = status;
    return data;
  }
}
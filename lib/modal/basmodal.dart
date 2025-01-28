class Data {
  String? id;
  String? question;
  String? answer;
  String? postDesc;

  Data({this.id, this.question, this.answer, this.postDesc});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    postDesc = json['post_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['post_desc'] = this.postDesc;
    return data;
  }

  static List<Data> ofdata(List data) {
    return data.map((e) => Data.fromJson(e)).toList();
  }
}

class Imageass {
  String? id;
  String? catName;
  String? catImage;
  int? noOfPost;

  Imageass({this.id, this.catName, this.catImage, this.noOfPost});

  Imageass.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    catName = json["cat_name"];
    catImage = json["cat_image"];
    noOfPost = json["no_of_post"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["cat_name"] = catName;
    _data["cat_image"] = catImage;
    _data["no_of_post"] = noOfPost;
    return _data;
  }

  static List<Imageass> ofimageass(List image) {
    return image.map((e) => Imageass.fromJson(e)).toList();
  }
}

class Questions {
  String? id;
  String? question;
  String? answer;
  String? postDesc;

  Questions({this.id, this.question, this.answer, this.postDesc});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    question = json["question"];
    answer = json["answer"];
    postDesc = json["post_desc"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["question"] = question;
    _data["answer"] = answer;
    _data["post_desc"] = postDesc;
    return _data;
  }

  static List<Questions> ofQuestions(List ques) {
    return ques.map((e) => Questions.fromJson(e)).toList();
  }
}

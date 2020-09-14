class Customers {
  Customers({
    this.content,
    this.totalPages,
    this.totalElements,
    this.size,
    this.numberPage,
  });

  List<Content> content;
  int totalPages;
  int totalElements;
  int size;
  int numberPage;

  Customers.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = new List<Content>();
      json['content'].forEach((v) {
        content.add(new Content.fromJson(v));
      });
    }
    totalPages = json["totalPages"];
    totalElements = json["totalElements"];
    size = json["size"];
    numberPage = json["number"] == 0 ? 1 : json["number"];
  }

  Map<String, dynamic> toJson() => {
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
    "totalPages": totalPages,
    "totalElements": totalElements,
    "size": size,
    "number": numberPage == 0 ? 1 : numberPage,
  };
}

class Content {
  Content({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  String phone;

  Content.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    email = json["email"];
    phone = json["phone"];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
  };
}


class Constans{
  static const baseUrl = "http://localhost:8080/api/v1/";
}
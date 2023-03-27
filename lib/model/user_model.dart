
class UserModel {
  String? userId;
  String? email;
  String? name;
  String? pic;

  UserModel({this.userId, this.email, this.name, this.pic});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['eamil'];
    name = map['name'];
    pic = map['pic'];
  }
  toJson() {
    return {
      'userId': userId,
      'eamil': email,
      'name': name,
      'pic': pic,
    };
  }
}

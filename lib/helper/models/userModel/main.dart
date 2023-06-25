class UserModel {
  String? refresh;

  String? access;

  UserModel({
    this.refresh,
    this.access,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['refresh'] = refresh;
    data['access'] = access;
    return data;
  }
}

class ErrorModel {
  String? detail;

  ErrorModel({
    this.detail,
  });
  ErrorModel.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
  }

  Map<String, dynamic> toJson(decode) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['detail'] = detail;

    return data;
  }
}

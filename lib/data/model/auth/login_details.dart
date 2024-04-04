class LoginDetails {
  bool? status;
  String? message;
  String? accessToken;
  String? tokenType;

  LoginDetails({this.status, this.message, this.accessToken, this.tokenType});

  LoginDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    return data;
  }
}

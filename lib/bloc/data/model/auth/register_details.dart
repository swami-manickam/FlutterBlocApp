class RegisterDetails {
  bool? status;
  String? message;
  String? accessToken;
  String? tokenType;

  RegisterDetails(
      {this.status, this.message, this.accessToken, this.tokenType});

  RegisterDetails.fromJson(Map<String, dynamic> json) {
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

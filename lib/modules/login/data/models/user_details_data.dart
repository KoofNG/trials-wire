import 'package:wirepay/core/models/wallet_model.dart';

class ResponseUserDetailsDto {
  String token;
  String firstName;
  String lastName;
  String email;
  String active;
  bool verified;
  int verificationLevel;
  bool hasWalletUsername;
  String wirepayTag;
  List<Wallets> wallets;
  String createdAt;

  ResponseUserDetailsDto({
    this.token,
    this.firstName,
    this.lastName,
    this.email,
    this.active,
    this.verified,
    this.verificationLevel,
    this.hasWalletUsername,
    this.wirepayTag,
    this.wallets,
    this.createdAt,
  });

  ResponseUserDetailsDto.initial()
      : token = '',
        firstName = '',
        lastName = '';

  ResponseUserDetailsDto.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    active = json['active'];
    verified = json['verified'];
    verificationLevel = json['verification_level'];
    hasWalletUsername = json['has_wallet_username'];
    wirepayTag = json['wirepay_tag'];
    if (json['wallets'] != null) {
      wallets = new List<Wallets>();
      json['wallets'].forEach((v) {
        wallets.add(new Wallets.fromJson(v));
      });
    }
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['active'] = this.active;
    data['verified'] = this.verified;
    data['verification_level'] = this.verificationLevel;
    data['has_wallet_username'] = this.hasWalletUsername;
    data['wirepay_tag'] = this.wirepayTag;
    if (this.wallets != null) {
      data['wallets'] = this.wallets.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

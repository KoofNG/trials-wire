class Wallets {
  String currency;
  String balance;

  Wallets({this.currency, this.balance});

  Wallets.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['balance'] = this.balance;
    return data;
  }
}

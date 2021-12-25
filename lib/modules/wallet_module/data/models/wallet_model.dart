class WalletDto {
  String currency;
  double availableBalance;

  WalletDto({this.currency, this.availableBalance});

  WalletDto.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    availableBalance = double.tryParse(json['available_balance'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['available_balance'] = this.availableBalance;
    return data;
  }
}

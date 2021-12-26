class CurrencyNameConverter {
  static String getCurrencyName({String currencyName}) {
    switch (currencyName) {
      case 'BTC':
        return 'Bitcoin';
        break;
      case 'NGN':
        return 'Nigerian Naira';
        break;
      case 'USD':
        return 'US Dollar';
        break;
      case 'GHS':
        return 'Ghana Cedi';
        break;
      case 'KES':
        return 'Kenyan Shilling';
        break;
      case 'ZAR':
        return 'South African Rand';
        break;
      case 'XAF':
        return 'Central African CFA';
        break;
      default:
        return 'New Currency';
    }
  }
}

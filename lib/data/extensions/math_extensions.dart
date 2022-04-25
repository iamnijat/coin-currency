extension ConversionMathOperationsExtensions on double {
  double get multiplyValueByTen {
    return this * 10;
  }

  double get multiplyValueByHundred {
    return this * 100;
  }

  double get makeLastDigitDroppped {
    return (this / 10).floorToDouble();
  }
}

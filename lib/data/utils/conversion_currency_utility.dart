class ConversionCurrencyUtility {
  static double calculateConversionValue(
    typedConversionValue,
    toConversionValue,
    fromConversionValue,
  ) {
    return typedConversionValue /
        toConversionValue.value! *
        fromConversionValue.value! /
        fromConversionValue.nominal!;
  }
}

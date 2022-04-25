import 'package:http/http.dart';
import '../models/view_model/currency_model/currency_view_model.dart';
import 'package:xml/xml.dart' as xml;
import 'dart:convert';
import 'fetch_default_conversion_item.dart';

class ParseCurrenciesXMLData {
  static List<CurrencyViewModel> parseCurrenciesXML(Response _response) {
    final _decoded = utf8.decode(_response.bodyBytes);
    final _raw = xml.XmlDocument.parse(_decoded);
    final _elements = _raw.findAllElements('Valute');
    List<CurrencyViewModel> _currencies = _convertMapToList(_elements);
    return _currencies;
  }

  static List<CurrencyViewModel> _convertMapToList(
      Iterable<xml.XmlElement> _elements) {
    List<CurrencyViewModel> _currencies;
    const _ignoredValuteList = ["XPD", "SDR", "XAU", "XAG", "XPT"];
    _currencies = _elements.map((element) {
      final _code = element.getAttribute('Code');
      final _name = element.findElements('Name').first.text;
      final _index = _name.indexOf(" ");
      final _nominal = element.findElements('Nominal').first.text;
      final _value = element.findElements('Value').first.text;
      return CurrencyViewModel(
          code: _code,
          name: _index > 0 ? _name.substring(_index + 1) : _name,
          nominal: int.tryParse(_nominal),
          value: double.tryParse(_value));
    }).toList();
    _currencies.removeWhere((e) => _ignoredValuteList.contains(e.code));
    _currencies.add(FetchDefaultConversionItem.fetchItem());
    _currencies.sort((a, b) => a.name!.compareTo(b.name.toString()));
    return _currencies;
  }
}

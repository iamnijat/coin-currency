part of widgets;

class NumKeyboardWidget extends StatefulWidget {
  final CurrencyBloc currencyBloc;
  final AppLocalizations localization;
  const NumKeyboardWidget(
    this.currencyBloc, {
    required this.localization,
    Key? key,
  }) : super(key: key);

  @override
  State<NumKeyboardWidget> createState() => _NumKeyboardWidgetState();
}

class _NumKeyboardWidgetState extends State<NumKeyboardWidget> {
  List tappedList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SimpleNumberButton(
                isTapped: tappedList.contains(1),
                number: 1,
                press: () => _insertToTypedValue(1)),
            SimpleNumberButton(
                number: 2,
                isTapped: tappedList.contains(2),
                press: () => _insertToTypedValue(2)),
            SimpleNumberButton(
                number: 3,
                isTapped: tappedList.contains(3),
                press: () => _insertToTypedValue(3)),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SimpleNumberButton(
                number: 4,
                isTapped: tappedList.contains(4),
                press: () => _insertToTypedValue(4)),
            SimpleNumberButton(
                number: 5,
                isTapped: tappedList.contains(5),
                press: () => _insertToTypedValue(5)),
            SimpleNumberButton(
                number: 6,
                isTapped: tappedList.contains(6),
                press: () => _insertToTypedValue(6)),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SimpleNumberButton(
                number: 7,
                isTapped: tappedList.contains(7),
                press: () => _insertToTypedValue(7)),
            SimpleNumberButton(
                number: 8,
                isTapped: tappedList.contains(8),
                press: () => _insertToTypedValue(8)),
            SimpleNumberButton(
                number: 9,
                isTapped: tappedList.contains(9),
                press: () => _insertToTypedValue(9)),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ClearAllInputButton(
              press: () => _deleteAllDigits('deleteAll'),
              isTapped: tappedList.contains('deleteAll'),
            ),
            SimpleNumberButton(
                number: 0,
                isTapped: tappedList.contains(0),
                press: () => _insertToTypedValue(0)),
            SingleBackspaceButton(
              press: () => _deleteOneDigit('deleteSingle'),
              isTapped: tappedList.contains('deleteSingle'),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }

  void _insertToTypedValue(value) {
    widget.currencyBloc
        .insertToTypedValueRate(value, context, widget.localization);
    _makeClickedDigitAnimation(value);
  }

  void _deleteAllDigits(value) {
    widget.currencyBloc.deleteAllDigitsFromTypedValue();
    _makeClickedDigitAnimation(value);
  }

  void _deleteOneDigit(value) {
    widget.currencyBloc.deleteDigitOneByOneFromTypedValue();
    _makeClickedDigitAnimation(value);
  }

  void _makeClickedDigitAnimation(value) {
    setState(() => tappedList.add(value));
    Timer((const Duration(milliseconds: 115)), () => _refreshAnimation(value));
  }

  void _refreshAnimation(value) =>
      setState(() => tappedList.removeWhere((item) => item == value));
}

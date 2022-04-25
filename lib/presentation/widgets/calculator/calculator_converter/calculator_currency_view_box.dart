part of widgets;

class CalculatorCurrencyViewBox extends StatelessWidget {
  final CurrencyBloc currencyBloc;
  const CalculatorCurrencyViewBox(
    this.currencyBloc, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 88.w,
          decoration: BoxDecoration(
            color: AppPalette.mainBackColor,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 5.w),
          child: Column(
            children: <Widget>[
              buildTypedValue(),
              SizedBox(
                height: 1.h,
              ),
              Center(
                  child: Text(
                currencyBloc.formattedDate,
                textAlign: TextAlign.center,
                style: AppStyles.greyColor11spw700Poppins,
              )),
            ],
          ),
        ),
      ],
    );
  }

  StreamBuilder<double> buildTypedValue() {
    return StreamBuilder<double>(
      initialData: 0,
      stream: currencyBloc.typedConversionStream,
      builder: (context, typedValueSnapshot) {
        return StreamBuilder<double>(
          initialData: 0.0,
          stream: currencyBloc.conversionStream,
          builder: (context, conversionValueSnapshot) {
            return AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                transitionBuilder:
                    (Widget child, Animation<double> animation) =>
                        ScaleTransition(
                          scale: animation,
                          child: child,
                        ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text:
                            '${(typedValueSnapshot.data ?? 0).makeFormattedWithSpace} ',
                        style: AppStyles
                            .mainHeadlineColor14spw700NotoSansLineHeight),
                    TextSpan(
                        text: '${currencyBloc.fromConversionValue.code} = ',
                        style: AppStyles
                            .mainHeadlineColor14spw700NotoSansLineHeight),
                    TextSpan(
                      text:
                          '${(conversionValueSnapshot.data ?? 0).makeFormattedWithSpace} ',
                      style:
                          AppStyles.mainHeadlineColor14spw700NotoSansLineHeight,
                    ),
                    TextSpan(
                      text: '${currencyBloc.toConversionValue.code}',
                      style:
                          AppStyles.mainHeadlineColor14spw700NotoSansLineHeight,
                    ),
                  ]),
                  key: UniqueKey(),
                ));
          },
        );
      },
    );
  }
}

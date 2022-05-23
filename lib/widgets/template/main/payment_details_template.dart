import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';

import '../../../const/constants.dart';
import '../../molecules/containers/drawer.dart';

class PaymentDetailsTemplate extends StatefulWidget {
  const PaymentDetailsTemplate({Key? key}) : super(key: key);

  @override
  _PaymentDetailsTemplateState createState() => _PaymentDetailsTemplateState();
}

class _PaymentDetailsTemplateState extends State<PaymentDetailsTemplate> {

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Online Payment"),
        backgroundColor: Constants.appColorAmber,
      ),

      drawer: DrawerWidget(),

      resizeToAvoidBottomInset: false,

      body: SingleChildScrollView(

          child: Column(
            children: [
              SizedBox(height: 10,),

              Center(
                child: Text(
                  'Total Amount (LKR)',
                  style: TextStyle(
                    color: Constants.appColorGray,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              SizedBox(height: 2,),

              Center(
                child: Text(
                  '11000.00',
                  style: TextStyle(
                    color: Constants.appColorBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),


              Container(
                // decoration: BoxDecoration(
                //   image: !useBackgroundImage
                //       ? const DecorationImage(
                //     //image: ExactAssetImage('assets/bg.png'),
                //     image: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fmoz.com%2Flink-explorer&psig=AOvVaw1gGX84gplWi3Ry_v9yF3t0&ust=1652776310647000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJC5_NnN4_cCFQAAAAAdAAAAABAD'),
                //     fit: BoxFit.fill,
                //   )
                //       : null,
                //   color: Colors.black,
                // ),
                child: SafeArea(
                  child: SizedBox(
                    height: 665,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 3,
                        ),
                        CreditCardWidget(
                          glassmorphismConfig: useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                          cardNumber: cardNumber,
                          expiryDate: expiryDate,
                          cardHolderName: cardHolderName,
                          cvvCode: cvvCode,
                          showBackView: isCvvFocused,
                          obscureCardNumber: true,
                          obscureCardCvv: true,
                          isHolderNameVisible: true,
                          cardBgColor: Constants.appColorAmberMoreDark,
                          backgroundImage: useBackgroundImage ? null : null,
                          isSwipeGestureEnabled: true,
                          onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                          // customCardTypeIcons: <CustomCardTypeIcon>[
                          //   CustomCardTypeIcon(
                          //     cardType: CardType.mastercard,
                          //     cardImage: Image.asset(
                          //       'assets/images/mastercard_visa.png',
                          //       height: 48,
                          //       width: 100,
                          //     ),
                          //   ),
                          // ],
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Column(
                              children: <Widget>[
                                CreditCardForm(
                                  formKey: formKey,
                                  obscureCvv: true,
                                  obscureNumber: true,
                                  cardNumber: cardNumber,
                                  cvvCode: cvvCode,
                                  isHolderNameVisible: true,
                                  isCardNumberVisible: true,
                                  isExpiryDateVisible: true,
                                  cardHolderName: cardHolderName,
                                  expiryDate: expiryDate,
                                  themeColor: Colors.blue,
                                  textColor: Colors.black,
                                  cardNumberDecoration: InputDecoration(
                                    labelText: 'Number',
                                    hintText: 'XXXX XXXX XXXX XXXX',
                                    hintStyle: const TextStyle(color: Colors.black),
                                    labelStyle: const TextStyle(color: Colors.black),
                                    focusedBorder: border,
                                    enabledBorder: border,
                                  ),
                                  expiryDateDecoration: InputDecoration(
                                    hintStyle: const TextStyle(color: Colors.black),
                                    labelStyle: const TextStyle(color: Colors.black),
                                    focusedBorder: border,
                                    enabledBorder: border,
                                    labelText: 'Expired Date',
                                    hintText: 'XX/XX',
                                  ),
                                  cvvCodeDecoration: InputDecoration(
                                    hintStyle: const TextStyle(color: Colors.black),
                                    labelStyle: const TextStyle(color: Colors.black),
                                    focusedBorder: border,
                                    enabledBorder: border,
                                    labelText: 'CVV',
                                    hintText: 'XXX',
                                  ),
                                  cardHolderDecoration: InputDecoration(
                                    hintStyle: const TextStyle(color: Colors.black),
                                    labelStyle: const TextStyle(color: Colors.black),
                                    focusedBorder: border,
                                    enabledBorder: border,
                                    labelText: 'Card Holder',
                                  ),
                                  onCreditCardModelChange: onCreditCardModelChange,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: <Widget>[
                                //     const Text(
                                //       'Glassmorphism',
                                //       style: TextStyle(
                                //         color: Colors.black,
                                //         fontSize: 18,
                                //       ),
                                //     ),
                                //     Switch(
                                //       value: useGlassMorphism,
                                //       inactiveTrackColor: Colors.grey,
                                //       activeColor: Colors.black,
                                //       activeTrackColor: Colors.green,
                                //       onChanged: (bool value) => setState(() {
                                //         useGlassMorphism = value;
                                //       }),
                                //     ),
                                //   ],
                                // ),

                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: <Widget>[
                                //     const Text(
                                //       'Card Image',
                                //       style: TextStyle(
                                //         color: Colors.black,
                                //         fontSize: 18,
                                //       ),
                                //     ),
                                //     Switch(
                                //       value: useBackgroundImage,
                                //       inactiveTrackColor: Colors.grey,
                                //       activeColor: Colors.black,
                                //       activeTrackColor: Colors.green,
                                //       onChanged: (bool value) => setState(() {
                                //         useBackgroundImage = value;
                                //       }),
                                //     ),
                                //   ],
                                // ),

                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    primary: Colors.green,
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.all(12),
                                    child: const Text(
                                      'PAY',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'halter',
                                        fontSize: 14,
                                        package: 'flutter_credit_card',
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      print('valid!');
                                    } else {
                                      print('invalid!');
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),


              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 20),
              //   width: double.infinity,
              //   height: 300,
              //   color: Constants.appColorAmberTwo,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Divider(),
              //       SizedBox(height: 10,),
              //       Text(
              //         'Approved by the Central Bank of Sri Lanka',
              //         style: TextStyle(
              //           color: Constants.appColorGrayTwo,
              //         ),
              //       ),
              //       SizedBox(height: 10,),
              //     ],
              //   ),
              // ),


            ],
          ),

      ),
    );
  }



  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }


}

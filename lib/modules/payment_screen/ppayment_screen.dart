import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';

class PaymentScreennn extends StatefulWidget {
  @override
  State<PaymentScreennn> createState() => _PaymentScreennnState();
}

class _PaymentScreennnState extends State<PaymentScreennn> {
  var cardNumberController = TextEditingController();

  var expiryDateController = TextEditingController();

  var cardHolderNameController = TextEditingController();

  var cvvCodeController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isCvvFocused = false;

  OutlineInputBorder? border;

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumberController.text = creditCardModel!.cardNumber;
      expiryDateController.text = creditCardModel.expiryDate;
      cardHolderNameController.text = creditCardModel.cardHolderName;
      cvvCodeController.text = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Payment',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Card information',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ],
            ),
          ),
          CreditCardWidget(
            cardNumber: cardNumberController.text,
            expiryDate: expiryDateController.text,
            cardHolderName: cardHolderNameController.text,
            cvvCode: cvvCodeController.text,
            showBackView: isCvvFocused,
            backgroundImage: 'icons/card_bg.png',
            onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            obscureCardNumber: true,
            isSwipeGestureEnabled: true,
            obscureCardCvv: true,
            isHolderNameVisible: true,
            width: MediaQuery.of(context).size.width,
            customCardTypeIcons: <CustomCardTypeIcon>[
              CustomCardTypeIcon(
                cardType: CardType.mastercard,
                cardImage: Image.asset(
                  'icons/mastercard.png',
                  height: 47,
                  width: 47,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CreditCardForm(
                    cardNumber: cardNumberController.text,
                    expiryDate: expiryDateController.text,
                    cardHolderName: cardHolderNameController.text,
                    cvvCode: cvvCodeController.text,
                    onCreditCardModelChange: onCreditCardModelChange,
                    themeColor: Colors.blue,
                    formKey: formKey,
                    isHolderNameVisible: true,
                    isCardNumberVisible: true,
                    isExpiryDateVisible: true,
                    cardNumberDecoration: InputDecoration(
                      labelText: 'Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                      hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                      labelStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: defaultColor)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Color(0xffE8E8EE),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                      fillColor: const Color(0xffE8E8EE),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 15),
                    ),
                    expiryDateDecoration: InputDecoration(
                      hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                      labelStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: defaultColor)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Color(0xffE8E8EE),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                      fillColor: const Color(0xffE8E8EE),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 15),
                      labelText: 'Expired Date',
                      hintText: 'XX/XX',
                    ),
                    cvvCodeDecoration: InputDecoration(
                      hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                      labelStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: defaultColor)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Color(0xffE8E8EE),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                      fillColor: const Color(0xffE8E8EE),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 15),
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: InputDecoration(
                      hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                      labelStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: defaultColor)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Color(0xffE8E8EE),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                      fillColor: const Color(0xffE8E8EE),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 15),
                      labelText: 'Card Holder',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          print('valid!');
                        } else {
                          print('invalid!, ${cvvCodeController.text}');
                        }
                      },
                      text: 'Save')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

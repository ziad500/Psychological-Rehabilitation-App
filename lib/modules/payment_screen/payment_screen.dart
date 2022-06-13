import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';

class PaymentScreen extends StatefulWidget {
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with TickerProviderStateMixin {
  var cardNumberController = TextEditingController();
  var expiryDateController = TextEditingController();
  var cardHolderNameController = TextEditingController();
  var cvvCodeController = TextEditingController();
  var cvvFocus = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String cardHolderName = 'Holder Name';
  String? expiryDate;
  String? cVV;

  String formatedCardNumber = '**** **** **** ****';
  String formatedExpiryDate = 'MM/YY';
  String formatedCVV = '****';

  var value = 0;

  _PaymentScreenState() {
    cardNumberController = TextEditingController();
    cardNumberController.addListener(() {
      setState(() {
        cardNumber = cardNumberController.text;
      });
    });

    cardHolderNameController = TextEditingController();
    cardHolderNameController.addListener(() {
      setState(() {
        cardHolderName = cardHolderNameController.text;
      });
    });

    expiryDateController = TextEditingController();
    expiryDateController.addListener(() {
      setState(() {
        expiryDate = expiryDateController.text;
      });
    });

    cvvCodeController = TextEditingController();
    cvvCodeController.addListener(() {
      setState(() {
        cVV = cvvCodeController.text;
      });
    });
    cvvFocus.addListener(() {
      cvvFocus.hasFocus
          ? animationController!.forward()
          : animationController!.reverse();
      setState(() {});
    });
  }

  AnimationController? animationController;
  Animation<double>? flipAnimation;
  @override
  void dispose() {
    // TODO: implement dispose
    animationController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350));
    flipAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController!)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.of(context).pop();
                }
              },
              child: const Text(
                'Save',
                style: TextStyle(
                    color: defaultColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ))
        ],
        title: const Text(
          'Payment',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 18),
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
            crediteCard(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        defaultFormField(
                          context,
                          controller: cardNumberController,
                          type: TextInputType.number,
                          hint: 'Card Number',
                          maxLength: 16,
                          onChange: (value) {
                            formatedCardNumber =
                                this.cardNumber.padRight(16, '*');

                            formatedCardNumber =
                                formatedCardNumber.replaceAllMapped(
                                    RegExp(r".{4}"),
                                    (match) => "${match.group(0)} ");
                          },
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please Enter Card Number';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultFormField(context,
                            controller: cardHolderNameController,
                            type: TextInputType.name,
                            hint: ' Name On Card',
                            maxLength: 20, validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please Enter your name';
                          }
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          Expanded(
                            flex: 2,
                            child: defaultFormField(context,
                                controller: expiryDateController,
                                type: TextInputType.datetime,
                                hint: 'Expiry Date',
                                maxLength: 4, onChange: (value) {
                              formatedExpiryDate =
                                  this.expiryDate!.padRight(2, 'YYY');

                              formatedExpiryDate =
                                  formatedExpiryDate.replaceFirstMapped(
                                      RegExp(r".{2}"),
                                      (match) => "${match.group(0)}/");
                            }, validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please Enter Expiry Date';
                              }
                            }),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: defaultFormField(context,
                                controller: cvvCodeController,
                                type: TextInputType.number,
                                maxLength: 4,
                                focusNode: cvvFocus,
                                hint: 'CVV', onChange: (value) {
                              formatedCVV = this.cVV!.padRight(4, '*');
                            }, validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please Enter CVV';
                              }
                            }),
                          )
                        ]),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.of(context).pop();
                              }
                            },
                            text: 'Save')
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget crediteCard() {
    return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY((flipAnimation!.value < 0.5)
              ? pi * flipAnimation!.value
              : (pi * (1 + flipAnimation!.value))),
        origin: Offset(MediaQuery.of(context).size.width / 2, 0),
        child: flipAnimation!.value < 0.5 ? front() : back());
  }

  /* decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.indigo, Colors.indigoAccent])), */
  Widget front() {
    return Container(
      width: 500,
      height: 260,
      child: Card(
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 8,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                  image: AssetImage('icons/card_bg.png'), fit: BoxFit.cover)
              /* gradient:
                  LinearGradient(colors: [Colors.indigo, Colors.indigoAccent]) */
              ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: Image.asset('icons/mastercard.png')),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(formatedCardNumber,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.robotoMono(
                              fontSize: 24,
                              color: Colors.white,
                              letterSpacing: 2,
                              shadows: const [
                                Shadow(
                                    color: Colors.black12, offset: Offset(2, 1))
                              ],
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Card Holder',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(cardHolderName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Expiry',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(formatedExpiryDate,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image(
                      image: AssetImage('icons/chip.png'),
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget back() {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(pi * value),
      origin: Offset(MediaQuery.of(context).size.width / 2, 0),
      child: Container(
        width: 500,
        height: 260,
        child: Card(
            margin: const EdgeInsets.all(16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 8,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                      image: AssetImage('icons/card_bg.png'),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    height: 60,
                    color: Colors.black87,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 200,
                              alignment: Alignment.centerLeft,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              formatedCVV,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 12,
                          color: Colors.black45,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 12,
                          width: 150,
                          color: Colors.black45,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 12,
                          width: 150,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

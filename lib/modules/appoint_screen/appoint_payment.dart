import 'package:flutter/material.dart';
import 'package:phsyo/modules/appoint_screen/appoint_details.dart';
import 'package:phsyo/shared/components/components.dart';

class PaymentAppointScreen extends StatelessWidget {
  const PaymentAppointScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Icon(
                  Icons.money,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Session Fees',
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Text(
                  '170 EGP',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            const Spacer(),
            Center(
                child: defaultButton(
                    function: () {
                      navigateTo(context, AppointDetails());
                    },
                    text: 'Continue'))
          ],
        ),
      ),
    );
  }
}

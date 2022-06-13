import 'package:flutter/material.dart';
import 'package:phsyo/shared/components/components.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ\'s'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Frequently Asked Questions',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Container(
                      color: Colors.amber,
                      height: 5,
                      width: 260,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: [
                    Container(
                      color: Colors.amber,
                      height: 5,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'What is YOU platform ?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              myDivider(),
              const Text(
                'YOU is an online platform that is dedicated to providing top-tier mental health services to middle eastern communities all around the globe.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: [
                    Container(
                      color: Colors.amber,
                      height: 5,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'How can online therapy improve my life?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              myDivider(),
              const Text(
                'O7 Therapy is committed to reduce the difficulties of face-to-face therapy given the current circumstances. We use cutting-edge technology to provide you with accessible, top-notch mental health care in the comfort of your home.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: [
                    Container(
                      color: Colors.amber,
                      height: 5,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'How will I communicate with my therpaist?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              myDivider(),
              const Text(
                'Initially, you will start your online session with your therapist through A Video Call or Chat.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: [
                    Container(
                      color: Colors.amber,
                      height: 5,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'What happens if I’m dissatisfied with my session?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              myDivider(),
              const Text(
                'We are committed to providing the best possible mental health services. If you are dissatisfied with your session, please write your feedback in the form that appears after the session and we will be in touch shortly.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

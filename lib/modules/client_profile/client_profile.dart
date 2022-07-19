import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 5.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 120,
                              width: 110,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 6,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "https://scontent.fcai22-1.fna.fbcdn.net/v/t39.30808-6/280198885_3204029853219698_8376329503209490497_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Tf-Grz-lkzEAX8mIDYa&_nc_ht=scontent.fcai22-1.fna&oh=00_AT8aYTIE1-cEvjpbVFCnrtdjcjWhpCdcMGyDGB-9ijo3tQ&oe=62DABD4F"))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: const [
                            Icon(
                              Icons.assignment_ind_rounded,
                              color: defaultColor,
                              size: 17.0,
                            ),
                            SizedBox(
                              width: 6.11,
                            ),
                            Text(
                              'Gamal Sayed',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 21.0,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                          Row(children: const [
                            Icon(
                              Icons.male_rounded,
                              color: defaultColor,
                              size: 18,
                            ),
                            SizedBox(
                              width: 6.11,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0XFF616161),
                              ),
                            )
                          ]),
                          Row(children: const [
                            Icon(
                              Icons.calendar_today,
                              color: defaultColor,
                              size: 17.0,
                            ),
                            SizedBox(
                              width: 6.11,
                            ),
                            Text(
                              '4/11/1998',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0XFF616161),
                              ),
                            ),
                          ]),
                          Row(children: const [
                            Icon(
                              Icons.person_pin,
                              color: defaultColor,
                              size: 17.0,
                            ),
                            SizedBox(
                              width: 6.11,
                            ),
                            Text(
                              'Trusted Contact',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0XFF616161),
                              ),
                            ),
                          ]),
                          Row(children: const [
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Phone',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Color(0XFF616161),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '0123456789 "Uncle"',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0XFF616161),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  myDivider(),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.medical_services_rounded,
                        color: defaultColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Medical History',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'ahbdhjbvjdbnvjsdldvnlsknvlknvjnvdahbdhjbvjdbnvjsdldvnlsknvlk',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  myDivider(),
                  const SizedBox(
                    height: 10,
                  ),
                  reportItem(context)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*  Widget bottomSheet(context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(40.0)),
          ),
          height: 350.0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('icons/undraw_completed_re_cisp.png'),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Registration Done',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
                Text(
                  'Successfully',
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: defaultColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defaultButton(
                    function: () {
                      LoginCubit.get(context)
                          .userLogin(email: email, password: password);
                      // navigateAndFinish(context, const Applayout());
                    },
                    text: 'Start Your Journey')
              ],
            ),
          ),
        ),
      );
 */

  Widget report(context) => Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: defaultColor, width: 2)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: Text(
                          'Session Report',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                              fontSize: 20),
                        )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Doctor : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                  fontSize: 16,
                                ),
                              ),
                              const Text(
                                'Rawan Amr',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        myDivider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Profession : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.blue[900],
                                ),
                              ),
                              const Text(
                                'Rawan Amr',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        myDivider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Session Type : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.blue[900],
                                ),
                              ),
                              const Text(
                                'Rawan Amr',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        myDivider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                    Text(
                                      'Descripe The Patient\'s Condition',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900],
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              myDivider(),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Descripe The Patient\'s Condition Descripe The Patient\'s Condition Descr',
                                style: TextStyle(fontSize: 16),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
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
                                    Text(
                                      'Descripe The Patient\'s Condition',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900],
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              myDivider(),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Descripe The Patient\'s Condition Descripe The Patient\'s Condition Desc',
                                style: TextStyle(fontSize: 16),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
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
                                    Text(
                                      'Descripe The Patient\'s Condition',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900],
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              myDivider(),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Descripe The Patient\'s Condition Descripe The Patient\'s Condition De',
                                style: TextStyle(fontSize: 16),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                    Text(
                                      'Descripe The Patient\'s Condition',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900],
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              myDivider(),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                '- Descripe The Patient\'s Condition Descripe The Patient\'s Condition Deson',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.exit_to_app),
                      color: defaultColor,
                      iconSize: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget reportItem(context) => InkWell(
        onTap: () {
          /* Navigator.of(context).push(
                  PageRouteBuilder(
                      pageBuilder: (context, _, __) => repro(),
                      opaque: false),
); */
          showDialog(
            context: context,
            builder: (context) {
              return report(context);
            },
          );

          /*   showModalBottomSheet(
            barrierColor: Colors.transparent,
            isDismissible: false,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            context: context,
            builder: (context) => bottomSheet(context),
          ); */
        },
        child: Card(
            child: Container(
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: defaultColor)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.article,
                  color: defaultColor,
                  size: 50,
                ),
                Column(
                  children: const [
                    Text(
                      'Reprt by Dr.Rawan Amr',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      '15 jul',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )
                  ],
                ),
                Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
          ),
        )),
      );
}

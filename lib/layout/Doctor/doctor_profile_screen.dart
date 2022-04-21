import 'package:flutter/material.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';

class ProfileDoctorScreen extends StatelessWidget {
  const ProfileDoctorScreen({Key? key}) : super(key: key);

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
                                          "https://scontent.fcai22-1.fna.fbcdn.net/v/t39.30808-6/277168566_3170250476597636_7599140686835869072_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=0s3WD-hwKU0AX_WNEKX&_nc_ht=scontent.fcai22-1.fna&oh=00_AT9fuBp2SsRLH7vQWzG-RJSA-UkFxcyjhdl51j1J2kx4Vg&oe=624593BF"))),
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
                    'ahbdhjbvjdbnvjsdldvnlsknvlknvjnvdahbdhjbvjdbnvjsdldvnlsknvlknvjnvdahbdhjbvjdbnvjsdldvnlsknvlknvjnvdahbdhjbvjdbnvjsdldvnlsknvlknvjnvdahbdhjbvjdbnvjsdldvnlsknvlknvjnvdahbdhjbvjdbnvjsdldvnlsknvlknvjnvdahbdhjbvjdbnvjsdldvnlsknvlknvjnvdahbdhjbvjdbnvjsdldvnlsknvlknvjnvdahbdhjbvjdbahbdhjbvjdbnvjsdldvnlsknvlknvjnvdnvjsdldvnlsknvlknvjnvdahbdhjbvjdbnvjsdldvnlsknvlknvjnvdahbdhjbvjdbnvjsdldvnlsknvlknvjnvd',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ReviewItem() => Column(
        children: [
          Row(
            children: [
              Text(
                'Gamal ALi',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.star)
            ],
          ),
          Text(
            'Lorem ipsum Et consequatur rem nam doloribus. Ducimus quia voluptas blanditiis error',
            style: TextStyle(color: Color(0xff414141)),
          )
        ],
      );
}

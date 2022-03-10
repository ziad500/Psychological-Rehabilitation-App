import 'package:flutter/material.dart';
import 'package:phsyo/shared/components/components.dart';

import '../../styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
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
                                          "https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/119635227_2753084281647593_5838415930791994978_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=174925&_nc_ohc=qYivtokcF3kAX-5qShK&tn=gDLS0pIvW-5tRwod&_nc_ht=scontent.faly3-1.fna&oh=00_AT8nAdcTadjv2N4z4LtN1JOW4_Gf-lREcmnkKXuRhGNvnA&oe=623A444D"))),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          size: 30,
                          color: Colors.red,
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
                              Icons.add_circle_outline,
                              color: defaultColor,
                              size: 17.0,
                            ),
                            SizedBox(
                              width: 6.11,
                            ),
                            Text(
                              'Dr. Ziad Elblidy ',
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
                              Icons.work,
                              color: defaultColor,
                              size: 17.0,
                            ),
                            SizedBox(
                              width: 6.11,
                            ),
                            Text(
                              'Psychiatrist',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0XFF616161),
                              ),
                            )
                          ]),
                          Row(children: const [
                            Icon(
                              Icons.stars,
                              color: defaultColor,
                              size: 17.0,
                            ),
                            SizedBox(
                              width: 6.11,
                            ),
                            Text(
                              '6 Years Of Experience',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0XFF616161),
                              ),
                            ),
                          ]),
                          Row(children: const [
                            Icon(
                              Icons.language,
                              color: defaultColor,
                              size: 17.0,
                            ),
                            SizedBox(
                              width: 6.11,
                            ),
                            Text(
                              'Arabic, English',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0XFF616161),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  defaultButton(
                      function: () {},
                      text: 'Book a Session',
                      height: 40,
                      verticalpadding: 5),
                  const SizedBox(
                    height: 20,
                  ),
                  myDivider(),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.rate_review,
                        color: defaultColor,
                      ),
                      SizedBox(
                        width: 2.5,
                      ),
                      Text(
                        'Reviews',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => ReviewItem(),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 15.0,
                          ),
                      itemCount: 10)
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

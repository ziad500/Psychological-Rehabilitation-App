import 'package:flutter/material.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen(
      {Key? key,
      required this.name,
      required this.image,
      required this.yearOfExperience})
      : super(key: key);
  final String name;
  final String image;
  final String yearOfExperience;

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
                            Card(
                              elevation: 10,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const CircularProgressIndicator(
                                      color: defaultColor,
                                    ),
                                    FadeInImage.memoryNetwork(
                                      fadeInDuration:
                                          const Duration(milliseconds: 300),
                                      placeholder: kTransparentImage,
                                      image:
                                          'https://scontent.fcai22-1.fna.fbcdn.net/v/t1.6435-9/119635227_2753084281647593_5838415930791994978_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=174925&_nc_ohc=9w1vCey7WysAX9eScbQ&_nc_ht=scontent.fcai22-1.fna&oh=00_AT_lRREybImxXPn64hDYskKnm0d_gr_injuVrM-EnM1tew&oe=628569CD',
                                      width: 89,
                                      height: 134,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            )

                            /* Container(
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
                                  image:  DecorationImage(
                                      fit: BoxFit.fill,
                                      image: )),
                            ), */
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
                  const SizedBox(
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
                    children: const [
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
                      physics: const ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => reviewItem(),
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

  Widget reviewItem() => Column(
        children: [
          Row(
            children: const [
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
          const Text(
            'Lorem ipsum Et consequatur rem nam doloribus. Ducimus quia voluptas blanditiis error',
            style: TextStyle(color: Color(0xff414141)),
          )
        ],
      );
}

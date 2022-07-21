import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phsyo/constants.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../layout/cubit/app_cubit.dart';
import '../../models/doctors_list/doctors_model.dart';
import '../../shared/components/components.dart';
import '../appoint_screen/appoint_screen.dart';
import '../profile_screen/profile_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ListView.separated(
                  reverse: true,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return doctorCard(
                        context, AppCubit.get(context).favorite[index], index);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 15.0,
                      ),
                  itemCount: AppCubit.get(context).favorite.length)
              /* 
              AppCubit.get(context).favorite.isEmpty
                  ? ListView.separated(
                      reverse: true,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return doctorCard(
                            context,
                            /* AppCubit.get(context).doctorsModel */ AppCubit
                                    .get(context)
                                .favorite[index],
                            index);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 15.0,
                          ),
                      itemCount: AppCubit.get(context).favorite.length)
                  : const Center(
                      child: CircularProgressIndicator(
                        color: defaultColor,
                      ),
                    ), */
            ],
          ),
        ),
      ),
    );
  }

  Widget doctorCard(context, DoctorsDataModel? model, var index) => Container(
        height: 133.84,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 6,
                offset: Offset(0, 3),
              )
            ]),
        child: Material(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(15.0),
            splashColor: defaultColor,
            splashFactory: InkSplash.splashFactory,
            onTap: () {},
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0)),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const CircularProgressIndicator(
                              color: defaultColor,
                            ),
                            FadeInImage.memoryNetwork(
                              fadeInDuration: const Duration(milliseconds: 300),
                              placeholder: kTransparentImage,
                              image: model!.image.toString(),
                              width: 89,
                              height: 134,
                              fit: BoxFit.cover,
                            ),
                          ],
                        )),
                    const SizedBox(
                      width: 14.89,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 13.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    const Icon(
                                      Icons.add_circle_outline,
                                      color: defaultColor,
                                      size: 14.0,
                                    ),
                                    const SizedBox(
                                      width: 6.11,
                                    ),
                                    SizedBox(
                                      width: 140,
                                      child: Text(
                                        model.name.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  Row(children: [
                                    const Icon(
                                      Icons.work,
                                      color: defaultColor,
                                      size: 14.0,
                                    ),
                                    const SizedBox(
                                      width: 6.11,
                                    ),
                                    SizedBox(
                                      width: 140.0,
                                      child: Text(
                                        model.profession.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0XFF616161),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ]),
                                  Row(children: [
                                    const Icon(
                                      Icons.rate_review,
                                      color: defaultColor,
                                      size: 14.0,
                                    ),
                                    const SizedBox(
                                      width: 6.11,
                                    ),
                                    SizedBox(
                                      width: 140.0,
                                      child: Text(
                                        model.birthDate.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0XFF616161),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ]),
                                  Row(children: const [
                                    Icon(
                                      Icons.stars,
                                      color: defaultColor,
                                      size: 14.0,
                                    ),
                                    SizedBox(
                                      width: 6.11,
                                    ),
                                    SizedBox(
                                      width: 180,
                                      child: Text(
                                        '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0XFF616161),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        AppCubit.get(context)
                            .doctorsModel!
                            .doctors[index]
                            .sessionPrice
                            .toString(),
                        style: const TextStyle(
                            fontSize: 16.0,
                            color: Color(0XFF616161),
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        '/ Session',
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0XFF616161),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 23,
                          child: defaultButton(
                            function: () {
                              AppCubit.get(context)
                                  .getReviews(model.id.toString());

                              navigateTo(
                                  context,
                                  ProfileScreen(
                                    id: model.id.toString(),
                                    isDoctor: false,
                                    job: model.profession.toString(),
                                    salary: model.sessionPrice.toString(),
                                    image: model.image.toString(),
                                    name: model.name.toString(),
                                    yearOfExperience:
                                        model.licIssuedDate.toString(),
                                    languages: model.languages,
                                    profission: model.profession.toString(),
                                  ));
                            },
                            isUpperCase: false,
                            text: 'Profile',
                            color: Colors.white,
                            textColor: defaultColor,
                            textsize: 10.0,
                            verticalpadding: 0.0,
                            width: 73,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        SizedBox(
                          height: 23,
                          child: defaultButton(
                            function: () {
                              navigateTo(
                                  context,
                                  AppointScreen(
                                    image: model.image.toString(),
                                    id: model.id.toString(),
                                    isDoctor: false,
                                    job: model.profession.toString(),
                                    name: model.name.toString(),
                                    salary: model.sessionPrice.toString(),
                                  ));
                            },
                            isUpperCase: false,
                            text: 'Book a Session',
                            textsize: 10.0,
                            verticalpadding: 0.0,
                            width: 127,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

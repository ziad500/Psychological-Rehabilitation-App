import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/models/category_item_model/category_item_model.dart';
import 'package:phsyo/models/category_item_model/category_item_model.dart';
import 'package:phsyo/models/category_item_model/category_item_model.dart';
import 'package:phsyo/models/doctors_list/doctors_model.dart';
import 'package:phsyo/modules/profile_screen/profile_screen.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';

class CategoryModel {
  final String? image;
  final String? text;
  CategoryModel({required this.image, required this.text});
}

class HomeScreen extends StatelessWidget {
  List<CategoryModel> categoryItems = [
    CategoryModel(image: 'icons/icons8-therapy-100.png', text: 'Therapy'),
    CategoryModel(image: 'icons/icons8-yoga-64.png', text: 'Yoga'),
    CategoryModel(image: 'icons/icons8-coach-100.png', text: 'Life Coach'),
    CategoryModel(image: 'icons/icons8-nutrition-641.png', text: 'Nutrition')
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      if (state is AppLoadingDoctorsDataState) {
        CircularProgressIndicator();
      }
    }, builder: (context, state) {
      return Scaffold(
          backgroundColor: defaultColor,
          /* appBar: AppBar(
          backgroundColor: defaultColor,
          elevation: 0.0,
          toolbarHeight: 140,
          centerTitle: true,
          flexibleSpace: Center(
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return categoryItem(categoryItems[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10.0,
                    ),
                itemCount: categoryItems.length),
          ),
          /* ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                return categoryItem(categoryItems[index]);
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 10.0,
                  ),
              itemCount: categoryItems.length), */
          /* Container(
            height: 150,
            color: defaultColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return categoryItem(categoryItems[index]);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10.0,
                        ),
                    itemCount: categoryItems.length),
              ),
            ),
          ), */
        ),
       */
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Choose a category',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: 120,
                color: defaultColor,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 15),
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return categoryItem(categoryItems[index]);
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 10.0,
                            ),
                        itemCount: categoryItems.length),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                left: 18.0,
                                right: 18.0,
                                bottom: 15,
                              ),
                              child: AppCubit.get(context).doctorsModel != null
                                  ? ListView.separated(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: const ScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return doctorCard(
                                            context,
                                            AppCubit.get(context).doctorsModel,
                                            index);
                                      },
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                      itemCount: AppCubit.get(context)
                                          .doctorsModel!
                                          .doctors
                                          .length)
                                  : Center(
                                      child: Container(
                                          child: CircularProgressIndicator(
                                        color: defaultColor,
                                      )),
                                    ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ));
    });
  }

  Widget categoryItem(CategoryModel model) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 80,
            width: 79,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Material(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              child: InkWell(
                borderRadius: BorderRadius.circular(5.0),
                splashColor: defaultColor,
                splashFactory: InkSplash.splashFactory,
                onTap: () {},
                child: Container(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          '${model.image}',
                          height: 51,
                          width: 50,
                        ),
                        Container(
                          height: 17,
                          child: Text(
                            '${model.text}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0XFF000000),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  Widget doctorCard(context, DoctorsModel? model, var index) => Container(
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
                              image: model!.doctors[index].image.toString(),
                              width: 89,
                              height: 134,
                              fit: BoxFit.cover,
                            ),
                          ],
                        )
                        /* Image.network(
                        "https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/119635227_2753084281647593_5838415930791994978_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=174925&_nc_ohc=qYivtokcF3kAX-5qShK&tn=gDLS0pIvW-5tRwod&_nc_ht=scontent.faly3-1.fna&oh=00_AT8nAdcTadjv2N4z4LtN1JOW4_Gf-lREcmnkKXuRhGNvnA&oe=623A444D",
                        
                        width: 89,
                        height: 134,
                        fit: BoxFit.cover,
                      ), */
                        ),
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
                                    Container(
                                      width: 140,
                                      child: Text(
                                        model.doctors[index].name.toString(),
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
                                    Container(
                                      width: 140.0,
                                      child: Text(
                                        model.doctors[index].profession
                                            .toString(),
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
                                    Container(
                                      width: 140.0,
                                      child: Text(
                                        model.doctors[index].birthDate
                                            .toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0XFF616161),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ]),
                                  Row(children: [
                                    const Icon(
                                      Icons.stars,
                                      color: defaultColor,
                                      size: 14.0,
                                    ),
                                    const SizedBox(
                                      width: 6.11,
                                    ),
                                    Container(
                                      width: 180,
                                      child: const Text(
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
                              //  SizedBox(),
                            ],
                          ),
                          /* const SizedBox(
                            height: 10.0,
                          ),  */ //buttons
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: const [
                      Text(
                        '1000 EGP',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0XFF616161),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
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
                        Container(
                          height: 23,
                          child: defaultButton(
                            function: () {
                              AppCubit.get(context).getReviews(
                                  model.doctors[index].id.toString());
                              navigateTo(
                                  context,
                                  ProfileScreen(
                                    image:
                                        model.doctors[index].image.toString(),
                                    name: model.doctors[index].name.toString(),
                                    yearOfExperience: '',
                                    languages: model.doctors[index].languages,
                                    profission: model.doctors[index].profession
                                        .toString(),
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
                        Container(
                          height: 23,
                          child: defaultButton(
                            function: () {},
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

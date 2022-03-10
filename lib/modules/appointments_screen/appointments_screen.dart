import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/components.dart';
import '../../styles/colors.dart';

class CategoryModel {
  final String? image;
  final String? text;
  CategoryModel({required this.image, required this.text});
}

class AppointmentsScreen extends StatelessWidget {
  List<CategoryModel> categoryItems = [
    CategoryModel(image: 'icons/icons8-therapy-100.png', text: 'Therapy'),
    CategoryModel(image: 'icons/icons8-yoga-64.png', text: 'Yoga'),
    CategoryModel(image: 'icons/icons8-coach-100.png', text: 'Life Coach'),
    CategoryModel(image: 'icons/icons8-nutrition-641.png', text: 'Nutrition')
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: defaultColor,
      height: 500,
      child: Container(
        height: 100,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Text('data'),
            separatorBuilder: (context, index) => SizedBox(
                  width: 5,
                ),
            itemCount: 5),
      ),
    ));
  }
}

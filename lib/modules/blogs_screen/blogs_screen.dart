import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/models/articlesModel/articles_model.dart';
import 'package:phsyo/styles/colors.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 18.0, bottom: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'DISCOVER',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 150.0,
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => discoveryItem(),
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 10.0,
                            ),
                        itemCount: 10),
                  ),
                  Row(
                    children: [
                      const Text(
                        'LATEST ARTICLES',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: ElevatedButton(
                          child: const Text('ADD ARTICLE'),
                          style:
                              ElevatedButton.styleFrom(primary: defaultColor),
                          onPressed: () {
                            AppCubit.get(context).addToArticles(
                                name: 'Ziad gamal',
                                category: '',
                                title: 'testt new artisscle',
                                article:
                                    'testt new article testt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new article');
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      reverse: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) =>
                          articleItem(AppCubit.get(context).articles[index]),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 15.0,
                          ),
                      itemCount: AppCubit.get(context).articles.length),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget articleItem(ArticlesModel model) => Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    model.title,
                    style: const TextStyle(color: defaultColor),
                  ),
                  const Spacer(),
                  Text(model.date)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(model.article)
            ],
          ),
        ),
      ));

  /*  Widget articleItem(articlesModel model) => Padding(
        padding: const EdgeInsets.only(right: 18.0),
        child: Container(
          height: 25.2.h,
          /* 195 */
          width: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/6/67/Yellow-maple.jpg')),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(0.4),
                      // soften the shadow
                      spreadRadius: 0.0, //extend the shadow
                      offset: const Offset(
                        0, // Move to right 10  horizontally
                        0, // Move to bottom 5 Vertically
                      ),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    model.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
 */
  Widget discoveryItem() => Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://st2.depositphotos.com/2531455/5367/i/950/depositphotos_53675695-stock-photo-blue-roses.jpg',
                  ),
                ),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0)),
          ),
          const SizedBox(
            height: 6.0,
          ),
          const Text(
            'Depression',
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          )
        ],
      );
}

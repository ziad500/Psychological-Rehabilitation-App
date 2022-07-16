import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../layout/cubit/app_cubit.dart';

// ignore: must_be_immutable
class AddBlogsScreen extends StatelessWidget {
  AddBlogsScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSuccessAddArticleState) {
          Navigator.pop(context);
          showToast(
              text: state.addArticlesModel.message, state: ToastStates.success);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Article',
                      style: TextStyle(
                          color: const Color(0xff000000),
                          fontSize: 3.h,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    defaultFormField(context,
                        controller: AppCubit.get(context).titleController,
                        hint: 'Title of the Article',
                        type: TextInputType.text, validate: (value) {
                      if (value!.isEmpty) {
                        return "title must not be Empty";
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xffE8E8EE),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                    ),
                                    child: Column(
                                      children: [
                                        buildRadioBig('Therapy', context),
                                        buildRadioBig('Yoga', context),
                                        buildRadioBig('Life Coach', context),
                                        buildRadioBig('Nutrition', context),
                                      ],
                                    ),
                                  ));
                        },
                        child: Container(
                          height: 8.h,
                          decoration: const BoxDecoration(
                            color: Color(0xffE8E8EE),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: ListTile(
                              title: Text(
                                  AppCubit.get(context).categoryArticlevalue),
                              trailing: const Icon(
                                Icons.arrow_drop_down,
                                color: defaultColor,
                                size: 40,
                              )),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    defaultFormField(context,
                        controller: AppCubit.get(context).contentController,
                        hint: 'Article Content',
                        maxlines: 5,
                        height: 18,
                        type: TextInputType.text, validate: (value) {
                      if (value!.isEmpty) {
                        return "content must not be Empty";
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => bottomSheet(
                            camera: () => AppCubit.get(context)
                                .getCoverArticleImage(ImageSource.camera),
                            gallery: () => AppCubit.get(context)
                                .getCoverArticleImage(ImageSource.gallery),
                          ),
                        );
                      },
                      child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xffE8E8EE),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: AppCubit.get(context).coverArticleImage == null
                              ? FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.image,
                                        color: defaultColor,
                                        size: 35,
                                      ),
                                      Text(
                                        'Upload Your Photo / Video',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: Image.file(
                                      AppCubit.get(context).coverArticleImage!,
                                      fit: BoxFit.cover,
                                    ).image)),
                                  ),
                                )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        state is AppLoadingAddArticleState
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate() &&
                                      AppCubit.get(context)
                                              .categoryArticlevalue !=
                                          'Category' &&
                                      AppCubit.get(context).coverArticleImage !=
                                          null) {
                                    AppCubit.get(context).addArticle(
                                        title: AppCubit.get(context)
                                            .titleController
                                            .text,
                                        content: AppCubit.get(context)
                                            .contentController
                                            .text,
                                        category: AppCubit.get(context)
                                            .categoryArticlevalue);
                                  } else {
                                    showToast(
                                        text: 'Please Fill All Fields',
                                        state: ToastStates.error);
                                  }
                                },
                                text: 'submit'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildRadioBig(String value, context) {
    return Row(
      children: [
        Radio(
            value: value,
            groupValue: AppCubit.get(context).categoryArticlevalue,
            onChanged: (value) {
              AppCubit.get(context).changeCategoryArticleValue(value);
            }),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/layout/layout.dart';
import 'package:phsyo/modules/login_screen/login_cubit.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/components.dart';

class AddReportScreen extends StatelessWidget {
  AddReportScreen({Key? key, required this.id}) : super(key: key);
  final String id;
  var conditionController = TextEditingController();
  var progressController = TextEditingController();
  var planController = TextEditingController();
  var activitiesController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSuccessAddReportState) {
          showToast(
              text: 'Thank\'s For Your Report', state: ToastStates.success);
          navigateAndFinish(context, const Applayout());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Report'),
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Describe The Patient\'s Condition',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 2.h),
                  ),
                  defaultFormField(
                    context,
                    hint: 'Report Condition ....',
                    controller: conditionController,
                    height: 2.h,
                    maxlines: 4,
                    borderrrrrcolor: defaultColor,
                    borderEnableColor: defaultColor,
                    type: TextInputType.text,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "Please Enter condition";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'How Far Did You Help Him ?',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 2.h),
                  ),
                  defaultFormField(
                    context,
                    hint: 'Report Progress ...',
                    controller: progressController,
                    type: TextInputType.text,
                    height: 2.h,
                    maxlines: 4,
                    borderrrrrcolor: defaultColor,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "Please Enter progress";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'How Do You Plan To Treat His Condition ?',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 2.h),
                  ),
                  defaultFormField(
                    context,
                    hint: 'Report Plan ...',
                    controller: planController,
                    type: TextInputType.text,
                    height: 2.h,
                    maxlines: 4,
                    borderrrrrcolor: defaultColor,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "Please Enter plan";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'What Activities Your Client Might Benefit From ?',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 2.h),
                  ),
                  defaultFormField(
                    context,
                    borderrrrrcolor: defaultColor,
                    hint: 'Report Activites ...',
                    controller: activitiesController,
                    type: TextInputType.text,
                    height: 2.h,
                    maxlines: 4,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "Please Enter activites";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      state is AppLoadingAddReportState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: defaultColor,
                              ),
                            )
                          : defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  AppCubit.get(context).addReport(
                                      activities: activitiesController.text,
                                      condition: conditionController.text,
                                      id: id,
                                      plan: planController.text,
                                      progress: progressController.text,
                                      sessionType: '');
                                }
                              },
                              text: 'Submit'),
                    ],
                  )
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}

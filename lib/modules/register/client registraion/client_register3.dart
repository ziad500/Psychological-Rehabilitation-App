import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/modules/register/client%20registraion/client_register2.dart';
import 'package:phsyo/modules/register/client%20registraion/client_register4.dart';
import 'package:phsyo/modules/register/register_cubit/register_cubit.dart';
import 'package:phsyo/modules/register/register_cubit/register_states.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/shared/constraints.dart';
import 'package:phsyo/shared/network/cashe_helper.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

class ServicesModel {
  final String? title;
  final String? avatarImage;
  bool isCheck = false;
  ServicesModel(
      {required this.title, required this.avatarImage, required isCheck});
}

class clientRegister3 extends StatefulWidget {
  @override
  State<clientRegister3> createState() => _clientRegister3State();
}

class _clientRegister3State extends State<clientRegister3> {
  var ListController = PageController();
  List<String> text = [];

  void removeData() {
    /* 
    CasheHelper.removeData(key: 'date');
    CasheHelper.removeData(key: 'Address');
    CasheHelper.removeData(key: 'Country');
    CasheHelper.removeData(key: 'City');
    CasheHelper.removeData(key: 'mediacal History'); */
  }

  List<ServicesModel> Services = [
    ServicesModel(
        title: 'individual sessions',
        avatarImage: 'icons/icons8-person-neutral-skin-type-1-and-2-80.png',
        isCheck: false),
    ServicesModel(
        title: 'Couples Sessions',
        avatarImage: 'icons/icons8-couple-60.png',
        isCheck: false),
    ServicesModel(
        title: 'Family sessions',
        avatarImage: 'icons/icons8-family-80.png',
        isCheck: false),
    ServicesModel(
        title: 'Group sessions',
        avatarImage: 'icons/icons8-group-256.png',
        isCheck: false),
    ServicesModel(
        title: 'Teen sessions',
        avatarImage: 'icons/icons8-man-232.png',
        isCheck: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Services ',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxHeight >= 600.0) {
              return BigScreen(context);
            } else {
              return SmallScreen(context);
            }
          },
        ));
  }

  Widget BigScreen(context) => Column(
        children: [
          const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text('What type of session are you interested in ?')),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 60.h,
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => myDivider(),
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ListTileItemm(Services[index]),
              itemCount: Services.length,
            ),
          ),
          const Spacer(),
          defaultButton(
            function: () {
              if (text.length == 0) {
                showToast(text: 'Please Chosse', state: ToastStates.ERROR);
              } else {
                CasheHelper.saveData(key: 'Services', value: text.toList());
                print(text.toList());
                navigateTo(context, clientRegister4());
              }
            },
            text: 'continue',
          ),
          SizedBox(
            height: 1.h,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Learn about'),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Privacy',
                      style: TextStyle(color: defaultColor),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      );

  Widget SmallScreen(context) => SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'What type of session are you interested in ?',
              style: TextStyle(fontSize: 10.0.sp),
            ),
            SizedBox(
              height: 5.0,
            ),
            SizedBox(
              height: 350.0,
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => myDivider(),
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    ListTileItemmSmall(Services[index]),
                itemCount: Services.length,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            defaultButton(
              function: () {
                // removeData();

                if (text.length == 0) {
                  var ad = AlertDialog(
                    title: Text(
                      'please choose! ',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                  showDialog(
                    context: context,
                    builder: (context) => ad,
                  );
                } else {
                  CasheHelper.saveData(key: 'Service', value: text.toString());
                  navigateTo(context, clientRegister4());
                }
              },
              text: 'continue',
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Learn about'),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Privacy',
                      style: TextStyle(color: defaultColor),
                    ))
              ],
            ),
          ],
        ),
      );

  Widget ListTileItemm(ServicesModel model) => Column(
        children: [
          ListTile(
            leading: Image.asset(
              '${model.avatarImage}',
              width: 40,
              height: 40,
            ),
            title: CheckboxListTile(
              value: model.isCheck,
              onChanged: (value) {
                setState(() {
                  model.isCheck = value!;
                  if (value == true) {
                    text.add('${model.title}');
                  } else if (value == false) {
                    text.remove('${model.title}');
                  }
                });
              },
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '${model.title}',
                  style: TextStyle(fontSize: 13.0.sp),
                ),
              ),
            ),
          ),
        ],
      );

  Widget ListTileItemmSmall(ServicesModel model) => Column(
        children: [
          ListTile(
            leading: Image.asset(
              '${model.avatarImage}',
              width: 30,
              height: 30,
            ),
            title: CheckboxListTile(
              value: model.isCheck,
              onChanged: (value) {
                setState(() {
                  model.isCheck = value!;
                  if (value == true) {
                    text.add('${model.title}');
                  } else if (value == false) {
                    text.remove('${model.title}');
                  }
                });
              },
              title: Text(
                '${model.title}',
                style: TextStyle(fontSize: 13.0.sp),
              ),
            ),
          ),
        ],
      );
}

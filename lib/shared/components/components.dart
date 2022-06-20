import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phsyo/styles/colors.dart';

void navigateTo(context, Widget) => Navigator.push(
    context, PageTransition(child: Widget, type: PageTransitionType.fade));

/* void navigateTo(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Widget),
    ); */

void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Widget),
      (Route<dynamic> route) => false,
    );

Widget searchForm() => Container(
      height: 31,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: defaultColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: defaultColor)),
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        ),
      ),
    );

Widget titleText(String title) => Text(
      title,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    );

Widget defaultFormField(
  context, {
  required TextEditingController controller,
  required TextInputType type,
  String? Function(String?)? onSubmit,
  String? Function(String?)? onChange,
  Function()? onTap,
  bool isPassword = false,
  required String? Function(String?)? validate,
  String? label,
  double height = 7.5,
  String? hint,
  Color? bodercolor,
  IconData? prefix,
  IconData? suffix,
  int maxlines = 1,
  double hintsize = 2.5 /* 18.0 */,
  double labelsize = 2.5,
  double verticalpadding = 18.0,
  double horizontalpadding = 15.0,
  Color BorderEnableColor = defaultColor,
  Color BorderColor = Colors.grey,
  int? maxLength,
  FocusNode? focusNode,
  Function()? suffixPressed,
  bool isClickable = true,
}) =>
    SizedBox(
      height: height.h,
      child: TextFormField(
        maxLength: maxLength,
        textInputAction: TextInputAction.next, // Moves focus to next.
        textAlign: TextAlign.left,
        controller: controller,
        keyboardType: type,
        focusNode: focusNode,
        obscureText: isPassword,
        enabled: isClickable,
        maxLines: maxlines,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,

        onTap: onTap,
        validator: validate,
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 0),
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          filled: true,
          fillColor: const Color(0xffE8E8EE),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              color: Color(0xffE8E8EE),
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: defaultColor)),
          labelText: label,
          labelStyle:
              TextStyle(fontSize: labelsize.h, fontWeight: FontWeight.w400),
          hintText: hint,
          hintStyle:
              TextStyle(fontSize: hintsize.h, fontWeight: FontWeight.w400),
          prefixIcon: prefix != null
              ? Icon(
                  prefix,
                )
              : null,
          isDense: true,
          contentPadding:
/*               EdgeInsets.only(bottom: 0, left: 15, right: 15, top: 15),
 */
              EdgeInsets.symmetric(
                  vertical: verticalpadding, horizontal: horizontalpadding),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffix,
                    color: defaultColor,
                  ),
                )
              : null,
        ),
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );

Widget CodeFormField(
  context, {
  required TextEditingController controller,
  required TextInputType type,
  String? Function(String?)? onSubmit,
  String? Function(String?)? onChange,
  Function()? onTap,
  required String? Function(String?)? validate,
  int maxlines = 1,
  double verticalpadding = 13.0,
  double horizontalpadding = 0.0,
}) =>
    TextFormField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.next, // Moves focus to next.
      controller: controller,
      keyboardType: type,
      maxLines: maxlines,
      maxLength: 1,
      onFieldSubmitted: onSubmit,
      onChanged: (_) => FocusScope.of(context).nextFocus(),
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        counterText: "",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        filled: true,
        fillColor: const Color(0xffE8E8EE),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            color: Color(0xffE8E8EE),
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.red)),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
            vertical: verticalpadding, horizontal: horizontalpadding),
      ),
      style: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );

Widget defaultButton(
        {double width = 250.0,
        double height = 55,
        bool isUpperCase = true,
        double radius = 50.0,
        IconData? icon,
        Color? textColor = Colors.white,
        Color? color = defaultColor,
        Color borderColor = defaultColor,
        required Function()? function,
        required String text,
        double verticalpadding = 14.0,
        double textsize = 14.0}) =>
    Container(
      height: height,
      width: width,
      child: MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        padding: EdgeInsets.symmetric(vertical: verticalpadding, horizontal: 5),
        onPressed: function,
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 29,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      isUpperCase ? text.toUpperCase() : text,
                      style: TextStyle(
                          color: textColor,
                          fontSize: textsize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            : FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  isUpperCase ? text.toUpperCase() : text,
                  style: TextStyle(
                      color: textColor,
                      fontSize: textsize,
                      fontWeight: FontWeight.bold),
                ),
              ),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(
            radius,
          ),
          color: color,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6,
              offset: Offset(0, 4),
            )
          ]),
    );

void showToast(
        {required String? text,
        required ToastStates state,
        Color textColor = Colors.white}) =>
    Fluttertoast.showToast(
        msg: '$text',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseToastColor(state), //chooseToastColor(state)
        textColor: textColor,
        fontSize: 16.0);
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}

Widget myDivider() => Container(
      height: 2.0,
      width: double.infinity,
      color: const Color(0xff707070),
    );

Widget bottomSheet({Function()? camera, Function()? gallery}) {
  return Container(
    height: 100.0,
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    child: Column(
      children: [
        const Text(
          'choose Profile Photo',
          style: TextStyle(fontSize: 20.0),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              borderRadius: BorderRadius.circular(12.0),
              color: defaultColor,
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                    onTap: camera,
/*                         AppCubit.get(context).getImage(ImageSource.camera);
 */
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Material(
              borderRadius: BorderRadius.circular(12.0),
              color: defaultColor,
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                    onTap: gallery,
                    /* () {
                        AppCubit.get(context).getImage(ImageSource.gallery);
                      }, */
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                        Text(
                          'Gallery',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
              ),
            )
          ],
        )
      ],
    ),
  );
}

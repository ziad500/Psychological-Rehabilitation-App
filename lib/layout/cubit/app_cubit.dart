import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phsyo/constants.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:http_parser/http_parser.dart';
import 'package:phsyo/models/ReportsModel/reports_model.dart';
import 'package:phsyo/models/appointmentModel/appointment_model.dart';
import 'package:phsyo/models/clientReservatiomModel/client_reservation_model.dart';

import 'package:phsyo/models/doctors_list/doctors_model.dart';
import 'package:phsyo/models/get_article_model/get_article_model.dart';
import 'package:phsyo/models/hourModel.dart';
import 'package:phsyo/models/reviewModel/review_model.dart';
import 'package:phsyo/modules/appointments_screen/appointments_screen.dart';
import 'package:phsyo/modules/blogs_screen/blogs_screen.dart';
import 'package:phsyo/modules/home_screen.dart/home_screen.dart';
import 'package:phsyo/modules/menu_screen/menu_screen.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/shared/network/cashe_helper.dart';
import 'package:phsyo/shared/network/endpoint.dart';

import '../../models/Doctorappointment/DoctorAppointment.dart';
import '../../models/addArticles/add_articles_model.dart';
import '../../models/articlesModel/articles_model.dart';
import '../../models/doctor_hours_model/doctor_hours_model.dart';
import '../../shared/network/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool? doctor;
  List<String> joblist = [
    'Therapist',
    'Life coach',
    'Yoga instructor',
    'Nutrionist '
  ];
  bool isFavorite = false;
  List<DoctorsDataModel> favorite = [];
  void makeFavorite() {
    isFavorite = !isFavorite;
    emit(AppaddFavoriteState());
  }

//  List<String> TitleScreens = ['Home', 'Appointments', 'Blogs', 'Menu'];
  List<Widget> titleScreen = [
    searchForm(),
    titleText('Appointments'),
    titleText('Blogs'),
    titleText('Menu'),
  ];
  List<Widget> titleDoctorScreens = [
    titleText('Appointments'),
    titleText('Blogs'),
    titleText('Menu')
  ];

  List<Widget> bottomDoctorScreens = [
    AppointmentsScreen(),
    BlogsScreen(),
    const MenuScreen()
/*     const MenuDoctorScreen(),
 */
  ];

  List<Widget> bottomScreens = [
    HomeScreen(),
    AppointmentsScreen(),
    BlogsScreen(),
    const MenuScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(AppChangeBottomNav());
  }

  File? profileImage;
  final ImagePicker picker = ImagePicker();

  Future getProfileImage(
    ImageSource source,
  ) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image == null) {
      return;
    }
    profileImage = File(image.path);
    emit(ImagePickerProfileSuccess());
  }

  /*  void getNameImage(String key) {
    if (profileImage == null) return;
    String base64 = base64Encode(profileImage!.readAsBytesSync());
    String imageName = profileImage!.path.split('/').last;
    CasheHelper.saveData(key: key, value: imageName);
  }
 */
  File? licenseImage;
  Future getlicenseImage(
    ImageSource source,
  ) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image == null) {
      return;
    }
    licenseImage = File(image.path);
    emit(ImagePickerLicenseSuccess());
  }

  List<ArticlesssModel> articles = [
    ArticlesssModel(
        name: 'Ziad Elblidy',
        category: '',
        title: 'testt new article',
        article:
            'testt new article testt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new article',
        date: DateTime.now().toString())
  ];
  /* ArticlesModel? articlesmodel;
  void addToArticles({
    required String name,
    required String category,
    required String title,
    required String article,
  }) {
    articles.add(ArticlesModel(
        name: name,
        category: category,
        title: title,
        article: article,
        date: DateTime.now().toString()));
    emit(AddToArticlesSuccess());
  } */

  //List<DoctorsModel> doctors = [];
  DoctorsModel? doctorsModel;
  void getDoctorsData() {
    emit(AppLoadingDoctorsDataState());
    DioHelper.getData(url: GETDOCTORS).then((value) {
      doctorsModel = DoctorsModel.fromjson(value.data);
      emit(AppSuccessDoctorsDataState());
    }).catchError((error) {
      if (error is DioError) {
        print('error is ${error.response?.data}');
      }
      emit(AppErrorDoctorsDataState());
    });
  }

  ReviewModel? reviewModel;
  void getReviews(String doctorId) {
    emit(AppLoadingGetReviewState());
    //  await Future.delayed(Duration(milliseconds: 200));
    DioHelper.getData(url: 'doctors/$doctorId/reviews').then((value) {
//      print(value.data[0]['name']);

      reviewModel = ReviewModel.fromJson(value.data);
      // print('comment is ${reviewModel?.reviews[0].comment}');
      // print(value['reviews'][0]['name']);
      emit(AppSuccessGetReviewState());
    }).catchError((error) {
      if (error is DioError) {
        print('error is ${error.response?.data}');
      }
      emit(AppErrorGetReviewState());
    });
  }

  ArticlesModel? articlesModel;
  void getArticles() {
    emit(AppLoadingGetArticlesState());
    DioHelper.getData(url: ARTICLES).then((value) {
      articlesModel = ArticlesModel.fromjson(value.data);
      // print('comment is ${reviewModel?.reviews[0].comment}');
      emit(AppSuccessGetArticlesState());
    }).catchError((error) {
      if (error is DioError) {
        print('error is ${error.response?.data}');
      }
      emit(AppErrorGetArticlesState());
    });
  }

  File? coverArticleImage;
  Future getCoverArticleImage(
    ImageSource source,
  ) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image == null) {
      return;
    }
    coverArticleImage = File(image.path);
    emit(ImagePickerCoverArticleSuccess());
  }

  var titleController = TextEditingController();
  var contentController = TextEditingController();

  String categoryArticlevalue = 'Category';
  void changeCategoryArticleValue(value) {
    categoryArticlevalue = value;
    emit(CategoryArticlevalueSuccessState());
  }

  AddArticlesModel? addArticlesModel;
  void addArticle({
    required String title,
    required String content,
    required String category,
  }) async {
    emit(AppLoadingAddArticleState());
    var data = FormData.fromMap({
      'cover': await MultipartFile.fromFile(
        coverArticleImage!.path,
        contentType: MediaType('image', 'jpg'),
      ),
      'title': title,
      'content': content,
      'category': category,
    });
    await DioHelper.postData(url: ARTICLES, data: data, token: token)
        .then((value) {
      addArticlesModel = AddArticlesModel.fromJson(value.data);
      getArticles();
      titleController.clear();
      contentController.clear();
      categoryArticlevalue = 'Category';
      coverArticleImage = null;

      print(addArticlesModel?.message);
      print(value);
      emit(AppSuccessAddArticleState(addArticlesModel!));
    }).catchError((error) {
      print(error);
      if (error is DioError) {
        print('error is ${error.response?.data}');
      }
      emit(AppErrorAddArticleState());
    });
  }

  DoctorHoursModel? doctorHoursModel;
  void getDoctorHours(String id) {
    emit(AppLoadingGetDoctorHoursState());
    DioHelper.getData(url: 'doctor/$id').then((value) {
      doctorHoursModel = DoctorHoursModel.fromJson(value.data);
      print(value);
      emit(AppSuccessGetDoctorHoursState());
    }).catchError((error) {
      if (error is DioError) {
        print('error is ${error.response?.data}');
      }
      emit(AppErrorGetDoctorHoursState());
    });
  }

  List<HourModel> doctorsEveningHours = [];
  List<HourModel> doctorsMorningHours = [];
  void getHours(String date) {
    emit(AppLoadingGetDoctorHourssState());
    doctorsEveningHours = [];
    doctorsMorningHours = [];
    doctorHoursModel?.calender.forEach((element) {
      if (element.date == date) {
        if (element.startAt!.contains('pm')) {
          doctorsEveningHours.add(HourModel(element.startAt.toString(), false));
        }
        if (element.startAt!.contains('am')) {
          doctorsMorningHours.add(HourModel(element.startAt.toString(), false));
        }
      }
    });
    emit(AppGetDoctorHoursState());
  }

  void doctorReservation({
    required String day,
    required String startAt,
    required String endAt,
    required String date,
  }) {
    emit(AppLoadingDoctorReservationState());
    DioHelper.postData(
            url: CALENDER,
            data: {
              "weekday": day,
              "startAt": startAt,
              "endAt": endAt,
              "date": date
            },
            token: token)
        .then((value) {
      emit(AppSuccessDoctorReservationState());
    }).catchError((error) {
      if (error is DioError) {
        print('error is ${error.response?.data}');
      }
      emit(AppErrorDoctorReservationState());
    });
  }

  ClientReservationModel? clientReservationModel;
  void clientReservation({
    required String day,
    required String startAt,
    required String roomName,
    required String date,
    required String doctorId,
  }) {
    emit(AppLoadingClientReservationState());
    DioHelper.postData(
            url: RESERVATION,
            data: {
              "weekday": day,
              "startDate": startAt,
              "date": date,
              "roomName": roomName,
              "doctor": doctorId
            },
            token: token)
        .then((value) {
      print(value);
      getAppointment();
      //getDoctorAppointment();

      clientReservationModel = ClientReservationModel.fromJson(value.data);
      print(value);
      emit(AppSuccessClientReservationState());
    }).catchError((error) {
      print('........$error');
      // clientReservationModel = ClientReservationModel.fromJson(error);

      emit(AppErrorClientReservationState());
    });
  }

  AppointmentModel? appointmentModel;
  void getAppointment() async {
    emit(AppLoadingGetReservationState());
    await DioHelper.getData(url: GETALLRESERVATION, token: token).then((value) {
      appointmentModel = AppointmentModel.fromJson(value.data);
      // print(appointmentModel?.totalReservations);
      //print(value);
/*       print(appointmentModel!.allReservations[0].doctor!.name);
 */
      emit(AppSuccessGetReservationState());
    }).catchError((error) {
      emit(AppErrorGetReservationState());
    });
  }

  DoctorAppointmentModel? doctorAppointmentModel;
  void getDoctorAppointment() {
    emit(AppLoadingGetDoctorAppointmentState());
    DioHelper.getData(url: 'getall', token: token).then((value) {
      doctorAppointmentModel = DoctorAppointmentModel.fromJson(value.data);
      print(doctorAppointmentModel!.totalbooking[0].userId!.email);
      //print(doctorAppointmentModel!.totalbooking!.length);

      emit(AppSuccessGetDoctorAppointmentState());
    }).catchError((error) {
      print(error);
      emit(AppErrorGetDoctorAppointmentState());
    });
  }

  void addReview(
      {required String id, required String rating, required String comment}) {
    emit(AppLoadingAddReviewState());
    DioHelper.postData(
        url: 'doctors/$id/reviews',
        token: token,
        data: {"rating": rating, "comment": comment}).then((value) {
      print(value);
      emit(AppSuccessAddReviewState());
    }).catchError((error) {
      emit(AppErrorAddReviewState());
    });
  }

  GetReportModel? getReportModel;
  void getReport(String id) {
    // '62cf2fb5e036240baf7ae8b8'
    emit(AppLoadingGetReportState());
    DioHelper.getData(url: 'reports/$id').then((value) {
      getReportModel = GetReportModel.fromJson(value.data);
      print(value);
      emit(AppSuccessGetReportState());
    }).catchError((error) {
      emit(AppErrorGetReportState());
    });
  }

  void addReport(
      {required String id,
      required String condition,
      required String plan,
      required String progress,
      required String activities,
      required String sessionType}) {
    // '62cf2fb5e036240baf7ae8b8'
    emit(AppLoadingAddReportState());
    DioHelper.postData(url: 'reports/$id', token: token, data: {
      "condition": condition,
      "plan": plan,
      "progress": progress,
      "activities": activities,
      "sessionType": sessionType
    }).then((value) {
      emit(AppSuccessAddReportState());
    }).catchError((error) {
      print(error);
      emit(AppErrorAddReportState());
    });
  }
}

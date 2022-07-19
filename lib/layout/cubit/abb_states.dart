import '../../models/addArticles/add_articles_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeBottomNav extends AppStates {}

class ImagePickerProfileSuccess extends AppStates {}

class ImagePickerLicenseSuccess extends AppStates {}

class ImagePickerCoverArticleSuccess extends AppStates {}

class AddToArticlesSuccess extends AppStates {}

class AppLoadingDoctorsDataState extends AppStates {}

class AppSuccessDoctorsDataState extends AppStates {}

class AppErrorDoctorsDataState extends AppStates {}

class AppLoadingProfileDataState extends AppStates {}

class AppSuccessProfileDataState extends AppStates {}

class AppErrorProfileDataState extends AppStates {}

class AppLoadingGetReviewState extends AppStates {}

class AppSuccessGetReviewState extends AppStates {}

class AppErrorGetReviewState extends AppStates {}

class AppLoadingGetArticlesState extends AppStates {}

class AppSuccessGetArticlesState extends AppStates {}

class AppErrorGetArticlesState extends AppStates {}

class CategoryArticlevalueSuccessState extends AppStates {}

class AppLoadingAddArticleState extends AppStates {}

class AppSuccessAddArticleState extends AppStates {
  final AddArticlesModel addArticlesModel;

  AppSuccessAddArticleState(this.addArticlesModel);
}

class AppErrorAddArticleState extends AppStates {}

class AppLoadingGetDoctorHoursState extends AppStates {}

class AppSuccessGetDoctorHoursState extends AppStates {}

class AppErrorGetDoctorHoursState extends AppStates {}

class AppLoadingGetDoctorHourssState extends AppStates {}

class AppGetDoctorHoursState extends AppStates {}

class AppLoadingDoctorReservationState extends AppStates {}

class AppSuccessDoctorReservationState extends AppStates {}

class AppErrorDoctorReservationState extends AppStates {}

class AppLoadingClientReservationState extends AppStates {}

class AppSuccessClientReservationState extends AppStates {}

class AppErrorClientReservationState extends AppStates {}

class AppLoadingGetReservationState extends AppStates {}

class AppSuccessGetReservationState extends AppStates {}

class AppErrorGetReservationState extends AppStates {}

class AppLoadingAddReviewState extends AppStates {}

class AppSuccessAddReviewState extends AppStates {}

class AppErrorAddReviewState extends AppStates {}

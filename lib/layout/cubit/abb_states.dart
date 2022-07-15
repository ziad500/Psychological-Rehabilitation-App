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

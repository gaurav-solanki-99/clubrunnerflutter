
import 'package:club_runner/view/splash_screen/SplashScreen.dart';
import 'package:get/get.dart';

import '../../view/main_page/MainScreen.dart';
import '../../view/screens/dash_board_screen/DashBoardScreen.dart';
import '../../view/screens/dash_board_screen/MemberShipTrainza.dart';
import '../../view/screens/dash_board_screen/RemoveMembership.dart';
import '../../view/screens/edit_profile_screen/EditProfileScreen.dart';
import '../../view/screens/event_screen/EventDetailScreen.dart';
import '../../view/screens/event_screen/EventScreen.dart';
import '../../view/screens/members/MemberDetailScreen.dart';
import '../../view/screens/members/MembersScreen.dart';
import '../../view/screens/news_screen/NewsDetails.dart';
import '../../view/screens/news_screen/NewsScreen.dart';
import '../../view/screens/news_screen/TwoNewsItems.dart';
import '../../view/screens/pb_screens/EditPersonalBestScreen.dart';
import '../../view/screens/pb_screens/PersonalBestScreen.dart';
import '../../view/screens/profile_screen/ProfileScreen.dart';
import '../../view/screens/setting/SettingScreen.dart';
import '../../view/screens/training_screen/TrainingScreen.dart';
import '../../view/screens/training_screen/ViewRouteScreen.dart';
import '../../view/screens/training_screen/workout_logbook/WorkoutLogbookScreen.dart';
import '../../view/singup_screen/OtpVerifyScreen.dart';
import '../../view/singup_screen/SingUpScreen.dart';
import '../../view/welcome_screen/WelcomeScreen.dart';

class RouteHelper{

  static String splashScreen = "/SplashScreen";
  static String welcomeScreen = "/WelcomeScreen";
  static String singUpScreen = "/SingUpScreen";
  static String otpVerifyScreen = "/OtpVerifyScreen";
  static String mainScreen = "/MainScreen";
  static String dashBoardScreen = "/DashBoardScreen";
  static String newsScreen = "/NewsScreen";
  static String trainingScreen = "/TrainingScreen";
  static String settingScreen = "/SettingScreen";
  static String membersScreen = "/MembersScreen";
  static String memberDetailScreen = "/MemberDetailScreen";
  static String viewRouteScreen = "/ViewRouteScreen";
  static String workoutLogbookScreen = "/WorkoutLogbookScreen";



  ///DIVYA
  static String profileScreen = "/ProfileScreen";
  static String newsDetails_Screen = "/NewsDetailsScreen";
  static String twonewsitemsScreen = "/TwoNewsItemsScreen";


  ///Diksha
  static String editProfileScreen = "/EditProfileScreen";
  static String eventDetailScreen = "/EventDetailScreen";
  static String eventScreen = "/EventScreen";
  static String personalBestScreen = "/PersonalBest";
  static String editpersonalBestScreen = "/EditPersonalBest";
  static String membershipScreen = "/Membership";
  static String removemembershipScreen = "/removeMembership";


  static String getSplashScreen() => splashScreen;
  static String getWelcomeScreen() => welcomeScreen;
  static String getSingUpScreen() => singUpScreen;
  static String getOtpVerifyScreen() => otpVerifyScreen;
  static String getMainScreen() => mainScreen;
  static String getDashBoardScreen() => dashBoardScreen;
  static String getEventScreen() => eventScreen;
  static String getNewsScreen() => newsScreen;
  static String getTrainingScreen() => trainingScreen;
  static String getSettingScreen() => settingScreen;
  static String getMembersScreen() => membersScreen;
  static String getMemberDetailScreen() => memberDetailScreen;
  static String getProfileScreen() => profileScreen;
  static String getEditProfileScreen() => editProfileScreen;
  static String getViewRouteScreen() => viewRouteScreen;
  static String getWorkoutLogbookScreen() => workoutLogbookScreen;
  static String getEventDetailScreen() => eventDetailScreen;
  static String getPersonalBestScreen() => personalBestScreen;
  static String getEditPersonalBestScreen() => editpersonalBestScreen;
  static String getNewsDetailsScreen() => newsDetails_Screen;
  static String getTwoNewsItemsScreen() => twonewsitemsScreen;
  static String getMembershipScreen() => membershipScreen;
  static String getremoveMembershipScreen() => removemembershipScreen;



  static var pageList =[
    GetPage(name: splashScreen, page: ()=> SplashScreen()),
    GetPage(name: welcomeScreen, page: ()=> const WelcomeScreen()),
    GetPage(name: singUpScreen, page: ()=> const SingUpScreen()),
    GetPage(name: otpVerifyScreen, page: ()=> const OtpVerifyScreen()),
    GetPage(name: mainScreen, page: ()=> const MainScreen()),
    GetPage(name: dashBoardScreen, page: ()=> const DashBoardScreen()),
    GetPage(name: eventScreen, page: ()=> const EventScreen()),
    GetPage(name: newsScreen, page: ()=> const NewsScreen()),
    GetPage(name: trainingScreen, page: ()=> const TrainingScreen()),
    GetPage(name: settingScreen, page: ()=> const SettingScreen()),
    GetPage(name: membersScreen, page: ()=> const MembersScreen()),
    GetPage(name: memberDetailScreen, page: ()=> const MemberDetailScreen()),
    GetPage(name: profileScreen, page: ()=> const ProfileScreen()),
    GetPage(name: editProfileScreen, page: ()=> const EditProfileScreen()),
    GetPage(name: viewRouteScreen, page: ()=> const ViewRouteScreen()),
    GetPage(name: workoutLogbookScreen, page: ()=> const WorkoutLogbookScreen()),
    GetPage(name: eventDetailScreen, page: ()=> const EventDetailScreen()),
    GetPage(name: personalBestScreen, page: ()=> const PersonalBest()),
    GetPage(name: editpersonalBestScreen, page: ()=> const EditPersonalBest()),
    GetPage(name: newsDetails_Screen, page: ()=> NewsDetailsScreen()),
    GetPage(name: twonewsitemsScreen, page: ()=> TwoNewsItemsScreen()),
    GetPage(name: membershipScreen, page: ()=> Membership()),
    GetPage(name: removemembershipScreen, page: ()=> removeMembership()),
  ];
}
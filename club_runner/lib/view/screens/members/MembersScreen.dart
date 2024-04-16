import 'package:club_runner/util/route_helper/RouteHelper.dart';
import 'package:club_runner/util/string_const/MyString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/asstes_image/AssetsImage.dart';
import '../../../util/bottomnav_common/BottomNavigationBarWidget.dart';
import '../../../util/custom_view/CustomView.dart';
import '../../../util/my_color/MyColor.dart';
import '../../../util/size_config/SizeConfig.dart';
import '../../../util/text_style/MyTextStyle.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({super.key});

  @override
  State<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var fontSize = SizeConfig.fontSize();

  List<Map<String,String>> listMap =   [
    {
      "title" :"Andrew",
      "subTitle" : "Barnes"
    },
    {
      "title" :"Bennie",
      "subTitle" : "McCarthy"
    },{
      "title" :"Clive",
      "subTitle" : "Simpkins"
    },{
      "title" :"Diana",
      "subTitle" : "Kelpworth"
    },{
      "title" :"Frank",
      "subTitle" : "Bannerman"
    },{
      "title" :"Geraid",
      "subTitle" : "yapp"
    },
  ];

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.scrollViewPadding!),
        child: Column(
          children: [
            SizedBox(
              height: heightPerBox! * 11,
            ),
            appBarShow(),

            showList(),

            Image.asset(
              MyAssetsImage.app_club_image_dash_board,
              height: heightPerBox! * 20,
              width: heightPerBox! * 25,
            )

          ],
        ),
      ),
       // bottomNavigationBar:BottomNavigationBarWidget()
    );
  }

  Widget appBarShow(){
    return  Row(
      children: [
        ClipOval(
          child: Material(
            color: MyColor.app_white_color, // Button color
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: heightPerBox! * 4.1,
                height: heightPerBox! * 4.1,
                padding: const EdgeInsets.only(left: 9),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: MyColor.screen_bg,
                  size: heightPerBox! * 2.9,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: CustomView.differentStyleTextTogether(
                MyString.member_var.substring(0, 3),
                FontWeight.bold,
                MyString.member_var.substring(3),
                FontWeight.w300,
                fontSize * 6,MyColor.app_white_color),
          ),
        ),
        ClipOval(
          child: Material(
            color: MyColor.app_white_color, // Button color
            child: InkWell(
              onTap: () {},
              child: Container(
                width: heightPerBox! * 4.1,
                height: heightPerBox! * 4.1,
                padding: const EdgeInsets.only(left: 3),
                child: Icon(
                  Icons.search,
                  color: MyColor.screen_bg,
                  size: heightPerBox! * 2.9,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget showList(){
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listMap.length,
      itemBuilder: (context, index) {
      return InkWell(
        onTap: (){
          var data = {
            "title" :listMap[index]["title"]!,
            "subTitle" : listMap[index]["subTitle"]!
          };
          Get.toNamed(RouteHelper.getMemberDetailScreen(),parameters: data);
        },
        child: Container(
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.white, width: 1)),
          margin: const EdgeInsets.only(bottom: 17),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                flex: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius:
                    BorderRadius.circular(heightPerBox! * 30),
                  ),
                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.circular(heightPerBox! * 17),
                    child: FadeInImage.assetNetwork(
                      placeholder: MyAssetsImage.app_loader,
                      placeholderFit: BoxFit.cover,
                      image:
                      "https://images.pexels.com/photos/1680172/pexels-photo-1680172.jpeg?auto=compress&cs=tinysrgb&w=600",
                      fit: BoxFit.cover,
                      height: heightPerBox! * 9,
                      width: heightPerBox! * 9,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      listMap[index]["title"]!,
                      softWrap: true,
                      style: MyTextStyle.textStyle(
                          FontWeight.w300, fontSize! * 4,MyColor.app_white_color),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      listMap[index]["subTitle"]!,
                      softWrap: true,
                      style: MyTextStyle.textStyle(
                          FontWeight.w500, fontSize! * 4,MyColor.app_white_color),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 0,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: MyColor.app_white_color,
                ),
              ),
            ],
          ),
        ),
      );
    },);
  }
}

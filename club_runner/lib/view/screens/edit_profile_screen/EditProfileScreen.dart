import 'dart:io';
import 'package:club_runner/controller/EditProfileController.dart';
import 'package:club_runner/util/asstes_image/AssetsImage.dart';
import 'package:club_runner/util/my_color/MyColor.dart';
import 'package:club_runner/util/text_style/MyTextStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../util/bottomnav_common/BottomNavigationBarWidget.dart';
import '../../../util/custom_view/CustomView.dart';
import '../../../util/size_config/SizeConfig.dart';
import '../../../util/string_const/MyString.dart';
import 'SelectImageDialog.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;
  var fontSize = SizeConfig.fontSize();

  // var checked = false.obs;
  Rx<File>? _imageFile = Rx<File>(File(""));

  final controller = EditProfileController();
 //final controller = Get.put(EditProfileController());

  Future<void> pickCameraImage(ImageSource camera) async {
    final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (imageFile != null) {
      _imageFile!.value = File(imageFile.path);

      _cropImage(_imageFile!.value.path);
    }
  }

  _cropImage(filePath) async {
    await ImageCropper.platform
        .cropImage(
            sourcePath: filePath,
            aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1))
        .then((value) {
        _imageFile!.value = File(value!.path);
        print("Image Path>>>" + _imageFile.toString());
    });
  }

  /// Get from gallery
  _getFromGallery(ImageSource gallery) async {
    XFile? pickedFile = (await ImagePicker.platform.getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    ));

    _cropImage(pickedFile!.path);
  }


  @override
  void initState() {
    // TODO: implement initState
    print(">>>> "+_imageFile!.value.toString());
    print(">>>> "+(_imageFile!.value.path=="").toString());


    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("Dispose");
    //Get.delete<EditProfileController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.scrollViewPadding!),
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomView.customAppBar(MyString.edit_var, MyString.profile_var,
                  heightPerBox!,fontSize , () {
                Get.back();
                  }),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: MyColor.app_white_color,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(MyString.yourinfo_var,
                        style: MyTextStyle.textStyle(FontWeight.w500,
                            fontSize * 4.5, MyColor.app_black_color)),
                    SizedBox(height: heightPerBox! * 2.5),

                    infoInput(MyString.first_name_var, MyString.enter_firstname_var, controller.firstnamectrl,TextInputType.text),
                    infoInput(MyString.surname_var, MyString.enter_lastname_var, controller.lastnamectrl,TextInputType.text),
                    infoInput(MyString.email_single_var, MyString.youremail_var, controller.emailctrl,TextInputType.emailAddress),
                    infoInput(MyString.contactNo_var, MyString.your_mobileNo_var, controller.contactNoctrl,TextInputType.number),
                    infoInput(MyString.dob_var, MyString.select_dob_var, controller.dobctrl,TextInputType.number),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(MyString.gender_var,
                            style: MyTextStyle.textStyle(FontWeight.w400,
                                fontSize * 3.5, MyColor.app_text_color)),
                        SizedBox(height: heightPerBox),
                        Container(
                          decoration: BoxDecoration(
                              color: MyColor.app_text_box_bg_color,
                              border: Border.all(
                                  color: MyColor.app_border_grey_color),
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Row(
                            children: [
                              controller.addRadioButton(0, MyString.male_var,context),
                              controller.addRadioButton(1, MyString.female_var,context),
                              controller.addRadioButton(2, MyString.other_var,context),
                            ],
                          ),
                        ),
                        SizedBox(height: heightPerBox! * 2),
                      ],
                    ),
                    infoInput(MyString.height_var, MyString.select_height_var, controller.heightctrl,TextInputType.number),
                    infoInput(MyString.weight_var, MyString.select_weight_var, controller.weightctrl,TextInputType.number),
                    infoInput(MyString.country_var, MyString.select_country_var, controller.countryctrl,TextInputType.text),
                    infoInput(MyString.state_province_var, MyString.select_state_province_var, controller.provincectrl,TextInputType.text),
                    infoInput(MyString.town_city_var, MyString.enter_town_city_var, controller.cityctrl,TextInputType.text),
                    infoInput(MyString.zipcode_var, MyString.enter_zipcode_var, controller.postalctrl,TextInputType.text),


                  ],
                ),
              ),
              Container(
                width: SizeConfig.screenWidth,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: MyColor.app_white_color,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                  Obx(() =>   CircleAvatar(
                    radius: 100,
                    backgroundColor: MyColor.app_border_grey_color,
                    child: CircleAvatar(
                        radius: 99,
                        backgroundColor: MyColor.app_grey_color,
                        child: (_imageFile!.value.path!="")?ClipOval(
                            child: Image.file(
                              _imageFile!.value,
                              // height: 120,
                              // width: 120,
                            ),):ClipOval(
                          child: Image.asset(MyAssetsImage.app_default_user,fit: BoxFit.fill),
                        )
                    ),
                  )),
                    SizedBox(height: heightPerBox! * 2),
                    Text(MyString.profile_picture_var,
                        style: MyTextStyle.textStyle(FontWeight.w500,
                            fontSize * 3.5, MyColor.app_black_color)),
                    SizedBox(height: heightPerBox! * 2),
                    CustomView.buttonShow(
                        MyString.select_photo_var, FontWeight.w500, widthPerBox!,
                      fontSize ,MyColor.app_pink_color,
                        () {
                      UploadImageDialog.show(context, () {
                        Get.back();
                        pickCameraImage(ImageSource.camera);
                      }, () {
                        Get.back();
                        _getFromGallery(ImageSource.gallery);
                      });
                    })
                  ],
                ),
              ),
              Container(
                width: SizeConfig.screenWidth,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: MyColor.app_white_color,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    CustomView.buttonShow(MyString.save_var, FontWeight.w500,
                        widthPerBox!,fontSize,MyColor.app_pink_color, () {
                      if(validation()){
                        CustomView.showToast("Profile Updated");
                      }
                        }),
                    SizedBox(height: heightPerBox! * 2),
                    Text(MyString.cancel_small_var,
                        style: MyTextStyle.textStyle(FontWeight.w500,
                            fontSize *4.5, MyColor.app_black_color))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
       // bottomNavigationBar: BottomNavigationBarWidget()
    );
  }


  Widget infoInput(String heading,hintText,TextEditingController controller,TextInputType inputType){
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading,
            style: MyTextStyle.textStyle(FontWeight.w400,
                fontSize * 3.5, MyColor.app_text_color)),
        SizedBox(height: heightPerBox),
        CustomView.profileTextFiled(
           controller,
            inputType,
            hintText,
            fontSize,
            fontSize*3,
            false),
        SizedBox(height: heightPerBox! * 2),
      ],
    );
  }



  bool validation() {
    if(controller.firstnamectrl.text.isEmpty){
      CustomView.showToast("Enter first name");
    }else if(controller.firstnamectrl.text.length<3){
      CustomView.showToast("First name should be minimum 3 character long");
    }else if(controller.lastnamectrl.text.isEmpty){
      CustomView.showToast("Enter last name");
    } else if (controller.emailctrl.text.trim().isEmpty) {
      CustomView.showToast("Enter email");
    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-z]{2,}").hasMatch(controller.emailctrl.text.trim())) {
      CustomView.showToast("Enter valid email");
    } else if(controller.contactNoctrl.text.trim().isEmpty){
      CustomView.showToast("Enter contact number");
    }else if(controller.dobctrl.text.trim().isEmpty){
      CustomView.showToast("Select date of birth");
    }else if(controller.select.value.isEmpty){
      CustomView.showToast("Select gender");
    }else if(controller.heightctrl.text.trim().isEmpty){
      CustomView.showToast("Select height");
    }else if(controller.weightctrl.text.trim().isEmpty){
      CustomView.showToast("Select weight");
    }else if(controller.countryctrl.text.trim().isEmpty){
      CustomView.showToast("Select country");
    }else if(controller.provincectrl.text.trim().isEmpty){
      CustomView.showToast("Select state/province");
    }else if(controller.cityctrl.text.trim().isEmpty){
      CustomView.showToast("Enter town/city");
    }else if(controller.postalctrl.text.trim().isEmpty){
      CustomView.showToast("Enter zip/postal code");
    }
    else {
      return true;
    }
    return false;
  }
}

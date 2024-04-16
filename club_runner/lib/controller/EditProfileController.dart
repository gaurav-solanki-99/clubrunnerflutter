import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../util/my_color/MyColor.dart';
import '../util/string_const/MyString.dart';
import '../util/text_style/MyTextStyle.dart';


///DIKSHA
class EditProfileController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;

  List gender = [MyString.male_var, MyString.female_var, MyString.other_var];
  var select = "".obs;


  TextEditingController dobctrl = TextEditingController();
  TextEditingController firstnamectrl = TextEditingController();
  TextEditingController lastnamectrl = TextEditingController();
  TextEditingController emailctrl = TextEditingController();
  TextEditingController contactNoctrl = TextEditingController();
  TextEditingController genderctrl = TextEditingController();
  TextEditingController heightctrl = TextEditingController();
  TextEditingController weightctrl = TextEditingController();
  TextEditingController countryctrl = TextEditingController();
  TextEditingController cityctrl = TextEditingController();
  TextEditingController provincectrl = TextEditingController();
  TextEditingController postalctrl = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;

      dobctrl.text = "${selectedDate.value.year}-${selectedDate.value.month}-${selectedDate.value.day}";

      print(">>> "+selectedDate.value.toString());
    }
  }

  Widget checkBox(double widthPerBox, RxBool checked) {
    return Obx(() {
      return ListTileTheme(
        horizontalTitleGap: 0,
        child: CheckboxListTile(
          side: BorderSide(color: MyColor.app_black_color),
          title: Text(
            "Share Publicly",
            style: MyTextStyle.textStyle(
                FontWeight.w500, widthPerBox * 2.5, MyColor.app_text_color),
          ),
          activeColor: Colors.white,
          value: checked.value,
          onChanged: (newValue) {
            checked.value = newValue!;
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
          checkColor: MyColor.app_white_color,
          fillColor: MaterialStateProperty.all(
            checked.value ? MyColor.app_black_color : MyColor.app_white_color,
          ),
          controlAffinity: ListTileControlAffinity.leading,
          visualDensity: VisualDensity.compact,
        ),
      );
    });
  }

  Obx addRadioButton(int btnValue, String title,BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio(
            // activeColor: Theme.of(context).primaryColor,
            value: gender[btnValue],
            groupValue: select.value,
            onChanged: (value) {
              print(value);
              select.value = value;
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // To avoid padding
            visualDensity: VisualDensity.compact, // To reduce space
            activeColor: Theme.of(context).primaryColor, // Selected color
            fillColor: MaterialStateProperty.resolveWith<Color>((states) { // Unselected color
              if (states.contains(MaterialState.selected)) {
                return Theme.of(context).primaryColor; // Color when selected
              }
              return MyColor.app_radio_grey_color; // Color when not selected
            }),
          ),
          Text(title,style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15,color: MyColor.app_hint_color),)
        ],
      );
    });
  }

  clear(){

  }

}
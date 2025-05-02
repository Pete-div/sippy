import 'package:fluttertoast/fluttertoast.dart';
import 'package:sippy/utils/colors.dart';

void showSuccessFlutterToast(String message){
   Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: appColors.darkPrimary,
        textColor: appColors.white,
        fontSize: 16.0
      );
}
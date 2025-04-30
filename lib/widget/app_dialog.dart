import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sippy/utils/colors.dart';
import 'package:sippy/utils/constants/app_colors.dart';


class DialogAction {
  final String title;
  final Function(BuildContext)? onPressed;

  DialogAction({required this.title, this.onPressed});
}

class AppDialog extends StatelessWidget {
  // final Widget child;
  // final Color buttonColor;

  final List<DialogAction>? actions;
  final String message;
  final String? title;
  // final BuildContext context;
  const AppDialog({
    Key? key,
    this.actions = const <DialogAction>[],
    required this.message,
    this.title,
  }) : super(key: key);

  // const AppDialog(
  //     {Key? key, required this.child, this.buttonColor = Colors.white})
  //     : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Dialog(
  //       backgroundColor: context.cardColor,
  //       child: Stack(
  //         children: [
  //           child,
  //           Positioned(
  //               right: 20, top: 20, child: CloseButton(color: buttonColor)),
  //         ],
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    List<DialogAction> a = actions ??
        <DialogAction>[
          DialogAction(title: 'Close', onPressed: Navigator.of(context).pop)
        ];
    return Platform.isIOS
        ? CupertinoAlertDialog(
            actions: [
                for (var item in a)
                  CupertinoDialogAction(
                    onPressed: () => item.onPressed != null
                        ? item.onPressed?.call(context)
                        : Navigator.of(context).pop(),
                    child: Text(
                      item.title,
                      textAlign: TextAlign.center,
                    ),
                  )
              ],
            title: (title != null)
                ? Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                  )
                : null,
            content: Text(
              message,
              textAlign: TextAlign.center,
            ))
        : AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            actions: [
              for (var item in a)
                TextButton(
                    onPressed: () => item.onPressed != null
                        ? item.onPressed?.call(context)
                        : Navigator.of(context).pop(),
                    child: Text(item.title))
            ],
            title: title != null ? Text(title ?? '') : null,
            content: Text(message),
          );
  }

  static success(BuildContext context, {String? title, String message = ''}) =>
      ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
          backgroundColor: Colors.green,
          onVisible: () {
            Future.delayed(const Duration(seconds: 5),
                () => ScaffoldMessenger.of(context).clearMaterialBanners());
          },
          content: Text(message),
          actions: [
            TextButton(
                onPressed: ScaffoldMessenger.of(context).clearMaterialBanners,
                child: const Text('Close'))
          ]));
  // MotionToast.success(
  //   title: title ?? "Success",
  //   description: message,
  //   position: MOTION_TOAST_POSITION.TOP,
  //   borderRadius: 1,
  //   animationType: ANIMATION.FROM_RIGHT,
  //   titleStyle: Theme.of(context).textTheme.headline6!,
  //   descriptionStyle: Theme.of(context).textTheme.bodyText1!,
  // ).show(context);
}

Future showAlertDialog(BuildContext context, Widget content,
    {double rightMargin = 50}) {
  AlertDialog alert = AlertDialog(
    contentPadding: const EdgeInsets.all(10),
    backgroundColor: AppColors.infoColor,
    content: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 200,
          // width: MediaQuery.of(context).size.width - 500,
          // margin: const EdgeInsets.symmetric(
          //   horizontal: 80,
          //   vertical: 40,
          // ),
          margin:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
          child: content,
        ),
        const Positioned(top: 0, right: 0, child: CloseButton())
      ],
    ),
  );
  // show the dialog
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

import 'package:flutter/material.dart';


void modalBottomSheetMenu(
    {BuildContext? context,
    double? radius,
    Widget? child,
    Color? color,
    double? height,
    bool? enableSheetDrag,
    bool? canBeDismissed}) async {
  showModalBottomSheet(
      context: context!,
      isDismissible: canBeDismissed ?? true,
      isScrollControlled: true,
      useRootNavigator: true,
      enableDrag: enableSheetDrag ?? true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? 10),
              topRight: Radius.circular(radius ?? 10))),
 builder: (_) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedPadding(
            duration: const Duration(milliseconds: 150),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: child,
                  ),
                ),
              ),
            ),
          );
        },
  );
}
    );
}

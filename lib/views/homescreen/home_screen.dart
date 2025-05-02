// ignore_for_file: use_build_context_synchronously, prefer_const_constructors_in_immutables, deprecated_member_use

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sippy/utils/constants/num_extensions.dart';
import 'package:sippy/utils/flutter_toast.dart';
import 'package:sippy/utils/locator.dart';
import 'package:sippy/utils/share_preference.dart';
import 'package:sippy/view_models/cart_view_model.dart';
import 'package:sippy/view_models/product_view_model.dart';
import 'package:sippy/utils/colors.dart';
import 'package:sippy/utils/constants/widget_extensions.dart';
import 'package:sippy/views/homescreen/components/single_item_details_screen.dart';
import 'package:sippy/widget/app_dialog.dart';
import 'package:sippy/widget/button.dart';
import 'package:sippy/widget/inputfield.dart';
import 'package:sippy/widget/show_bottomsheet.dart';
import 'package:sippy/widget/texts.dart';
import 'package:stacked/stacked.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductViewModel>.reactive(
        viewModelBuilder: () => ProductViewModel(),
        onViewModelReady: (model) {
          Future.delayed(const Duration(milliseconds: 20), () {
            chooseSession();
          });
        },
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              title: NormalText('Shop With Friends',
                  color: appColors.black, size: 16, weight: FontWeight.w800),
            ),
            body: GridView.builder(
              itemCount: model.products.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 3 / 2,
                  mainAxisExtent: 200,
                  mainAxisSpacing: 1,
                  maxCrossAxisExtent: 189,
                  crossAxisSpacing: 16),
              itemBuilder: (BuildContext context, int index) {
                return SingleItem(
                  product: model.products[index],
                );
              },
            ).padHorizontal(8),
          );
        });
  }

  void chooseSession() {
    showAlertDialog(context, const HomeDialog());
  }
}

class HomeDialog extends StatelessWidget {
  const HomeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
        viewModelBuilder: () => serviceLocator<CartViewModel>(),
        builder: (context, model, _) {
          if (model.isSessionCreated) {
            Future.microtask(() {
              Navigator.of(context).pop(); // dismiss dialog
            });
          }
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: appColors.white),
            height: 250,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                20.0.hi,
                NormalText(
                  'You are Welcome',
                  color: appColors.black,
                  size: 24,
                  weight: FontWeight.w700,
                ),
                20.0.hi,
                const NormalText(
                  'Choose any of this to proceed',
                  size: 12,
                  textAlign: TextAlign.center,
                ),
                20.0.hi,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SessionOption(
                        title: 'New Session',
                        function: () {
                          modalBottomSheetMenu(
                              context: context,
                              child: NewSessionBottomSheet(
                                onClose: () {
                                  Navigator.of(context).pop();
                                },
                                goToShop: () {},
                              ));
                        },
                        icon: 'assets/svgs/cart-arrow-down-svgrepo-com.svg'),
                    SessionOption(
                        title: 'Existing Session',
                        function: () async {
                          String? sessionId =
                              await LocalUserService.getSessionId();

                          if (sessionId != null) {
                            serviceLocator<CartViewModel>().joinExistingSession(
                                sessionId,
                                context,
                                () => Navigator.of(context).pop());
                          }
                        },
                        icon: 'assets/svgs/shopping-cart.svg'),
                  ],
                ),
                24.0.hi,
                GestureDetector(
                  onTap: () async {
                    modalBottomSheetMenu(
                        context: context,
                        child: FriendSessionBottomsheet(
                          name: await LocalUserService.getInviterName() ??
                              'Your Friend',
                          onClose: () {
                            Navigator.of(context).pop();
                          },
                          goToShop: () {},
                        ));
                  },
                  child: Container(
                    width: 260,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: appColors.darkPrimary),
                    child: Center(
                        child: NormalText(
                      'Join as Friend',
                      color: appColors.white,
                      weight: FontWeight.w700,
                      size: 14,
                    )),
                  ),
                )
              ],
            ),
          );
        });
  }
}

class FriendSessionBottomsheet extends StatefulWidget {
  FriendSessionBottomsheet(
      {super.key,
      required this.goToShop,
      required this.onClose,
      required this.name});

  final Function() goToShop;
  final Function() onClose;
  final String name;

  @override
  State<FriendSessionBottomsheet> createState() =>
      _FriendSessionBottomsheetState();
}

class _FriendSessionBottomsheetState extends State<FriendSessionBottomsheet> {
  final TextEditingController _textEditingController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  void updateLoader(bool status) {
    setState(() {
      isLoading = status;
    });
  }

  Future joinSession() async {
    updateLoader(true);
    Future.delayed(const Duration(seconds: 2))
        .then((value) => updateLoader(false));
    await LocalUserService.saveInviteeName(_textEditingController.text);
    await LocalUserService.saveCreatorName(_textEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
        viewModelBuilder: () => CartViewModel(),
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                5.0.hi,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    40.0.wi,
                    GestureDetector(
                      onTap: () {
                        widget.onClose();
                      },
                      child: Icon(
                        Icons.close_rounded,
                        size: 31,
                        color: appColors.black,
                      ),
                    ),
                  ],
                ),
                10.0.hi,
                NormalText(
                  '${widget.name} is inviting you to shop',
                  size: 15,
                  weight: FontWeight.w700,
                  textAlign: TextAlign.justify,
                ),
                10.0.hi,
                const NormalText(
                  ' NB: All customers are expected to put their correct full name. Amount topped up is only to be used within your wallet and not outside the app. So only top up amount you want to use at the moment.',
                  size: 12,
                  maxLines: 5,
                  textAlign: TextAlign.justify,
                ),
                40.0.hi,
                const Align(
                  alignment: Alignment.topLeft,
                  child: NormalText(
                    'Please,enter your Fullname to proceed',
                    size: 14,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.justify,
                  ),
                ),
                4.0.hi,
                Form(
                  key: formKey,
                  child: MkInputField(
                    controller: _textEditingController,
                    keyboard: TextInputType.number,
                    onChanged: (s) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field can't be empty";
                      }

                      return null;
                    },
                  ),
                ),
                35.0.hi,
                XButton(
                  onClick: () async {
                    if (!formKey.currentState!.validate()) {
                      return;
                    } else {
                      String? sessionId = await LocalUserService.getSessionId();

                      if (sessionId != null) {
                        viewModel.joinSession(sessionId, context, widget.name,
                            () async {
                          WidgetsBinding.instance
                              .addPostFrameCallback((_) async {
                            if (context.mounted) viewModel.updateDialog();
                            if (context.mounted) await joinSession();
                            if (context.mounted) Navigator.of(context).pop();
                            if (context.mounted) Navigator.of(context).pop();
                          });
                        });
                      }
                    }
                  },
                  text: isLoading ? 'Joining..' : "Start Shopping",
                  isLoading: isLoading,
                  buttonColor:
                      isLoading ? appColors.darkPrimary : appColors.primary,
                  radius: 10,
                ),
                15.0.hi,
              ],
            ),
          );
        });
  }
}

class NewSessionBottomSheet extends StatefulWidget {
  NewSessionBottomSheet({
    super.key,
    required this.goToShop,
    required this.onClose,
  });

  final Function() goToShop;
  final Function() onClose;

  @override
  State<NewSessionBottomSheet> createState() => _NewSessionBottomSheetState();
}

class _NewSessionBottomSheetState extends State<NewSessionBottomSheet> {
  final TextEditingController _textEditingController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void copyText(String text) {
    FlutterClipboard.copy(text);
    showSuccessFlutterToast("copied to your ClipBoard");
  }

  bool isLoading = false;
  bool isGenerated = false;
  void updateGenerating(bool status) {
    setState(() {
      isGenerated = status;
    });
  }

  void updateLoader(bool status) {
    setState(() {
      isLoading = status;
    });
  }

  Future generateLink() async {
    updateLoader(true);
    Future.delayed(const Duration(seconds: 2)).then((value) {
      updateLoader(false);
    }).then((value) {
      updateGenerating(true);
      showSuccessFlutterToast("Email sent to ${_textEditingController.text}");
    });
    await LocalUserService.saveInviterName(_textEditingController.text);
    await LocalUserService.saveCreatorName(_textEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
        viewModelBuilder: () => CartViewModel(),
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                5.0.hi,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    40.0.wi,
                    GestureDetector(
                      onTap: () {
                        widget.onClose();
                        widget.onClose();
                      },
                      child: Icon(
                        Icons.close_rounded,
                        size: 31,
                        color: appColors.black,
                      ),
                    ),
                  ],
                ),
                10.0.hi,
                const NormalText(
                  'Create a Session',
                  size: 20,
                  weight: FontWeight.w700,
                  textAlign: TextAlign.justify,
                ),
                10.0.hi,
                const NormalText(
                  ' NB: All customers are expected to put their correct full name. Amount topped up is only to be used within your wallet and not outside the app. So only top up amount you want to use at the moment.',
                  size: 12,
                  maxLines: 5,
                  textAlign: TextAlign.justify,
                ),
                30.0.hi,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: NormalText(
                    'Please enter your name to proceed',
                    size: 12,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.justify,
                  ),
                ),
                6.hi,
                Form(
                  key: formKey,
                  child: MkInputField(
                    controller: _textEditingController,
                    keyboard: TextInputType.number,
                    onChanged: (s) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field can't be empty";
                      }

                      return null;
                    },
                  ),
                ),
                10.hi,
                if (isGenerated)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const NormalText('Here is your generated link:'),
                          NormalText(
                            'http/app://shop/session/xyz12',
                            color: appColors.black,
                            size: 12,
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),
                      10.wi,
                      GestureDetector(
                          onTap: () {
                            copyText('http/app://shop/session/xyz12');
                          },
                          child: SvgPicture.asset(
                              'assets/svgs/copy-svgrepo-com.svg'))
                    ],
                  ),
                25.0.hi,
                if (!isGenerated)
                  XButton(
                    onClick: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      } else {
                        generateLink();
                        viewModel.updateDialog();
                      }
                    },
                    text: isLoading ? 'Generating....' : "Create a Session",
                    isLoading: viewModel.isBusy,
                    buttonColor:
                        isLoading ? appColors.darkPrimary : appColors.primary,
                    radius: 10,
                  ),
                15.0.hi,
              ],
            ),
          );
        });
  }
}

class SessionOption extends StatelessWidget {
  const SessionOption({
    super.key,
    required this.title,
    required this.icon,
    required this.function,
  });
  final String title;
  final String icon;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            function();
          },
          child: Container(
              decoration: BoxDecoration(
                  color: appColors.darkGrey, shape: BoxShape.circle),
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                icon,
                color: appColors.white,
              )),
        ),
        6.0.hi,
        NormalText(title, size: 12, weight: FontWeight.w700)
      ],
    );
  }
}

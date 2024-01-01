
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:music_player/utils/base/base_utils_export.dart';
import 'package:fluttertoast/fluttertoast.dart';


rebuild(context, {bool sleepBeforeRebuild = false, int sleepDuration = 1000, VoidCallback? rebuildTask}){
    try {
      sleepBeforeRebuild ?
      sleep(Duration(milliseconds: sleepDuration)) : null;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      rebuildTask?.call();
      (context as Element).markNeedsBuild();
      log('timeStamp from rebuild: $timeStamp');
    });
    } on Exception catch (e) {
      log(e.toString());
      ShowToastSnackBar.displayToast(message: 'error');
    } finally{
      /// ? Called here to excute it here if the rebuildTask did't excute in PostFrameCallback.
      rebuildTask?.call();
    }
  }

Widget getCenterCircularProgress({
  double? padding,
  double? size,
  Color? color,
  double radius = 12,
}) {
  return Container(
    padding: EdgeInsets.all(padding ?? 0.0),
    height: size,
    width: size,
    child: Center(
      child: CupertinoActivityIndicator(
        radius: radius,
      ),
    ),
  );
}

double getScreenWidth(BuildContext context, {bool realWidth = false}) {
  if (realWidth) {
    return MediaQuery.of(context).size.width;
  } //to preview widget like phone scale in preview

  if (kIsWeb) {
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width / 4
        : MediaQuery.of(context).size.height / 4;
  }

  return MediaQuery.of(context).orientation == Orientation.portrait
      ? MediaQuery.of(context).size.width
      : MediaQuery.of(context).size.height;
}

double getScreenHeight(BuildContext context, {bool realHeight = false}) {
  if (realHeight) {
    return MediaQuery.of(context).size.height;
  } //to preview widget like phone scale in preview
  if (kIsWeb) {
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.height / 1.4
        : MediaQuery.of(context).size.width / 1.4;
  }
  return MediaQuery.of(context).orientation == Orientation.portrait
      ? MediaQuery.of(context).size.height
      : MediaQuery.of(context).size.width;
}

void onPop(context, {String route = '', bool popPrevious = false}){
    Navigator.canPop(context) ?
    Navigator.pop(context) : MusicNavigation.navigate(context, route, clearHistory: popPrevious, replaceCurrentScreen: popPrevious);
  }

class ProgressCircleDialog {
  static bool _isShow = false;

  static void show(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => const Center(child: CircularProgressIndicator(strokeWidth: 2,)),
        barrierColor: MusicColors.transparent,
        barrierDismissible: false);
    _isShow = true;
  }

  static void timedShow(BuildContext context){
    Future.delayed(Durations.short2, () => show(context)).whenComplete(() => dissmed(context));
  }

  static dissmed(BuildContext context) {
    if (_isShow) {
      onPop(context);
      _isShow = false;
    }
  }
}

class ShowToastSnackBar {
  static Future<bool?> displayToast({
    required String? message,
    bool isError = false,
    bool isSuccess = false,
  }) {
    return Fluttertoast.showToast(
        msg: message!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        textColor: Colors.white,
        backgroundColor: const Color(0xff7A3FE1),
        fontSize: 14.0);

  }

  static void showSnackBars(BuildContext context,
      {required String? message,
        bool isError = false,
        bool isSuccess = false,
        Duration? duration,
        SnackBarAction? snackBarAction}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message!,
      ),
      duration: duration ?? const Duration(seconds: 3),
      action: snackBarAction,
      backgroundColor: isError
          ? Colors.red[800]
          : isSuccess
          ? Colors.green[800]
          : null,
    ));
  }
}
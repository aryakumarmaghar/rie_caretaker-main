import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../theme/custom_theme.dart';
import 'app_urls.dart';

//height & width
double screenWidth =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
double screenHeight =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;

Widget loading() {
  return Center(
    child: SpinKitFadingCircle(
      color: CustomTheme.appTheme,
      size: 40.0,
    ),
  );
}

Widget title(
  String title,
  double fSize,
) {
  return Text(
    title,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: AppUrls.fontFamilyKanit,
        color: Colors.black,
        fontSize: fSize,
        fontWeight: FontWeight.bold),
  );
}

Widget titleClr(String title, double fSize, Color clr, FontWeight fw) {
  return Text(
    title,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: AppUrls.fontFamilyKanit,
        color: clr,
        fontSize: fSize,
        fontWeight: fw),
  );
}

Widget height(double h) {
  return SizedBox(
    height: screenHeight * h,
  );
}

Widget width(double w) {
  return SizedBox(
    width: screenWidth * w,
  );
}

void showCustomToast(
  BuildContext context,
  String texts,
) {
  Fluttertoast.showToast(
    msg: texts,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}

Widget iconWidget(String name, double he, double wi) {
  return Image.asset(
    'assets/images/$name.png',
    fit: BoxFit.fill,
    height: he,
    width: wi,
  );
}

Widget imgLoadWid(String imgUrl, String asset, double h, double w, BoxFit fit,
    double radius) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: FadeInImage.assetNetwork(
        fit: fit,
        height: h,
        width: w,
        placeholderFit: fit,
        placeholder: asset,
        image: imgUrl,
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset(
            asset,
            fit: fit,
            height: h,
            width: w,
          );
        }),
  );
}

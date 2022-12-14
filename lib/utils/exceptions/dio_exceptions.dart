import 'package:dio/dio.dart';
import 'package:evo_mart/utils/error_popup/snackbar.dart';
import 'package:flutter/material.dart';

class DioException {
  void dioError(Object e, BuildContext context) {
    if (e is DioError) {
      if (e.response?.statusCode == 401) {
        SnackBarPop.popUp(
          context,
          'Unauthorized Error',
          Colors.red,
        );
      } else if (e.response?.statusCode == 400) {
        SnackBarPop.popUp(
          context,
          'Unknown field',
          Colors.red,
        );
      } else if (e.response?.statusCode == 403) {
        SnackBarPop.popUp(
          context,
          'User credential is not working',
          Colors.red,
        );
      } else if (e.toString() ==
          "[Error]: (006) Request Throttled. Over Rate limit: up to 2 per sec. See geocode.xyz/pricing") {
        SnackBarPop.popUp(
          context,
          'Failed, Please try again',
          Colors.red,
        );
      }
    }
  }
}

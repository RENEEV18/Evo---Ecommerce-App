// import 'dart:developer';

// import 'package:cliffhub/core/api/api_baseurl.dart';
// import 'package:cliffhub/core/api/api_endpoint.dart';
// import 'package:cliffhub/model/otp_model/otp_model.dart';
// import 'package:cliffhub/utils/exceptions/dio_exceptions.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';

// class VerifyOtpService {
//   SendOtpModel? otpModel;
//   Dio dio = Dio();
//   Future<SendOtpModel?> verifyOtp(
//       SendOtpModel model, String otpCode, BuildContext context) async {
//     try {
//       final Response response =
//           await dio.post(ApiBaseUrl().baseUrl + ApiEndpoints.verifyOtp, data: {
//         "number": model.toJson(),
//         "otp": otpCode,
//       });
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final verifyUserOtp = SendOtpModel.fromJson(response.data);
//         log(verifyUserOtp.toString());
//         log('otp done');
//         return verifyUserOtp;
//       }
//     } on DioError catch (e) {
//       log(e.message);
//       log('otp failed');
//       DioException().dioError(e, context);
//     }
//     return null;
//   }
// }

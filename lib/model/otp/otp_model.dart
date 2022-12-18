import 'package:evo_mart/model/otp/otp_enum.dart';
import 'package:evo_mart/model/sign_up_model/sign_up_model.dart';

class OtpModel {
  final SignupModel model;
  final OtpEnum screenCheck;

  OtpModel({
    required this.model,
    required this.screenCheck,
  });
}

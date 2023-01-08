import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:evo_mart/common/api/api_baseurl.dart';
import 'package:evo_mart/common/api/api_endpoint.dart';
import 'package:evo_mart/model/address/create_address.dart';
import 'package:evo_mart/model/address/get_address.dart';
import 'package:evo_mart/utils/dio_interceptor/interceptor.dart';
import 'package:evo_mart/utils/exceptions/dio_exceptions.dart';

class AddressService {
  Future<String?> addAddress(CreateAddressModel model, context) async {
    Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      log('try');
      final Response response = await dios.post(
        ApiBaseUrl().baseUrl + ApiEndpoints.address,
        data: model.toJson(),
      );
      log('response');

      if (response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final String result = response.data['message'];
          log(result.toString());
          return result;
        }
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }

  Future<List<GetAddressModel>?> getAddress(context) async {
    Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response = await dios.get(
        ApiBaseUrl().baseUrl + ApiEndpoints.address,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final List<GetAddressModel> model = (response.data as List)
              .map((e) => GetAddressModel.fromJson(e))
              .toList();

          log(response.data.toString());
          return model;
        }
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }

  Future<String?> updateAddress(
      CreateAddressModel model, String addressId, context) async {
    Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      log('try');
      final Response response = await dios.patch(
        "${ApiBaseUrl().baseUrl + ApiEndpoints.address}/$addressId",
        data: model.toJson(),
      );
      log('response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final String result = response.data['message'];
          log(result.toString());
          return result;
        }
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }

  Future<String?> deleteAddress(String addressId, context) async {
    Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      log('try');
      final Response response = await dios.delete(
        "${ApiBaseUrl().baseUrl + ApiEndpoints.address}/$addressId",
      );
      log('response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final String result = response.data['message'];
          log(result.toString());
          return result;
        }
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}

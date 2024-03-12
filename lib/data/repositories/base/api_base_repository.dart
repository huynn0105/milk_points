import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../utils/data_state.dart';

abstract class BaseApiRepository {
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<Response<T>> Function() request,
  }) async {
    try {
      final response = await request();
      if (response.statusCode == HttpStatus.ok) {
        return DataSuccess<T>(response.data as T);
      } else {
        throw DioException(
          response: response,
          requestOptions: response.requestOptions,
        );
      }
    } on DioException catch (error) {
      String message = 'An unknown error has occurred';
      if (error.response != null) {
        message = error.response!.data['error']['message'];
      }

      return DataFailed(errorMessage: message);
    } catch (e) {
      return DataFailed(errorMessage: '$e');
    }
  }

  @protected
  Future<DataState<T>> getStateOfFirebase<T>({
    required Future<T> Function() request,
  }) async {
    try {
      final response = await request();
      return DataSuccess<T>(response);
    } on DioException catch (error) {
      String message = 'An unknown error has occurred';
      if (error.response != null) {
        message = error.response!.data['error']['message'];
      }

      return DataFailed(errorMessage: message);
    } catch (e) {
      return DataFailed(errorMessage: '$e');
    }
  }
}

import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:DealerPortalApp/Component/ApiComponent.dart';
import 'package:DealerPortalApp/Model/Core/CustomerOrder.dart';
import 'package:DealerPortalApp/Model/Core/Message.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as https;

class CustomerOrderApiService {
  final String base = ApiComponent.CustomerOrderBaseURL;
  // *********************************************   loadAsset file *********************************************
  final String _dataPath = "asset/customerorder.json";
  Future<String> loadAsset() async {
    return await Future.delayed(Duration(seconds: 10), () async {
      return await rootBundle.loadString(_dataPath);
    });
  }

  // *********************************************   GET ALL COMPANY NAME LIST *********************************************
  Future<Either<Exception, String>> getAllCustomerOrder() async {
    String source = ApiComponent.CustomerOrderGetAll;
    String url = "https://" + base + source;
    try {
      // final queryParameters = {
      //   "api_key": "YOUR_API_HERE",
      // };
      // final uri = Uri.https(base, "/v1/images/search", queryParameters);
      final Uri uri = new Uri.https(base, source);
      // final Uri uri = new Uri(host: base , path: source, port: 8000);
      // print(uri);
      // final httpsclient = new httpsClient().get('127.0.0.1', 8000, '/api/companies');
      final response = await https.get(uri, headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      });

      // var dataString = await loadAsset();
      // List<dynamic> companyJson = jsonDecode(dataString);
      // List<CustomerOrder> customer = List<CustomerOrder>.from(companyJson.map((company) => CustomerOrder.fromJson(company)));
      // return customer;

      if (response.statusCode == 200) {
        // Iterable l = json.decode(response.body);
        // List<CustomerOrder> companies = List<CustomerOrder>.from(
        //     l.map((company) => CustomerOrder.fromJson(company)));
        // return Right(dataString);
        return Right(response.body);
      } else {
        throw Left(Exception('Failed to load company'));
      }
    } on SocketException {
      return Left(Exception("No Internet"));
    } catch (e) {
      return Left(Exception(e));
    }
  }

  // *********************************************   GET BY ID COMPANY NAME *********************************************
  Future<Either<Exception, String>> getByIdCustomerOrder(int id) async {
    String source = ApiComponent.CustomerOrderGetById;
    try {
      // final queryParameters = {
      //   "api_key": "YOUR_API_HERE",
      // };
      // final uri = Uri.https(endpoint, "/v1/images/search", queryParameters);
      final uri = Uri.https(base, source + id.toString());
      final response = await https.get(uri, headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      });
      if (response.statusCode == 200) {
        return Right(response.body);
      } else {
        return Left(Exception('Failed to load company'));
      }
    } on SocketException {
      return Left(Exception("No Internet"));
    } catch (e) {
      throw Left(Exception(e));
    }
  }

  // *********************************************   CREATE COMPANY NAME *********************************************
  Future<Either<Exception, String>> createCustomerOrder(
      CustomerOrder customerOrder) async {
    String source = ApiComponent.CustomerOrderCreate;
    try {
      final queryParameters = {
        "api_key": "YOUR_API_HERE",
      };
      // final uri = Uri.https(endpoint, "/v1/images/search", queryParameters);
      final uri = Uri.https(base, source);
      final response = await https
          .post(uri,
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/json",
              },
              body: customerOrder.toJson())
          .onError((error, stackTrace) => null);
      if (response.statusCode == 201 || response != null) {
        return Right(response.body);
      } else {
        return Left(Exception("Sorry Not Created. Try Again Later..."));
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // *********************************************  UPDATE COMPANY NAME *********************************************
  Future<Either<Exception, String>> updateCustomerOrder(
      CustomerOrder customerOrder, int id) async {
    String source = ApiComponent.CustomerOrderUpdate;
    try {
      final queryParameters = {
        "api_key": "YOUR_API_HERE",
      };
      // final uri = Uri.https(endpoint, "/v1/images/search", queryParameters);
      final uri = Uri.https(base, source + id.toString());
      final response = await https.put(uri,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
          },
          body: customerOrder.toJson());
      if (response.statusCode == 200) {
        return Right(response.body);
      } else if (response.statusCode == 404) {
        return Right(response.body);
      } else {
        return Left(Exception("Sorry Not Updated. Try Again Later..."));
      }
    } on SocketException {
      return Left(Exception("No Internet"));
    } catch (e) {
      throw Left(Exception(e));
    }
  }

  // *********************************************  DELETE COMPANY NAME *********************************************
  Future<Either<Exception, String>> deleteCustomerOrder(int id) async {
    String source = ApiComponent.CustomerOrderDelete;
    try {
      // final queryParameters = {
      //   "api_key": "YOUR_API_HERE",
      // };
      // final uri = Uri.https(endpoint, "/v1/images/search", queryParameters);
      final uri = Uri.https(base, source + id.toString());
      final response = await https.delete(uri, headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      });
      if (response.statusCode == 202) {
        return Right(response.body);
      } else if (response.statusCode == 404) {
        return Right(response.body);
      } else {
        return Left(Exception("Sorry Not Deleted. Try Again Later..."));
      }
    } on SocketException {
      return Left(Exception("No Internet"));
    } catch (e) {
      throw Left(Exception(e));
    }
  }
}

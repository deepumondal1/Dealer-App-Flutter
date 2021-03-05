import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:DealerPortalApp/Component/ApiComponent.dart';
import 'package:DealerPortalApp/Model/Core/CompanyName.dart';
import 'package:DealerPortalApp/Model/Core/Message.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as https;

class CompanyNameApiService {

  // *********************************************   loadAsset file *********************************************   
  final String _dataPath = "asset/companyname.json"; 
  Future<String> loadAsset() async {
    return await Future.delayed(Duration(seconds: 10), () async {
      return await rootBundle.loadString(_dataPath);
    });
  }

  // *********************************************   GET ALL COMPANY NAME LIST *********************************************   
  Future<Either<Exception,String>> getAllCompanyName() async {
    String base = ApiComponent.CompanyNameBaseURL;
    String source = ApiComponent.CompanyNameGetAll;
    String url = "https://" + base + source;
    try {
      // final queryParameters = {
      //   "api_key": "YOUR_API_HERE",
      // };
      // final uri = Uri.https(base, "/v1/images/search", queryParameters);
      final Uri uri = new Uri.https(base , source);
      // final Uri uri = new Uri(host: base , path: source, port: 8000);
      // print(uri);
      // final httpsclient = new httpsClient().get('127.0.0.1', 8000, '/api/companies');
      final response = await https.get(uri, headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      });

      // var dataString = await loadAsset();
      // List<dynamic> companyJson = jsonDecode(dataString);
      // List<CompanyName> companies = List<CompanyName>.from(companyJson.map((company) => CompanyName.fromMap(company)));
      // return companies;
      
      if (response.statusCode == 200) {
        // Iterable l = json.decode(response.body);
        // List<CompanyName> companies = List<CompanyName>.from(
        //     l.map((company) => CompanyName.fromJson(company)));
        return Right(response.body);

      } else {
        throw Left(Exception('Failed to load company'));
      }
    } on SocketException {
      return Left(Exception("No Internet"));
    } catch (e){
      throw Left(Exception(e));
    }
  }

  // *********************************************   GET BY ID COMPANY NAME *********************************************   
  Future<Either<Exception,String>> getByIdCompanyName(int id) async {
    String base = ApiComponent.CompanyNameBaseURL;
    String source = ApiComponent.CompanyNameGetById;
    try {
      // final queryParameters = {
      //   "api_key": "YOUR_API_HERE",
      // };
      // final uri = Uri.https(endpoint, "/v1/images/search", queryParameters);
      final uri = Uri.https(base , source + "/" + id.toString());
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
    } catch (e){
      throw Left(Exception(e));
    }
  }

  // *********************************************   CREATE COMPANY NAME *********************************************   
  Future<Either<Exception,String>> createCompanyName(CompanyName companyName) async {
    String base = ApiComponent.CompanyNameBaseURL;
    String source = ApiComponent.CompanyNameCreate;
    try {
      final queryParameters = {
        "api_key": "YOUR_API_HERE",
      };
      // final uri = Uri.https(endpoint, "/v1/images/search", queryParameters);
      final uri = Uri.https(base , source);
      final response = await https.post(uri, headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      }, body : companyName.toJson());
      if (response.statusCode == 201) {
        return Right(response.body);
      } else {
        return Left(Exception("Sorry Not Created. Try Again Later..."));
      }
    } on SocketException {
      return Left(Exception("No Internet"));
    } catch (e){
      throw Left(Exception(e));
    }
  }

  // *********************************************  UPDATE COMPANY NAME *********************************************   
  Future<Either<Exception,String>> updateCompanyName(CompanyName companyName, int id) async {
    String base = ApiComponent.CompanyNameBaseURL;
    String source = ApiComponent.CompanyNameUpdate;
    try {
      final queryParameters = {
        "api_key": "YOUR_API_HERE",
      };
      // final uri = Uri.https(endpoint, "/v1/images/search", queryParameters);
      final uri = Uri.https(base , source + id.toString());
      final response = await https.put(uri, headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      }, body : companyName.toJson());
      if (response.statusCode == 200) {
        return Right(response.body);
      } else if (response.statusCode == 404){
        return Right(response.body);
      } else {
        return Left(Exception("Sorry Not Updated. Try Again Later..."));
      }
    }catch (e){
      throw Left(e.toString());
    }
  }

  // *********************************************  DELETE COMPANY NAME *********************************************   
  Future<Either<Exception,String>> deleteCompanyName(int id) async {
    String base = ApiComponent.CompanyNameBaseURL;
    String source = ApiComponent.CompanyNameDelete;
    try {
      // final queryParameters = {
      //   "api_key": "YOUR_API_HERE",
      // };
      // final uri = Uri.https(endpoint, "/v1/images/search", queryParameters);
      final uri = Uri.https(base , source + id.toString());
      final response = await https.delete(uri, headers: {
        "Accept": "application/json",
        "content-type": "application/json"});
      if (response.statusCode == 202) {
        return Right(response.body);
      } else if (response.statusCode == 404){
        return Right(response.body);
      } else {
        return Left(Exception("Sorry Not Deleted. Try Again Later..."));
      }
    } on SocketException {
      return Left(Exception("No Internet"));
    } catch (e){
      throw Left(Exception(e));
    }
  }
}

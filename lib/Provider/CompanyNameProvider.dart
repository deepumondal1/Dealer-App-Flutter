import 'dart:convert';

import 'package:DealerPortalApp/Model/Core/CompanyName.dart';
import 'package:DealerPortalApp/Model/Core/Message.dart';
import 'package:DealerPortalApp/Model/Service/CompanyNameService.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:dartz/dartz.dart';

class CompanyNameProvider extends ChangeNotifier {
  final companyNameApiService = CompanyNameApiService();

  // *********************************************   GET ALL COMPANY NAME LIST *********************************************
  Future<List<CompanyName>> getAllCompanyNameProvider() async {
    List<CompanyName> companies = [];
    List<dynamic> companyJson;
    final apiResult = await companyNameApiService.getAllCompanyName();
    return apiResult.fold((l){
      return companies;
    },(r){
        companyJson = jsonDecode(r);
        companies = List<CompanyName>.from(companyJson.map((company) => CompanyName.fromMap(company)));
        return companies;
    });
  }

  // *********************************************   GET BY ID COMPANY NAME LIST *********************************************
  Future<Either<Exception,CompanyName>> getByIdCompanyNameProvider(int id) async {
    final apiResult =
        await companyNameApiService.getByIdCompanyName(id);
    // notifyListeners();
    return apiResult.fold((l){
      return Left(l);
    },(r){
      final company = CompanyName.fromJson(r);
      return Right(company);
    });
  }

  // *********************************************   CREATE COMPANY NAME LIST *********************************************
  Future<Either<Exception,Message>> createCompanyNameProvider(CompanyName companyName) async {
    final apiResult =
        await companyNameApiService.createCompanyName(companyName);
    // notifyListeners();
    return apiResult.fold((l){
      return Left(l);
    },(r){
      final message = Message.fromJson(r);
      return Right(message);
    });
  }

  // *********************************************   CREATE COMPANY NAME LIST *********************************************
  Future<Either<Exception,Message>> updateCompanyNameProvider(CompanyName companyName, int id) async {
    final apiResult = await companyNameApiService.updateCompanyName(companyName, id);
    // message = Message(message: "ok");
    // notifyListeners();
    return apiResult.fold((l){
      return Left(l);
    },(r){
      final message = Message.fromJson(r);
      return Right(message);
    });
  }

  // *********************************************   DELETE COMPANY NAME LIST *********************************************
  Future<Either<Exception,Message>> deleteCompanyNameProvider(int id) async {
    final apiResult = await companyNameApiService.deleteCompanyName(id);
    // message = Message(message: "ok");
    return apiResult.fold((l){
      return Left(l);
    },(r){
      final message = Message.fromJson(r);
      return Right(message);
    });
  }
}

import 'dart:convert';

import 'package:DealerPortalApp/Model/Core/CustomerOrder.dart';
import 'package:DealerPortalApp/Model/Core/Message.dart';
import 'package:DealerPortalApp/Model/Service/CustomerOrderService.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:dartz/dartz.dart';

class CustomerOrderProvider extends ChangeNotifier {
  final customerOrderApiService = CustomerOrderApiService();
  List<CustomerOrder> customerOrders = [];

  // *********************************************   GET ALL COMPANY NAME LIST *********************************************
  Future<List<CustomerOrder>> getAllCustomerOrderProvider() async {
    List<dynamic> customerOrderJson;
    final apiResult = await customerOrderApiService.getAllCustomerOrder();
    return apiResult.fold((l) {
      return customerOrders;
    }, (r) {
      customerOrderJson = jsonDecode(r);
      customerOrders = List<CustomerOrder>.from(customerOrderJson
          .map((customerOrder) => CustomerOrder.fromJson(customerOrder)));
      return customerOrders;
    });
  }

  // *********************************************   GET BY ID COMPANY NAME LIST *********************************************
  Future<Either<Exception, CustomerOrder>> getByIdCustomerOrderProvider(
      int id) async {
    final apiResult = await customerOrderApiService.getByIdCustomerOrder(id);
    // notifyListeners();
    return apiResult.fold((l) {
      return Left(l);
    }, (r) {
      final company = CustomerOrder.fromJson(jsonDecode(r));
      return Right(company);
    });
  }

  // *********************************************   CREATE COMPANY NAME LIST *********************************************
  Future<Either<Exception, Message>> createCustomerOrderProvider(
      CustomerOrder customerOrder) async {
    final apiResult =
        await customerOrderApiService.createCustomerOrder(customerOrder);
    // notifyListeners();
    return apiResult.fold((l) {
      return Left(l);
    }, (r) {
      final message = Message.fromJson(r);
      return Right(message);
    });
  }

  // *********************************************   CREATE COMPANY NAME LIST *********************************************
  Future<Either<Exception, Message>> updateCustomerOrderProvider(
      CustomerOrder customerOrder, int id) async {
    final apiResult =
        await customerOrderApiService.updateCustomerOrder(customerOrder, id);
    // message = Message(message: "ok");
    // notifyListeners();
    return apiResult.fold((l) {
      return Left(l);
    }, (r) {
      final message = Message.fromJson(r);
      return Right(message);
    });
  }

  // *********************************************   DELETE COMPANY NAME LIST *********************************************
  Future<Either<Exception, Message>> deleteCustomerOrderProvider(int id) async {
    final apiResult = await customerOrderApiService.deleteCustomerOrder(id);
    // message = Message(message: "ok");
    return apiResult.fold((l) {
      return Left(l);
    }, (r) {
      final message = Message.fromJson(r);
      return Right(message);
    });
  }
}

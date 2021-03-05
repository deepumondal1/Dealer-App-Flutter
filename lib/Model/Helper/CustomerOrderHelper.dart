// import 'dart:convert';

// import 'package:DealerPortalApp/Model/Core/CompanyName.dart';
// import 'package:DealerPortalApp/Model/Service/CompanyNameService.dart';

// class CompanyNameHelper {
//   final companyNameService = CompanyNameApiService();

//   Future<List<CompanyName>> getAllCompanyName() async {
//     final apiResult = await companyNameService.getAllCompanyName();
//     try {
//       Iterable l = json.decode(apiResult);
//       List<CompanyName> companies = List<CompanyName>.from(
//           l.map((company) => CompanyName.fromJson(company)));
//       return companies;
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }

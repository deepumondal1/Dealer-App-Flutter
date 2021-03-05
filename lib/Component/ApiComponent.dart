// class ApiComponent {
//   // COMPANY NAME API STRING
//   static String CompanyNameBaseURL = '127.0.0.1:8000';
//   static String CompanyNameGetAll = '/api/companies';
//   static String CompanyNameGetById = '';
//   static String CompanyNameCreate = '/api/companies';
//   static String CompanyNameUpdate = '/api/companies/';
//   static String CompanyNameDelete = '/api/companies/';

//   // CUSTOMER ORDER API STRING
//   static String CustomerOrderBaseURL = '127.0.0.1:8000';
//   static String CustomerOrderGetAll = '/api/customerOrder';
//   static String CustomerOrderGetById = '';
//   static String CustomerOrderCreate = '/api/customerOrder';
//   static String CustomerOrderUpdate = '/api/customerOrder/';
//   static String CustomerOrderDelete = '/api/customerOrder/';
// }
class ApiComponent {
  static String dir = '/laravelapp1/public';
  static String baseUrl = 'www.manglaitsolutions.com';
  // COMPANY NAME API STRING
  // static String CompanyNameBaseURL = 'schoolmanagesms.000webhostapp.com';
  static String CompanyNameBaseURL = baseUrl;
  static String CompanyNameGetAll = dir + '/api/companies';
  static String CompanyNameGetById = dir + '';
  static String CompanyNameCreate = dir + '/api/companies';
  static String CompanyNameUpdate = dir + '/api/companies/';
  static String CompanyNameDelete = dir + '/api/companies/';

  // CUSTOMER ORDER API STRING
  static String CustomerOrderBaseURL = baseUrl;
  static String CustomerOrderGetAll = dir + '/api/customerOrder';
  static String CustomerOrderGetById = dir + '';
  static String CustomerOrderCreate = dir + '/api/customerOrder';
  static String CustomerOrderUpdate = dir + '/api/customerOrder/';
  static String CustomerOrderDelete = dir + '/api/customerOrder/';
}

import 'dart:convert';

import 'package:intl/intl.dart';

class CustomerOrder {
  int _id;
  DateTime _transactionDate;
  // int _companyId;
  // int _userId;
  String _contactPerson;
  String _contactNo;
  String _purpose;
  String _order;
  DateTime _createdAt;
  DateTime _updatedAt;
  String _name;
  String _description;
  bool _selected = false;

  CustomerOrder(
      {int id,
      DateTime transactionDate,
      // int companyId,
      // int userId,
      String contactPerson,
      String contactNo,
      String purpose,
      String order,
      DateTime createdAt,
      DateTime updatedAt,
      String name,
      String description}) {
    this._id = id;
    this._transactionDate = transactionDate;
    // this._companyId = companyId;
    // this._userId = userId;
    this._contactPerson = contactPerson;
    this._contactNo = contactNo;
    this._purpose = purpose;
    this._order = order;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._name = name;
    this._description = description;
  }

  int get id => _id;
  set id(int id) => _id = id;
  DateTime get transactionDate => _transactionDate;
  set transactionDate(DateTime transactionDate) =>
      _transactionDate = transactionDate;
  // int get companyId => _companyId;
  // set companyId(int companyId) => _companyId = companyId;
  // int get userId => _userId;
  // set userId(int userId) => _userId = userId;
  String get contactPerson => _contactPerson;
  set contactPerson(String contactPerson) => _contactPerson = contactPerson;
  String get contactNo => _contactNo;
  set contactNo(String contactNo) => _contactNo = contactNo;
  String get purpose => _purpose;
  set purpose(String purpose) => _purpose = purpose;
  String get order => _order;
  set order(String order) => _order = order;
  DateTime get createdAt => _createdAt;
  set createdAt(DateTime createdAt) => _createdAt = createdAt;
  DateTime get updatedAt => _updatedAt;
  set updatedAt(DateTime updatedAt) => _updatedAt = updatedAt;
  String get name => _name;
  set name(String name) => _name = name;
  String get description => _description;
  set description(String description) => _description = description;
  bool get selected => _selected;
  set selected(bool selected) => _selected = selected;

  CustomerOrder.fromJson(Map<String, dynamic> json) {
    print(DateTime.parse(json['transaction_date']));
    _id = json['id'];
    _transactionDate = DateTime.parse(json['transaction_date']);
    // _companyId = json['company_id'];
    // _userId = json['user_Id'];
    _contactPerson = json['contact_person'];
    _contactNo = json['contact_no'];
    _purpose = json['purpose'];
    _order = json['order'];
    _createdAt = DateTime.parse(json['created_at']);
    _updatedAt = DateTime.parse(json['updated_at']);
    _name = json['company_name'];
    // _description = json['description'];
  }

  Map<String, dynamic> toMap() {
    print(this._transactionDate.toString());
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this._id;
    data['transaction_date'] = this._transactionDate.toString();
    // data['company_id'] = this._companyId;
    // data['user_Id'] = this._userId;
    data['contact_person'] = this._contactPerson;
    data['contact_no'] = this._contactNo;
    data['purpose'] = this._purpose;
    data['order'] = this._order;
    // data['created_at'] = this._createdAt;
    // data['updated_at'] = this._updatedAt;
    data['company_name'] = this._name;
    // data['description'] = this._description;
    return data;
  }

  String toJson() => json.encode(toMap());
}
// class CustomerOrder {
//   final int id;
//   final String transaction_date;
//   final int company_id;
//   final String company_name;
//   final String company_description;
//   final String contact_person;
//   final String contact_no;
//   final String purpose;
//   final int order;
//   final String created_by;
//   final String updated_by;
//   final String created_at;
//   final String updated_at;

//   CustomerOrder({
//     this.id,
//     this.transaction_date,
//     this.company_id,
//     this.company_name,
//     this.company_description,
//     this.contact_person,
//     this.contact_no,
//     this.purpose,
//     this.order,
//     this.created_by,
//     this.updated_by,
//     this.created_at,
//     this.updated_at
//   });

//   static CustomerOrder fromMap(Map<String, dynamic> map) {
//     if (map == null) return null;
//     return CustomerOrder(
//       id: map['id'],
//       transaction_date: map['transaction_date'],
//       company_id: map['company_id'],
//       company_description: map['company_description'],
//       contact_person: map['contact_person'],
//       contact_no: map['contact_no'],
//       purpose: map['purpose'],
//       order: map['order'],
//       created_by: map['created_by'],
//       updated_by: map['updated_by'],
//       created_at: map['created_at'],
//       updated_at: map['updated_at'],
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'transaction_date': transaction_date,
//       'company_id': company_id,
//       'contact_person': contact_person,
//       'contact_no': contact_no,
//       'purpose': purpose,
//       'order': order,
//       'updated_by': updated_by,
//     };
//   }

//   String toJson() => json.encode(toMap());

//   static CustomerOrder fromJson(String source) => fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'CustomerOrder(' +
//       'id: $id, ' +
//       'transaction_date: $transaction_date, ' +
//       'company_name: $company_name, ' +
//       'contact_person: $contact_person) ' +
//       'contact_no: $contact_no) ' +
//       'purpose: $purpose) ' +
//       'order: $order) ' +
//       'updated_by: $updated_by) ' +
//       'created_at: $created_at) ' +
//       'updated_at: $updated_at) ' ;
//   }
// }

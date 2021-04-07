// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcom to your Stainstore`
  String get welcomeMessage {
    return Intl.message(
      'Welcom to your Stainstore',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please, Enter recived code by sms`
  String get smsMessage {
    return Intl.message(
      'Please, Enter recived code by sms',
      name: 'smsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please,Enter vaild {thing}`
  String validation_text(Object thing) {
    return Intl.message(
      'Please,Enter vaild $thing',
      name: 'validation_text',
      desc: '',
      args: [thing],
    );
  }

  /// `The code consist from 6 number sended to`
  String get sended_code {
    return Intl.message(
      'The code consist from 6 number sended to',
      name: 'sended_code',
      desc: '',
      args: [],
    );
  }

  /// `There orders isn't empty,Do you want return its order to store?`
  String get return_orders_to_store {
    return Intl.message(
      'There orders isn\'t empty,Do you want return its order to store?',
      name: 'return_orders_to_store',
      desc: '',
      args: [],
    );
  }

  /// `Change number?`
  String get change_phone {
    return Intl.message(
      'Change number?',
      name: 'change_phone',
      desc: '',
      args: [],
    );
  }

  /// `The code will be send after`
  String get timer_mesg {
    return Intl.message(
      'The code will be send after',
      name: 'timer_mesg',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get log_in {
    return Intl.message(
      'Log in',
      name: 'log_in',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continues {
    return Intl.message(
      'Continue',
      name: 'continues',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Payments`
  String get payments {
    return Intl.message(
      'Payments',
      name: 'payments',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Clients`
  String get clients {
    return Intl.message(
      'Clients',
      name: 'clients',
      desc: '',
      args: [],
    );
  }

  /// `Client`
  String get client {
    return Intl.message(
      'Client',
      name: 'client',
      desc: '',
      args: [],
    );
  }

  /// `Store`
  String get store {
    return Intl.message(
      'Store',
      name: 'store',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search {
    return Intl.message(
      'Search...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Sheets`
  String get sheets {
    return Intl.message(
      'Sheets',
      name: 'sheets',
      desc: '',
      args: [],
    );
  }

  /// `Ouds`
  String get ouds {
    return Intl.message(
      'Ouds',
      name: 'ouds',
      desc: '',
      args: [],
    );
  }

  /// `Paymnet History`
  String get paymentHistory {
    return Intl.message(
      'Paymnet History',
      name: 'paymentHistory',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get number {
    return Intl.message(
      'Number',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get totalPrice {
    return Intl.message(
      'Total Price',
      name: 'totalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Ex: Mohamed`
  String get name_ex {
    return Intl.message(
      'Ex: Mohamed',
      name: 'name_ex',
      desc: '',
      args: [],
    );
  }

  /// `Client Name`
  String get clientName {
    return Intl.message(
      'Client Name',
      name: 'clientName',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Total Balance`
  String get total_balance {
    return Intl.message(
      'Total Balance',
      name: 'total_balance',
      desc: '',
      args: [],
    );
  }

  /// `Show`
  String get show {
    return Intl.message(
      'Show',
      name: 'show',
      desc: '',
      args: [],
    );
  }

  /// `Sliver`
  String get sliver {
    return Intl.message(
      'Sliver',
      name: 'sliver',
      desc: '',
      args: [],
    );
  }

  /// `Golden`
  String get golden {
    return Intl.message(
      'Golden',
      name: 'golden',
      desc: '',
      args: [],
    );
  }

  /// `EL`
  String get el {
    return Intl.message(
      'EL',
      name: 'el',
      desc: '',
      args: [],
    );
  }

  /// `Imports`
  String get imports {
    return Intl.message(
      'Imports',
      name: 'imports',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `My Informations`
  String get my_informations {
    return Intl.message(
      'My Informations',
      name: 'my_informations',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Add {string}`
  String add_thing(Object string) {
    return Intl.message(
      'Add $string',
      name: 'add_thing',
      desc: '',
      args: [string],
    );
  }

  /// `Sale`
  String get sale {
    return Intl.message(
      'Sale',
      name: 'sale',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get user_name {
    return Intl.message(
      'User Name',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `Up date {material} Amount`
  String update_material_amount(Object material) {
    return Intl.message(
      'Up date $material Amount',
      name: 'update_material_amount',
      desc: '',
      args: [material],
    );
  }

  /// `Save Edits`
  String get save_edits {
    return Intl.message(
      'Save Edits',
      name: 'save_edits',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Edit {string}`
  String edit_string(Object string) {
    return Intl.message(
      'Edit $string',
      name: 'edit_string',
      desc: '',
      args: [string],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete {thing}?`
  String delete_mesg(Object thing) {
    return Intl.message(
      'Are you sure you want to delete $thing?',
      name: 'delete_mesg',
      desc: '',
      args: [thing],
    );
  }

  /// `Remains`
  String get remains {
    return Intl.message(
      'Remains',
      name: 'remains',
      desc: '',
      args: [],
    );
  }

  /// `Payed`
  String get payed {
    return Intl.message(
      'Payed',
      name: 'payed',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `There's no {thing} until now`
  String no_thing(Object thing) {
    return Intl.message(
      'There\'s no $thing until now',
      name: 'no_thing',
      desc: '',
      args: [thing],
    );
  }

  /// `Jan`
  String get Jan {
    return Intl.message(
      'Jan',
      name: 'Jan',
      desc: '',
      args: [],
    );
  }

  /// `Feb`
  String get Feb {
    return Intl.message(
      'Feb',
      name: 'Feb',
      desc: '',
      args: [],
    );
  }

  /// `Mar`
  String get Mar {
    return Intl.message(
      'Mar',
      name: 'Mar',
      desc: '',
      args: [],
    );
  }

  /// `Apr`
  String get Apr {
    return Intl.message(
      'Apr',
      name: 'Apr',
      desc: '',
      args: [],
    );
  }

  /// `May`
  String get May {
    return Intl.message(
      'May',
      name: 'May',
      desc: '',
      args: [],
    );
  }

  /// `Jun`
  String get Jun {
    return Intl.message(
      'Jun',
      name: 'Jun',
      desc: '',
      args: [],
    );
  }

  /// `Jul`
  String get Jul {
    return Intl.message(
      'Jul',
      name: 'Jul',
      desc: '',
      args: [],
    );
  }

  /// `Aug`
  String get Aug {
    return Intl.message(
      'Aug',
      name: 'Aug',
      desc: '',
      args: [],
    );
  }

  /// `Sep`
  String get Sep {
    return Intl.message(
      'Sep',
      name: 'Sep',
      desc: '',
      args: [],
    );
  }

  /// `Oct`
  String get Oct {
    return Intl.message(
      'Oct',
      name: 'Oct',
      desc: '',
      args: [],
    );
  }

  /// `Nov`
  String get Nov {
    return Intl.message(
      'Nov',
      name: 'Nov',
      desc: '',
      args: [],
    );
  }

  /// `Dec`
  String get Dec {
    return Intl.message(
      'Dec',
      name: 'Dec',
      desc: '',
      args: [],
    );
  }

  /// `hide`
  String get hide {
    return Intl.message(
      'hide',
      name: 'hide',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
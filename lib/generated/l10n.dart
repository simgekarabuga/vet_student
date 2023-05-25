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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hoşgeldiniz,\n\n devam etmek için lütfen kayıt olun.`
  String get registerText {
    return Intl.message(
      'Hoşgeldiniz,\n\n devam etmek için lütfen kayıt olun.',
      name: 'registerText',
      desc: '',
      args: [],
    );
  }

  /// `Kayıt Ol`
  String get registerAuthButtonText {
    return Intl.message(
      'Kayıt Ol',
      name: 'registerAuthButtonText',
      desc: '',
      args: [],
    );
  }

  /// `İsim Soyisim`
  String get registerNameSurname {
    return Intl.message(
      'İsim Soyisim',
      name: 'registerNameSurname',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get registerEmail {
    return Intl.message(
      'Email',
      name: 'registerEmail',
      desc: '',
      args: [],
    );
  }

  /// `Telefon no`
  String get registerPhoneNum {
    return Intl.message(
      'Telefon no',
      name: 'registerPhoneNum',
      desc: '',
      args: [],
    );
  }

  /// `Şifre`
  String get registerPassword {
    return Intl.message(
      'Şifre',
      name: 'registerPassword',
      desc: '',
      args: [],
    );
  }

  /// `Hesabın var mı?`
  String get registerTransitionText {
    return Intl.message(
      'Hesabın var mı?',
      name: 'registerTransitionText',
      desc: '',
      args: [],
    );
  }

  /// `Giriş Yap!`
  String get registerTransitionText2 {
    return Intl.message(
      'Giriş Yap!',
      name: 'registerTransitionText2',
      desc: '',
      args: [],
    );
  }

  /// `*********************************************************`
  String get a {
    return Intl.message(
      '*********************************************************',
      name: 'a',
      desc: '',
      args: [],
    );
  }

  /// `Hoşgeldiniz,\n\ndevam etmek için lütfen giriş yapın.`
  String get loginText {
    return Intl.message(
      'Hoşgeldiniz,\n\ndevam etmek için lütfen giriş yapın.',
      name: 'loginText',
      desc: '',
      args: [],
    );
  }

  /// `Giriş Yap`
  String get loginAuthButtonText {
    return Intl.message(
      'Giriş Yap',
      name: 'loginAuthButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Hesabın yok mu?`
  String get loginTransitionText {
    return Intl.message(
      'Hesabın yok mu?',
      name: 'loginTransitionText',
      desc: '',
      args: [],
    );
  }

  /// `Kayıt Ol!`
  String get loginTransitionText2 {
    return Intl.message(
      'Kayıt Ol!',
      name: 'loginTransitionText2',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get loginGoogleButton {
    return Intl.message(
      'Google',
      name: 'loginGoogleButton',
      desc: '',
      args: [],
    );
  }

  /// `Apple`
  String get loginAppleButton {
    return Intl.message(
      'Apple',
      name: 'loginAppleButton',
      desc: '',
      args: [],
    );
  }

  /// `Giriş Başarısız. Şifre veya Email Yanlış`
  String get loginFailed {
    return Intl.message(
      'Giriş Başarısız. Şifre veya Email Yanlış',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `*******************************************************************`
  String get b {
    return Intl.message(
      '*******************************************************************',
      name: 'b',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get termsOfUse1 {
    return Intl.message(
      '',
      name: 'termsOfUse1',
      desc: '',
      args: [],
    );
  }

  /// `Kullanım Koşuları`
  String get termsOfUse2 {
    return Intl.message(
      'Kullanım Koşuları',
      name: 'termsOfUse2',
      desc: '',
      args: [],
    );
  }

  /// `'nı okudum kabul ediyorum`
  String get termsOfUse3 {
    return Intl.message(
      '\'nı okudum kabul ediyorum',
      name: 'termsOfUse3',
      desc: '',
      args: [],
    );
  }

  /// `Lütfen Sözleşmeyi Onaylayınız.`
  String get termsOfUsedError {
    return Intl.message(
      'Lütfen Sözleşmeyi Onaylayınız.',
      name: 'termsOfUsedError',
      desc: '',
      args: [],
    );
  }

  /// `**********************************************************`
  String get c {
    return Intl.message(
      '**********************************************************',
      name: 'c',
      desc: '',
      args: [],
    );
  }

  /// `Adreslerim`
  String get drawerAddresses {
    return Intl.message(
      'Adreslerim',
      name: 'drawerAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Profilini Güncelle`
  String get drawerUpdate {
    return Intl.message(
      'Profilini Güncelle',
      name: 'drawerUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Ayarlar`
  String get drawerSettings {
    return Intl.message(
      'Ayarlar',
      name: 'drawerSettings',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get drawerMenu {
    return Intl.message(
      'Menu',
      name: 'drawerMenu',
      desc: '',
      args: [],
    );
  }

  /// `********************************************************************`
  String get d {
    return Intl.message(
      '********************************************************************',
      name: 'd',
      desc: '',
      args: [],
    );
  }

  /// `Alış Veriş`
  String get mainSectionText {
    return Intl.message(
      'Alış Veriş',
      name: 'mainSectionText',
      desc: '',
      args: [],
    );
  }

  /// `Mesajlaşma`
  String get mainSectionText2 {
    return Intl.message(
      'Mesajlaşma',
      name: 'mainSectionText2',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '3' key

  /// `Mesajınız`
  String get contactMessageHint {
    return Intl.message(
      'Mesajınız',
      name: 'contactMessageHint',
      desc: '',
      args: [],
    );
  }

  /// `Gönder`
  String get send {
    return Intl.message(
      'Gönder',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Gönder`
  String get sendDialogTitle {
    return Intl.message(
      'Gönder',
      name: 'sendDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mesajı göndermek istiyor musunuz?`
  String get sendDialogContent {
    return Intl.message(
      'Mesajı göndermek istiyor musunuz?',
      name: 'sendDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Lütfen mesajınızı yazın`
  String get errorEmptyContactMessage {
    return Intl.message(
      'Lütfen mesajınızı yazın',
      name: 'errorEmptyContactMessage',
      desc: '',
      args: [],
    );
  }

  /// `Mesajınız alındı. Teknik ekibimiz en kısa zamanda sizinle iletişime geçecektir.`
  String get contactMessageSuccessfullySent {
    return Intl.message(
      'Mesajınız alındı. Teknik ekibimiz en kısa zamanda sizinle iletişime geçecektir.',
      name: 'contactMessageSuccessfullySent',
      desc: '',
      args: [],
    );
  }

  /// `*************************************************************************`
  String get f {
    return Intl.message(
      '*************************************************************************',
      name: 'f',
      desc: '',
      args: [],
    );
  }

  /// `Mesaj yazın...`
  String get typeMessage {
    return Intl.message(
      'Mesaj yazın...',
      name: 'typeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Kişiler`
  String get contactsPageTitle {
    return Intl.message(
      'Kişiler',
      name: 'contactsPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message(
      'Unknown',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `Mesajınız yok`
  String get contactsPageNoMessageTextContent {
    return Intl.message(
      'Mesajınız yok',
      name: 'contactsPageNoMessageTextContent',
      desc: '',
      args: [],
    );
  }

  /// `Resim`
  String get contactsPageImageTypeText {
    return Intl.message(
      'Resim',
      name: 'contactsPageImageTypeText',
      desc: '',
      args: [],
    );
  }

  /// `İptal`
  String get cancel {
    return Intl.message(
      'İptal',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// ` -----------------------------------------------------------------------`
  String get sectionPhotoPicker {
    return Intl.message(
      ' -----------------------------------------------------------------------',
      name: 'sectionPhotoPicker',
      desc: '',
      args: [],
    );
  }

  /// `Fotoğraf Çek`
  String get takePhoto {
    return Intl.message(
      'Fotoğraf Çek',
      name: 'takePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Galeriden Seç`
  String get chooseFromGallery {
    return Intl.message(
      'Galeriden Seç',
      name: 'chooseFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Fotoğrafı Düzenle`
  String get editPhoto {
    return Intl.message(
      'Fotoğrafı Düzenle',
      name: 'editPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Bir hata oluştu, lütfen daha sonra tekrar deneyin`
  String get errorTryAgain {
    return Intl.message(
      'Bir hata oluştu, lütfen daha sonra tekrar deneyin',
      name: 'errorTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `******************************************************************************`
  String get e {
    return Intl.message(
      '******************************************************************************',
      name: 'e',
      desc: '',
      args: [],
    );
  }

  /// `Ana Sayfa`
  String get tab1 {
    return Intl.message(
      'Ana Sayfa',
      name: 'tab1',
      desc: '',
      args: [],
    );
  }

  /// `Sepet`
  String get tab2 {
    return Intl.message(
      'Sepet',
      name: 'tab2',
      desc: '',
      args: [],
    );
  }

  /// `Profil`
  String get tab3 {
    return Intl.message(
      'Profil',
      name: 'tab3',
      desc: '',
      args: [],
    );
  }

  /// `Galeri'den Seç`
  String get galery {
    return Intl.message(
      'Galeri\'den Seç',
      name: 'galery',
      desc: '',
      args: [],
    );
  }

  /// `Kamera'yı Aç`
  String get camera {
    return Intl.message(
      'Kamera\'yı Aç',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Tekrar Deneyiniz`
  String get failedImage {
    return Intl.message(
      'Tekrar Deneyiniz',
      name: 'failedImage',
      desc: '',
      args: [],
    );
  }

  /// `Ürünleri Keşfet!`
  String get homeProductTitleText {
    return Intl.message(
      'Ürünleri Keşfet!',
      name: 'homeProductTitleText',
      desc: '',
      args: [],
    );
  }

  /// `Hesap Tercihleri`
  String get profileSettingsAccount {
    return Intl.message(
      'Hesap Tercihleri',
      name: 'profileSettingsAccount',
      desc: '',
      args: [],
    );
  }

  /// `Çıkış Yap`
  String get profileSettingsSingOut {
    return Intl.message(
      'Çıkış Yap',
      name: 'profileSettingsSingOut',
      desc: '',
      args: [],
    );
  }

  /// `Profil Ayarları`
  String get profileDetail {
    return Intl.message(
      'Profil Ayarları',
      name: 'profileDetail',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

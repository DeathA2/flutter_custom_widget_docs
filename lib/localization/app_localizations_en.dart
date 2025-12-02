// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get disable_cSpell => '/* cSpell:disable */';

  @override
  String get common_appTitle => 'Clinger';

  @override
  String common_appVersion(Object value) {
    return 'Version $value';
  }

  @override
  String get common_loading => 'Loading';

  @override
  String get common_next => 'Next';
}

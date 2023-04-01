import 'package:flutter/material.dart';
import 'package:quote_generator/presentation/translations/app_localizations.dart';

extension QuoteGeneratorLocalizations on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

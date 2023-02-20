import 'app_localizations.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get app_title => 'Quote Generator';

  @override
  String get nav_bar_home => 'Pagina Inicial';

  @override
  String get nav_bar_create_quote => 'Criar Quote';

  @override
  String get nav_bar_search => 'Pesquisar';

  @override
  String get tab_bar_create_by_you => 'Criado por você';

  @override
  String get tab_bar_favorite => 'Favoritos';

  @override
  String get tab_bar_latest => 'Mais recente';
}

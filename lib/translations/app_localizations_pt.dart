import 'app_localizations.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get app_title => 'Quote Generator';

  @override
  String get explore => 'Explorar';

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

  @override
  String get empty_card_created_by_you => 'Você ainda não criou nenhuma citação';

  @override
  String get empty_card_favorite_quote => 'Você ainda não adicionou nenhuma citação aos seus favoritos';

  @override
  String get create_your_quote => 'Crie seu Quote';

  @override
  String get done => 'Feito';

  @override
  String get background_color => 'Selecione a cor de fundo';

  @override
  String get select_color_shade => 'Selecione a tonalidade da cor';
}

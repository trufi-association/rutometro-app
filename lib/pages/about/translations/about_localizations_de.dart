import 'about_localizations.dart';

/// The translations for German (`de`).
class AboutLocalizationDe extends AboutLocalization {
  AboutLocalizationDe([String locale = 'de']) : super(locale);

  @override
  String get aboutCollapseMainTitle => 'Mapa Data: gemeinsam Routen erstellen';

  @override
  String get aboutCollapseContent =>
      'Trufi Association is an international NGO that promotes easier access to public transport. Our apps help everyone find the best way to get from point A to point B within their cities.\n\nIn many cities there are no official maps, routes, apps or timetables. So we compile the available information, and sometimes even map routes from scratch working with local people who know the city.  An easy-to-use transportation system contributes to greater sustainability, cleaner air and a better quality of life.';

  @override
  String get aboutCollapseContentFoot =>
      'We need mappers, developers, planners, testers, and many other hands.';

  @override
  String get aboutCollapseTitle => 'More About Trufi Association';

  @override
  String get aboutContent =>
      'Rutómetro ist Teil von **Mapa Data**, einer gemeinsamen Initiative von **Trufi Association** und **GIZ Mexiko** im Rahmen des Projekts **TranSIT**, die darauf abzielt, das öffentliche Verkehrswesen in verschiedenen Städten Mexikos durch **offene Daten und freie Technologie** zu verbessern.\n\nIn vielen Städten gab es keine vollständigen oder aktuellen Informationen über den öffentlichen Verkehr. Deshalb arbeiten wir mit **lokalen Gemeinschaften, Universitäten und Regierungen** zusammen, um Routen, Haltestellen und Strecken zu kartieren, diese Informationen in offene Daten (GTFS) umzuwandeln und sie für alle über diese Anwendung zugänglich zu machen.\n\nRutómetro ermöglicht es den Menschen, **ihre Reisen zu planen**, verfügbare **Routen kennenzulernen** und Informationen beizutragen, um die Daten zu verbessern. Jede hier angezeigte Route wurde durch die gemeinsame Arbeit von Kartografen, Freiwilligen und lokalen Partnern erstellt.\n\nUnser Ziel ist es, sich in der Stadt einfacher, transparenter und nachhaltiger zu bewegen.\n\nMit deiner Hilfe schaffen wir weiterhin gemeinsam neue Wege.';

  @override
  String get projectPartners => 'Projektpartner:';

  @override
  String get aboutLicenses => 'Lizenzen';

  @override
  String get aboutOpenSource =>
      'Diese App ist als Open Source auf GitHub veröffentlicht. Wir freuen uns, wenn Du zum Code beiträgst oder eine App für Deine eigene Stadt entwickelst.';

  @override
  String get menuAbout => 'Über Uns';

  @override
  String get trufiWebsite => 'Trufi Association Website';

  @override
  String version(Object version) {
    return 'Version $version';
  }

  @override
  String get volunteerTrufi => 'Volunteer For Trufi';
}

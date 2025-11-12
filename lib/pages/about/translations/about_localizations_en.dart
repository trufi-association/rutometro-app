import 'about_localizations.dart';

/// The translations for English (`en`).
class AboutLocalizationEn extends AboutLocalization {
  AboutLocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get aboutCollapseMainTitle => 'Mapa Data: creating routes together';

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
      'Rutómetro is part of **Mapa Data**, a collaborative initiative driven by **Trufi Association** and **GIZ Mexico** under the **TranSIT** project, which aims to improve public transport management in various Mexican cities through **open data and open technology**.\n\nIn many places, there was no complete or up-to-date information about public transportation. That’s why we work together with **local communities, universities, and governments** to map routes, stops, and paths, transforming this information into open data (GTFS) and making it accessible to everyone through this app.\n\nRutómetro allows people to **plan their trips**, discover **available routes**, and contribute information to improve the data. Every route you see here was built through the collective effort of mappers, volunteers, and local partners.\n\nOur goal is to make moving around the city easier, more transparent, and more sustainable.\n\nWith your help, we continue creating routes together.';

  @override
  String get projectPartners => 'Project Partners:';

  @override
  String get aboutLicenses => 'Licenses';

  @override
  String get aboutOpenSource =>
      'This app is released as open source on GitHub. Feel free to contribute to the code, or bring an app to your own city.';

  @override
  String get menuAbout => 'About us';

  @override
  String get trufiWebsite => 'Trufi Association Website';

  @override
  String version(Object version) {
    return 'Version $version';
  }

  @override
  String get volunteerTrufi => 'Volunteer For Trufi';
}

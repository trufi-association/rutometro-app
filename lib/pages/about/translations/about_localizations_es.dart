import 'about_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AboutLocalizationEs extends AboutLocalization {
  AboutLocalizationEs([String locale = 'es']) : super(locale);

  @override
  String get aboutCollapseMainTitle => 'Mapa Data: creando rutas juntos';

  @override
  String get aboutCollapseContent => 'Trufi Association es una ONG internacional que promueve un acceso más fácil al transporte público. Nuestras aplicaciones ayudan a que todos puedan encontrar la mejor manera de ir de un punto A a un punto B dentro de sus ciudades.\n\nEn muchas ciudades no existen mapas, aplicaciones ni horarios oficiales. Nosotros nos encargamos de completarlos, y a veces incluso trazamos rutas desde cero. Un sistema de transporte bien diseñado contribuye a una mayor sostenibilidad, un aire más limpio y una mejor calidad de vida.';

  @override
  String get aboutCollapseContentFoot => 'Forma parte de nuestro equipo de voluntarios. Necesitamos mapeadores, desarrolladores, planificadores, testers y otras manos más.';

  @override
  String get aboutCollapseTitle => 'Más sobre Trufi Association';

  @override
  String get aboutContent => 'Rutómetro forma parte de **Mapa Data**, una iniciativa colaborativa impulsada por **Trufi Association** y **GIZ México** dentro del proyecto **TranSIT**, que busca mejorar la gestión del transporte público en distintas ciudades de México a través de **datos abiertos y tecnología libre**.\n\nEn muchos lugares, no existía información completa ni actualizada del transporte público. Por eso, trabajamos junto a **comunidades locales, universidades y gobiernos** para mapear rutas, paradas y recorridos, transformando esa información en datos abiertos (GTFS) y haciéndola accesible para todos mediante esta aplicación.\n\nRutómetro permite a las personas **planificar sus viajes**, conocer las **rutas disponibles** y contribuir con información para mejorar los datos. Cada recorrido que ves aquí fue construido con el esfuerzo conjunto de mapeadores, voluntarios y aliados locales.\n\nNuestro objetivo es que moverse por la ciudad sea más fácil, más transparente y más sostenible.\n\nCon tu ayuda, seguimos creando rutas juntos.';

  @override
  String get projectPartners => 'Aliados del proyecto:';

  @override
  String get aboutLicenses => 'Licencias';

  @override
  String get aboutOpenSource => 'Esta aplicación está publicada como código abierto en GitHub. Siéntase libre de contribuir  o utilizarlo para su propia ciudad.';

  @override
  String get menuAbout => 'Sobre nosotros';

  @override
  String get trufiWebsite => 'Sitio web de Trufi Association';

  @override
  String version(Object version) {
    return 'Versión $version';
  }

  @override
  String get volunteerTrufi => 'Voluntariados para Trufi';
}

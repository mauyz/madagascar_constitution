import 'package:madagascar_constitution/core/constitution_language.dart';

class AppConstants {
  const AppConstants._();

  static String preambleTranslation(ConstitutionLanguage language) =>
      switch (language) {
        ConstitutionLanguage.mg => "Savaranonando",
        ConstitutionLanguage.fr => "Préambule",
        ConstitutionLanguage.en => "Preamble",
      };
}

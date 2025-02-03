import 'package:flutter/foundation.dart';

class AppConstants {
  const AppConstants._();

  static const baroovEmail = "barouvheritiana@gmail.com";
  static const mauyzEmail = "tsiorymauyz@gmail.com";

  static const appTitle = "Constitution de Madagascar";
  static const appVersion = "v1.0.12";

  static const aboutApp = "Constitution de la 4e République de Madagascar"
      " APRES LE REFERENDUM DU 17 NOVEMBRE 2010,\narrêtés"
      " par la Haute Cour Constitutionnelle le 6 décembre 2010.\n"
      "Source : https://tenymalagasy.org/bins/lalampanorenana";
  static const appClause =
      "Clause de non-responsabilité :\nCette application n'est pas affiliée à "
      "une entité gouvernementale et ne représente pas une autorité officielle.\n"
      "Elle vise à offrir un accès simplifié à la Constitution de Madagascar "
      "pour des fins informatives et éducatives uniquement.";

  static final copyright =
      "© ${DateTime.now().year} Moïse T.${kIsWeb ? '' : ", Baroov"}";

  static const androidId = "com.eightgroup.mauyz.constitution";
  static const iosId = "";
  static const windowsId = "";
  static const macOsId = "";

  static const playStoreLink =
      "https://play.google.com/store/apps/details?id=$androidId";
}

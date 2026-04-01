import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @startPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Fall in Love with Coffee in Blissful Delight!'**
  String get startPageTitle;

  /// No description provided for @startPageDescription.
  ///
  /// In en, this message translates to:
  /// **'Welcome to our cozy coffee corner, where every cup is a delightful for you'**
  String get startPageDescription;

  /// No description provided for @startPageButton.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get startPageButton;

  /// No description provided for @notificationsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsPageTitle;

  /// No description provided for @notificationTitle1.
  ///
  /// In en, this message translates to:
  /// **'New coffee from Ethiopia'**
  String get notificationTitle1;

  /// No description provided for @notificationDescription1.
  ///
  /// In en, this message translates to:
  /// **'Try a new coffee with notes of blueberry and chocolate'**
  String get notificationDescription1;

  /// No description provided for @notificationTitle2.
  ///
  /// In en, this message translates to:
  /// **'20% discount on all coffee'**
  String get notificationTitle2;

  /// No description provided for @notificationDescription2.
  ///
  /// In en, this message translates to:
  /// **'Only on weekends - 20% discount on all drinks'**
  String get notificationDescription2;

  /// No description provided for @notificationTitle3.
  ///
  /// In en, this message translates to:
  /// **'Coffee making masterclass'**
  String get notificationTitle3;

  /// No description provided for @notificationDescription3.
  ///
  /// In en, this message translates to:
  /// **'Learn how to make the perfect cappuccino'**
  String get notificationDescription3;

  /// No description provided for @notificationTitle4.
  ///
  /// In en, this message translates to:
  /// **'New coffee machine'**
  String get notificationTitle4;

  /// No description provided for @notificationDescription4.
  ///
  /// In en, this message translates to:
  /// **'Now we brew coffee on professional La Marzocco'**
  String get notificationDescription4;

  /// No description provided for @favoritePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Favorite coffee'**
  String get favoritePageTitle;

  /// No description provided for @favoriteEmpty.
  ///
  /// In en, this message translates to:
  /// **'No favorite coffee :('**
  String get favoriteEmpty;

  /// No description provided for @productCardName1.
  ///
  /// In en, this message translates to:
  /// **'Flat White'**
  String get productCardName1;

  /// No description provided for @productCardType1.
  ///
  /// In en, this message translates to:
  /// **'Espresso'**
  String get productCardType1;

  /// No description provided for @productCardDescription1.
  ///
  /// In en, this message translates to:
  /// **'Rich espresso with a delicate milk foam. The perfect balance of strength and softness for a refreshing start to the day.'**
  String get productCardDescription1;

  /// No description provided for @productCardName2.
  ///
  /// In en, this message translates to:
  /// **'Mocha Coffee'**
  String get productCardName2;

  /// No description provided for @productCardType2.
  ///
  /// In en, this message translates to:
  /// **'Velvety foam'**
  String get productCardType2;

  /// No description provided for @productCardDescription2.
  ///
  /// In en, this message translates to:
  /// **'Freshly roasted Arabica with notes of chocolate and caramel. A dense crema and a silky taste without bitterness.'**
  String get productCardDescription2;

  /// No description provided for @productCardName3.
  ///
  /// In en, this message translates to:
  /// **'Americano'**
  String get productCardName3;

  /// No description provided for @productCardType3.
  ///
  /// In en, this message translates to:
  /// **'Whipped cream'**
  String get productCardType3;

  /// No description provided for @productCardDescription3.
  ///
  /// In en, this message translates to:
  /// **'A warming drink with a velvety texture and a slight sweetness. A small pleasure for great achievements.'**
  String get productCardDescription3;

  /// No description provided for @productCardName4.
  ///
  /// In en, this message translates to:
  /// **'Latte'**
  String get productCardName4;

  /// No description provided for @productCardType4.
  ///
  /// In en, this message translates to:
  /// **'Espresso'**
  String get productCardType4;

  /// No description provided for @productCardDescription4.
  ///
  /// In en, this message translates to:
  /// **'100% Arabica from the highlands of Colombia. A smooth taste with citrus notes and a long chocolate aftertaste. Custom roasted.'**
  String get productCardDescription4;

  /// No description provided for @productCardName5.
  ///
  /// In en, this message translates to:
  /// **'Chocolate Cheesecake'**
  String get productCardName5;

  /// No description provided for @productCardType5.
  ///
  /// In en, this message translates to:
  /// **'Creamy Indulgence'**
  String get productCardType5;

  /// No description provided for @productCardDescription5.
  ///
  /// In en, this message translates to:
  /// **'A creamy cheesecake on a shortbread base with Belgian chocolate. Melts in your mouth, leaving a rich dark cocoa aftertaste.'**
  String get productCardDescription5;

  /// No description provided for @productCardName6.
  ///
  /// In en, this message translates to:
  /// **'Chocolate Muffin'**
  String get productCardName6;

  /// No description provided for @productCardType6.
  ///
  /// In en, this message translates to:
  /// **'Belgian Chocolate'**
  String get productCardType6;

  /// No description provided for @productCardDescription6.
  ///
  /// In en, this message translates to:
  /// **'A moist chocolate muffin with dark chocolate chips. Topped with a fluffy whipped cream. The perfect companion for your morning coffee.'**
  String get productCardDescription6;

  /// No description provided for @productCardName7.
  ///
  /// In en, this message translates to:
  /// **' Chocolate Croissant'**
  String get productCardName7;

  /// No description provided for @productCardType7.
  ///
  /// In en, this message translates to:
  /// **'Morning Joy'**
  String get productCardType7;

  /// No description provided for @productCardDescription7.
  ///
  /// In en, this message translates to:
  /// **'A flaky, buttery croissant filled with melted dark chocolate. When warmed, the chocolate turns into a rich fondant. Perfect with a cappuccino.'**
  String get productCardDescription7;

  /// No description provided for @productCardName8.
  ///
  /// In en, this message translates to:
  /// **'Mojito'**
  String get productCardName8;

  /// No description provided for @productCardName9.
  ///
  /// In en, this message translates to:
  /// **' Strawberry lemonade'**
  String get productCardName9;

  /// No description provided for @productCardName10.
  ///
  /// In en, this message translates to:
  /// **' Mango lemonade'**
  String get productCardName10;

  /// No description provided for @productCardName11.
  ///
  /// In en, this message translates to:
  /// **' Chicken Sandwich'**
  String get productCardName11;

  /// No description provided for @categoryName1.
  ///
  /// In en, this message translates to:
  /// **'Coffee'**
  String get categoryName1;

  /// No description provided for @categoryName2.
  ///
  /// In en, this message translates to:
  /// **'Dessert'**
  String get categoryName2;

  /// No description provided for @categoryName3.
  ///
  /// In en, this message translates to:
  /// **'Limonad'**
  String get categoryName3;

  /// No description provided for @categoryName4.
  ///
  /// In en, this message translates to:
  /// **'Sandwich'**
  String get categoryName4;

  /// No description provided for @promoBannerTag.
  ///
  /// In en, this message translates to:
  /// **'Promo'**
  String get promoBannerTag;

  /// No description provided for @promoBannerText.
  ///
  /// In en, this message translates to:
  /// **'Buy one and get one for free'**
  String get promoBannerText;

  /// No description provided for @productDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Details '**
  String get productDetailTitle;

  /// No description provided for @productDetailButton.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get productDetailButton;

  /// No description provided for @productDetailTextDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get productDetailTextDescription;

  /// No description provided for @productDetailTextSize.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get productDetailTextSize;

  /// No description provided for @searchBarText.
  ///
  /// In en, this message translates to:
  /// **'Find coffee'**
  String get searchBarText;

  /// No description provided for @dropdownText.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get dropdownText;

  /// No description provided for @dropdownCity1.
  ///
  /// In en, this message translates to:
  /// **'Moscow'**
  String get dropdownCity1;

  /// No description provided for @dropdownCity2.
  ///
  /// In en, this message translates to:
  /// **'Saint Petersburg'**
  String get dropdownCity2;

  /// No description provided for @dropdownCity3.
  ///
  /// In en, this message translates to:
  /// **'Kazan'**
  String get dropdownCity3;

  /// No description provided for @dropdownCity4.
  ///
  /// In en, this message translates to:
  /// **'Novosibirsk'**
  String get dropdownCity4;

  /// No description provided for @dropdownCity5.
  ///
  /// In en, this message translates to:
  /// **'Yekaterinburg'**
  String get dropdownCity5;

  /// No description provided for @dropdownCity6.
  ///
  /// In en, this message translates to:
  /// **'Omsk'**
  String get dropdownCity6;

  /// No description provided for @cityList.
  ///
  /// In en, this message translates to:
  /// **'Moscow|Saint Petersburg|Kazan|Novosibirsk|Yekaterinburg|Omsk'**
  String get cityList;

  /// No description provided for @orderPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get orderPageTitle;

  /// No description provided for @orderEmptyText.
  ///
  /// In en, this message translates to:
  /// **'The cart is empty'**
  String get orderEmptyText;

  /// No description provided for @orderEmptySubtext.
  ///
  /// In en, this message translates to:
  /// **'Add your favorite product from the menu'**
  String get orderEmptySubtext;

  /// No description provided for @defaultAdress.
  ///
  /// In en, this message translates to:
  /// **'Moscow, 15 Tverskaya Street, Apt. 42'**
  String get defaultAdress;

  /// No description provided for @editAdress.
  ///
  /// In en, this message translates to:
  /// **'Edit the address'**
  String get editAdress;

  /// No description provided for @alertText.
  ///
  /// In en, this message translates to:
  /// **'Provide your address'**
  String get alertText;

  /// No description provided for @alertHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter the delivery address'**
  String get alertHintText;

  /// No description provided for @pickup.
  ///
  /// In en, this message translates to:
  /// **'Pickup'**
  String get pickup;

  /// No description provided for @delevery.
  ///
  /// In en, this message translates to:
  /// **'Delevery'**
  String get delevery;

  /// No description provided for @paymentDetails.
  ///
  /// In en, this message translates to:
  /// **'Payment details'**
  String get paymentDetails;

  /// No description provided for @adress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get adress;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @buttonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get buttonCancel;

  /// No description provided for @buttonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get buttonSave;

  /// No description provided for @buttonPuy.
  ///
  /// In en, this message translates to:
  /// **'Puy'**
  String get buttonPuy;

  /// No description provided for @removedFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'Removed from favorites'**
  String get removedFromFavorites;

  /// No description provided for @addedToFavorites.
  ///
  /// In en, this message translates to:
  /// **'Added to favorites'**
  String get addedToFavorites;

  /// No description provided for @removedFromCart.
  ///
  /// In en, this message translates to:
  /// **'The product is already in the cart'**
  String get removedFromCart;

  /// No description provided for @addedToCart.
  ///
  /// In en, this message translates to:
  /// **'Added to cart'**
  String get addedToCart;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

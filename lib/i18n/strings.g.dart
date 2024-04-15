/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 82 (41 per locale)
///
/// Built on 2024-04-15 at 15:18 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ar(languageCode: 'ar', build: _StringsAr.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get locale => 'English';
	String get appName => 'Forwardious';
	late final _StringsHomeEn home = _StringsHomeEn._(_root);
	late final _StringsInstanceDetailsEn instanceDetails = _StringsInstanceDetailsEn._(_root);
	late final _StringsSettingsScreenEn settingsScreen = _StringsSettingsScreenEn._(_root);
	late final _StringsErrorsEn errors = _StringsErrorsEn._(_root);
}

// Path: home
class _StringsHomeEn {
	_StringsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get settings => 'Settings';
	String get loading => 'loading';
}

// Path: instanceDetails
class _StringsInstanceDetailsEn {
	_StringsInstanceDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get location => 'Location';
	String get type => 'Type';
	String get health => 'Health';
	String get signUp => 'SignUp';
	late final _StringsInstanceDetailsTooltipEn tooltip = _StringsInstanceDetailsTooltipEn._(_root);
}

// Path: settingsScreen
class _StringsSettingsScreenEn {
	_StringsSettingsScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get theme => 'Theme';
	String get darkMode => 'Dark Mode';
	String get setDarkModeTheme => 'Set dark mode theme';
	String get language => 'Language';
	String get setTheAppLanguage => 'Set language';
	String get back => 'Back';
	String get general => 'General';
	String get tabRefreshBehaviour => 'Tab refresh Mode';
	String get tabBehaviourWhenOpeningaYoutubeUrl => 'Tab mode when opening a yt url';
	String get updateTab => 'Update';
	String get removeTab => 'Delete';
	late final _StringsSettingsScreenInvidiousPreferencesEn invidiousPreferences = _StringsSettingsScreenInvidiousPreferencesEn._(_root);
	String get Main => 'Main';
	String get other => 'Other';
}

// Path: errors
class _StringsErrorsEn {
	_StringsErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get networkConnectionError => 'Network connection error';
}

// Path: instanceDetails.tooltip
class _StringsInstanceDetailsTooltipEn {
	_StringsInstanceDetailsTooltipEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get locationTip => 'Location of instance';
	String get typeTip => 'Protocol type';
	String get healthTip => 'Uptime/downtime';
	String get signUpTip => 'The ability to signup in this instance';
}

// Path: settingsScreen.invidiousPreferences
class _StringsSettingsScreenInvidiousPreferencesEn {
	_StringsSettingsScreenInvidiousPreferencesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get invidiousPreferences => 'Invidious preferences';
	String get audioMode => 'Audio mode';
	String get audioModeSubtitle => 'Play videos as audio only';
	String get videoQuality => 'Video quality';
	String get videoQualitySubtitle => 'The default video quality';
	String get interfaceLocale => 'Interface language';
	late final _StringsSettingsScreenInvidiousPreferencesDefaultCaptionsEn defaultCaptions = _StringsSettingsScreenInvidiousPreferencesDefaultCaptionsEn._(_root);
	String get autoPlay => 'Autoplay';
	String get autoPlaySubtitle => 'Play videos automatically';
	String get alwaysLoop => 'Always loop';
	String get alwaysLoopSubtitle => 'Replay video when it ends';
}

// Path: settingsScreen.invidiousPreferences.defaultCaptions
class _StringsSettingsScreenInvidiousPreferencesDefaultCaptionsEn {
	_StringsSettingsScreenInvidiousPreferencesDefaultCaptionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get defaultCaptions => 'Default captions';
	String get none => 'none';
	String get first => 'The first';
	String get second => 'The second';
	String get third => 'The third';
}

// Path: <root>
class _StringsAr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsAr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsAr _root = this; // ignore: unused_field

	// Translations
	@override String get locale => 'العربية';
	@override String get appName => 'Forwardious';
	@override late final _StringsHomeAr home = _StringsHomeAr._(_root);
	@override late final _StringsInstanceDetailsAr instanceDetails = _StringsInstanceDetailsAr._(_root);
	@override late final _StringsSettingsScreenAr settingsScreen = _StringsSettingsScreenAr._(_root);
	@override late final _StringsErrorsAr errors = _StringsErrorsAr._(_root);
}

// Path: home
class _StringsHomeAr implements _StringsHomeEn {
	_StringsHomeAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get settings => 'الإعدادات';
	@override String get loading => 'جاري التحميل';
}

// Path: instanceDetails
class _StringsInstanceDetailsAr implements _StringsInstanceDetailsEn {
	_StringsInstanceDetailsAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get location => 'الموقع';
	@override String get type => 'النوع';
	@override String get health => 'الصحة';
	@override String get signUp => 'التسجيل';
	@override late final _StringsInstanceDetailsTooltipAr tooltip = _StringsInstanceDetailsTooltipAr._(_root);
}

// Path: settingsScreen
class _StringsSettingsScreenAr implements _StringsSettingsScreenEn {
	_StringsSettingsScreenAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get theme => 'السمة';
	@override String get darkMode => 'الوضع المظلم';
	@override String get setDarkModeTheme => 'تعيين سمة الوضع المظلم';
	@override String get language => 'اللغة';
	@override String get setTheAppLanguage => 'تعيين لغة التطبيق';
	@override String get back => 'عودة';
	@override String get general => 'عام';
	@override String get tabRefreshBehaviour => 'وضع علامة التبويب';
	@override String get tabBehaviourWhenOpeningaYoutubeUrl => 'وضع علامة التبويب عند فتح عنوان يوتيوب';
	@override String get updateTab => 'إنعاش';
	@override String get removeTab => 'حذف';
	@override late final _StringsSettingsScreenInvidiousPreferencesAr invidiousPreferences = _StringsSettingsScreenInvidiousPreferencesAr._(_root);
	@override String get Main => 'الرئيسية';
	@override String get other => 'أُخرى';
}

// Path: errors
class _StringsErrorsAr implements _StringsErrorsEn {
	_StringsErrorsAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get networkConnectionError => 'خطأ في الإتصال بالشبكة';
}

// Path: instanceDetails.tooltip
class _StringsInstanceDetailsTooltipAr implements _StringsInstanceDetailsTooltipEn {
	_StringsInstanceDetailsTooltipAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get locationTip => 'موقع المُستنسخ';
	@override String get typeTip => 'نوع البروتوكول';
	@override String get healthTip => 'وقت التشغيل/التوقف';
	@override String get signUpTip => 'القدرة على التسجيل في هذا المُستنسخ';
}

// Path: settingsScreen.invidiousPreferences
class _StringsSettingsScreenInvidiousPreferencesAr implements _StringsSettingsScreenInvidiousPreferencesEn {
	_StringsSettingsScreenInvidiousPreferencesAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get invidiousPreferences => 'تفضيلات إنفيديوس';
	@override String get audioMode => 'وضع الصوت';
	@override String get audioModeSubtitle => 'تشغيل الفيديوهات كصوت فقط';
	@override String get videoQuality => 'جودة الفيديو';
	@override String get videoQualitySubtitle => 'جودة الفيديو الإفتراضية';
	@override String get interfaceLocale => 'لغة واجهة المستنسخ';
	@override late final _StringsSettingsScreenInvidiousPreferencesDefaultCaptionsAr defaultCaptions = _StringsSettingsScreenInvidiousPreferencesDefaultCaptionsAr._(_root);
	@override String get autoPlay => 'التشغيل التلقائي';
	@override String get autoPlaySubtitle => 'تشغيل الفيديوهات تلقائياً';
	@override String get alwaysLoop => 'تكرر دائماً';
	@override String get alwaysLoopSubtitle => 'عند إنتهاء الفيديو كرره';
}

// Path: settingsScreen.invidiousPreferences.defaultCaptions
class _StringsSettingsScreenInvidiousPreferencesDefaultCaptionsAr implements _StringsSettingsScreenInvidiousPreferencesDefaultCaptionsEn {
	_StringsSettingsScreenInvidiousPreferencesDefaultCaptionsAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get defaultCaptions => 'التسميات التوضيحية الإفتراضية';
	@override String get none => 'لاشي';
	@override String get first => 'الأولى';
	@override String get second => 'الثانية';
	@override String get third => 'الثالثة';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'locale': return 'English';
			case 'appName': return 'Forwardious';
			case 'home.settings': return 'Settings';
			case 'home.loading': return 'loading';
			case 'instanceDetails.location': return 'Location';
			case 'instanceDetails.type': return 'Type';
			case 'instanceDetails.health': return 'Health';
			case 'instanceDetails.signUp': return 'SignUp';
			case 'instanceDetails.tooltip.locationTip': return 'Location of instance';
			case 'instanceDetails.tooltip.typeTip': return 'Protocol type';
			case 'instanceDetails.tooltip.healthTip': return 'Uptime/downtime';
			case 'instanceDetails.tooltip.signUpTip': return 'The ability to signup in this instance';
			case 'settingsScreen.theme': return 'Theme';
			case 'settingsScreen.darkMode': return 'Dark Mode';
			case 'settingsScreen.setDarkModeTheme': return 'Set dark mode theme';
			case 'settingsScreen.language': return 'Language';
			case 'settingsScreen.setTheAppLanguage': return 'Set language';
			case 'settingsScreen.back': return 'Back';
			case 'settingsScreen.general': return 'General';
			case 'settingsScreen.tabRefreshBehaviour': return 'Tab refresh Mode';
			case 'settingsScreen.tabBehaviourWhenOpeningaYoutubeUrl': return 'Tab mode when opening a yt url';
			case 'settingsScreen.updateTab': return 'Update';
			case 'settingsScreen.removeTab': return 'Delete';
			case 'settingsScreen.invidiousPreferences.invidiousPreferences': return 'Invidious preferences';
			case 'settingsScreen.invidiousPreferences.audioMode': return 'Audio mode';
			case 'settingsScreen.invidiousPreferences.audioModeSubtitle': return 'Play videos as audio only';
			case 'settingsScreen.invidiousPreferences.videoQuality': return 'Video quality';
			case 'settingsScreen.invidiousPreferences.videoQualitySubtitle': return 'The default video quality';
			case 'settingsScreen.invidiousPreferences.interfaceLocale': return 'Interface language';
			case 'settingsScreen.invidiousPreferences.defaultCaptions.defaultCaptions': return 'Default captions';
			case 'settingsScreen.invidiousPreferences.defaultCaptions.none': return 'none';
			case 'settingsScreen.invidiousPreferences.defaultCaptions.first': return 'The first';
			case 'settingsScreen.invidiousPreferences.defaultCaptions.second': return 'The second';
			case 'settingsScreen.invidiousPreferences.defaultCaptions.third': return 'The third';
			case 'settingsScreen.invidiousPreferences.autoPlay': return 'Autoplay';
			case 'settingsScreen.invidiousPreferences.autoPlaySubtitle': return 'Play videos automatically';
			case 'settingsScreen.invidiousPreferences.alwaysLoop': return 'Always loop';
			case 'settingsScreen.invidiousPreferences.alwaysLoopSubtitle': return 'Replay video when it ends';
			case 'settingsScreen.Main': return 'Main';
			case 'settingsScreen.other': return 'Other';
			case 'errors.networkConnectionError': return 'Network connection error';
			default: return null;
		}
	}
}

extension on _StringsAr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'locale': return 'العربية';
			case 'appName': return 'Forwardious';
			case 'home.settings': return 'الإعدادات';
			case 'home.loading': return 'جاري التحميل';
			case 'instanceDetails.location': return 'الموقع';
			case 'instanceDetails.type': return 'النوع';
			case 'instanceDetails.health': return 'الصحة';
			case 'instanceDetails.signUp': return 'التسجيل';
			case 'instanceDetails.tooltip.locationTip': return 'موقع المُستنسخ';
			case 'instanceDetails.tooltip.typeTip': return 'نوع البروتوكول';
			case 'instanceDetails.tooltip.healthTip': return 'وقت التشغيل/التوقف';
			case 'instanceDetails.tooltip.signUpTip': return 'القدرة على التسجيل في هذا المُستنسخ';
			case 'settingsScreen.theme': return 'السمة';
			case 'settingsScreen.darkMode': return 'الوضع المظلم';
			case 'settingsScreen.setDarkModeTheme': return 'تعيين سمة الوضع المظلم';
			case 'settingsScreen.language': return 'اللغة';
			case 'settingsScreen.setTheAppLanguage': return 'تعيين لغة التطبيق';
			case 'settingsScreen.back': return 'عودة';
			case 'settingsScreen.general': return 'عام';
			case 'settingsScreen.tabRefreshBehaviour': return 'وضع علامة التبويب';
			case 'settingsScreen.tabBehaviourWhenOpeningaYoutubeUrl': return 'وضع علامة التبويب عند فتح عنوان يوتيوب';
			case 'settingsScreen.updateTab': return 'إنعاش';
			case 'settingsScreen.removeTab': return 'حذف';
			case 'settingsScreen.invidiousPreferences.invidiousPreferences': return 'تفضيلات إنفيديوس';
			case 'settingsScreen.invidiousPreferences.audioMode': return 'وضع الصوت';
			case 'settingsScreen.invidiousPreferences.audioModeSubtitle': return 'تشغيل الفيديوهات كصوت فقط';
			case 'settingsScreen.invidiousPreferences.videoQuality': return 'جودة الفيديو';
			case 'settingsScreen.invidiousPreferences.videoQualitySubtitle': return 'جودة الفيديو الإفتراضية';
			case 'settingsScreen.invidiousPreferences.interfaceLocale': return 'لغة واجهة المستنسخ';
			case 'settingsScreen.invidiousPreferences.defaultCaptions.defaultCaptions': return 'التسميات التوضيحية الإفتراضية';
			case 'settingsScreen.invidiousPreferences.defaultCaptions.none': return 'لاشي';
			case 'settingsScreen.invidiousPreferences.defaultCaptions.first': return 'الأولى';
			case 'settingsScreen.invidiousPreferences.defaultCaptions.second': return 'الثانية';
			case 'settingsScreen.invidiousPreferences.defaultCaptions.third': return 'الثالثة';
			case 'settingsScreen.invidiousPreferences.autoPlay': return 'التشغيل التلقائي';
			case 'settingsScreen.invidiousPreferences.autoPlaySubtitle': return 'تشغيل الفيديوهات تلقائياً';
			case 'settingsScreen.invidiousPreferences.alwaysLoop': return 'تكرر دائماً';
			case 'settingsScreen.invidiousPreferences.alwaysLoopSubtitle': return 'عند إنتهاء الفيديو كرره';
			case 'settingsScreen.Main': return 'الرئيسية';
			case 'settingsScreen.other': return 'أُخرى';
			case 'errors.networkConnectionError': return 'خطأ في الإتصال بالشبكة';
			default: return null;
		}
	}
}

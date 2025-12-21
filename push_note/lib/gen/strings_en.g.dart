///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
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

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Background'
	String get background => 'Background';

	/// en: 'Theme'
	String get theme => 'Theme';

	/// en: 'Gradient'
	String get gradient => 'Gradient';

	/// en: 'Time format'
	String get timeFormat => 'Time format';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Add now'
	String get addNow => 'Add now';

	/// en: 'Reschedule'
	String get reschedule => 'Reschedule';

	/// en: 'Remove'
	String get remove => 'Remove';

	/// en: 'Create a new task'
	String get createNewTask => 'Create a new task';

	/// en: 'Progress'
	String get progress => 'Progress';

	/// en: 'History'
	String get history => 'History';

	/// en: 'Scheduled'
	String get scheduled => 'Scheduled';

	/// en: 'Scheduled at'
	String get scheduledAt => 'Scheduled at';

	/// en: 'Enter something'
	String get enterSomething => 'Enter something';

	/// en: 'Create'
	String get create => 'Create';

	/// en: 'High'
	String get high => 'High';

	/// en: 'Important'
	String get important => 'Important';

	/// en: 'Middle'
	String get middle => 'Middle';

	/// en: 'Secondary'
	String get secondary => 'Secondary';

	/// en: 'Low'
	String get low => 'Low';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return _flatMapFunction$0(path);
	}

	dynamic _flatMapFunction$0(String path) {
		switch (path) {
			case 'settings': return 'Settings';
			case 'background': return 'Background';
			case 'theme': return 'Theme';
			case 'gradient': return 'Gradient';
			case 'timeFormat': return 'Time format';
			case 'language': return 'Language';
			case 'addNow': return 'Add now';
			case 'reschedule': return 'Reschedule';
			case 'remove': return 'Remove';
			case 'createNewTask': return 'Create a new task';
			case 'progress': return 'Progress';
			case 'history': return 'History';
			case 'scheduled': return 'Scheduled';
			case 'scheduledAt': return 'Scheduled at';
			case 'enterSomething': return 'Enter something';
			case 'create': return 'Create';
			case 'high': return 'High';
			case 'important': return 'Important';
			case 'middle': return 'Middle';
			case 'secondary': return 'Secondary';
			case 'low': return 'Low';
			default: return null;
		}
	}
}


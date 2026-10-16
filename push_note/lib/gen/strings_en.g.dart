///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	dynamic operator[](String key) => _meta.getTranslation(key);

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

	/// en: 'Enter the note :)'
	String get enterTheNote => 'Enter the note :)';

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

	/// en: 'Coming soon'
	String get comingSoon => 'Coming soon';

	/// en: 'It is necessary to give access for using notifications to use this feature'
	String get accessForUsingNotifications => 'It is necessary to give access for using notifications to use this feature';

	/// en: 'Speech not available'
	String get speechNotAvailable => 'Speech not available';

	/// en: 'This language is not supported right now. If you are offline, please try to turn on the network connection'
	String get languageNotSupported => 'This language is not supported right now. If you are offline, please try to turn on the network connection';

	/// en: 'Something went wrong. Please check the network connection'
	String get somethingWentWrong => 'Something went wrong. Please check the network connection';

	/// en: 'Count of notes by all time'
	String get countByAllTime => 'Count of notes by all time';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'settings' => 'Settings',
			'background' => 'Background',
			'theme' => 'Theme',
			'gradient' => 'Gradient',
			'timeFormat' => 'Time format',
			'language' => 'Language',
			'addNow' => 'Add now',
			'reschedule' => 'Reschedule',
			'remove' => 'Remove',
			'createNewTask' => 'Create a new task',
			'progress' => 'Progress',
			'history' => 'History',
			'scheduled' => 'Scheduled',
			'scheduledAt' => 'Scheduled at',
			'enterTheNote' => 'Enter the note :)',
			'create' => 'Create',
			'high' => 'High',
			'important' => 'Important',
			'middle' => 'Middle',
			'secondary' => 'Secondary',
			'low' => 'Low',
			'comingSoon' => 'Coming soon',
			'accessForUsingNotifications' => 'It is necessary to give access for using notifications to use this feature',
			'speechNotAvailable' => 'Speech not available',
			'languageNotSupported' => 'This language is not supported right now. If you are offline, please try to turn on the network connection',
			'somethingWentWrong' => 'Something went wrong. Please check the network connection',
			'countByAllTime' => 'Count of notes by all time',
			_ => null,
		};
	}
}

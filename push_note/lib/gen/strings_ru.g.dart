///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsRu implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override String get settings => 'Настройки';
	@override String get background => 'Фон';
	@override String get theme => 'Тема';
	@override String get gradient => 'Градиент';
	@override String get timeFormat => 'Формат времени';
	@override String get language => 'Язык';
	@override String get addNow => 'Добавить сейчас';
	@override String get reschedule => 'Перенести';
	@override String get remove => 'Удалить';
	@override String get createNewTask => 'Создать новую задачу';
	@override String get progress => 'Достижения';
	@override String get history => 'История';
	@override String get scheduled => 'Запланированно';
	@override String get scheduledAt => 'Запланированно на';
	@override String get enterSomething => 'Введите что-нибудь';
	@override String get create => 'Создать';
	@override String get high => 'Высокий';
	@override String get important => 'Важный';
	@override String get middle => 'Средний';
	@override String get secondary => 'Побочный';
	@override String get low => 'Низкий';
	@override String get comingSoon => 'Скоро появится';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return _flatMapFunction$0(path);
	}

	dynamic _flatMapFunction$0(String path) {
		switch (path) {
			case 'settings': return 'Настройки';
			case 'background': return 'Фон';
			case 'theme': return 'Тема';
			case 'gradient': return 'Градиент';
			case 'timeFormat': return 'Формат времени';
			case 'language': return 'Язык';
			case 'addNow': return 'Добавить сейчас';
			case 'reschedule': return 'Перенести';
			case 'remove': return 'Удалить';
			case 'createNewTask': return 'Создать новую задачу';
			case 'progress': return 'Достижения';
			case 'history': return 'История';
			case 'scheduled': return 'Запланированно';
			case 'scheduledAt': return 'Запланированно на';
			case 'enterSomething': return 'Введите что-нибудь';
			case 'create': return 'Создать';
			case 'high': return 'Высокий';
			case 'important': return 'Важный';
			case 'middle': return 'Средний';
			case 'secondary': return 'Побочный';
			case 'low': return 'Низкий';
			case 'comingSoon': return 'Скоро появится';
			default: return null;
		}
	}
}


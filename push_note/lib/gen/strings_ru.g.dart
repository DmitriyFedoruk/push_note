///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsRu with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key);

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
	@override String get addNow => 'Добавить';
	@override String get reschedule => 'Перенести';
	@override String get remove => 'Удалить';
	@override String get createNewTask => 'Создать новую задачу';
	@override String get progress => 'Прогресс';
	@override String get history => 'История';
	@override String get scheduled => 'Планы';
	@override String get scheduledAt => 'Запланированно на';
	@override String get enterTheNote => 'Введите заметку :)';
	@override String get create => 'Создать';
	@override String get high => 'Высокий';
	@override String get important => 'Важный';
	@override String get middle => 'Средний';
	@override String get secondary => 'Побочный';
	@override String get low => 'Низкий';
	@override String get comingSoon => 'Скоро появится';
	@override String get accessForUsingNotifications => 'Для использования этой функции необходимо предоставить доступ к уведомлениям';
	@override String get speechNotAvailable => 'Речь недоступна';
	@override String get languageNotSupported => 'Этот язык сейчас не поддерживается. Если вы не в сети, попробуйте включить подключение к интернету';
	@override String get somethingWentWrong => 'Что-то пошло не так. Пожалуйста, проверьте подключение к интернету';
	@override String get countByAllTime => 'Количество заметок за всё время';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'settings' => 'Настройки',
			'background' => 'Фон',
			'theme' => 'Тема',
			'gradient' => 'Градиент',
			'timeFormat' => 'Формат времени',
			'language' => 'Язык',
			'addNow' => 'Добавить',
			'reschedule' => 'Перенести',
			'remove' => 'Удалить',
			'createNewTask' => 'Создать новую задачу',
			'progress' => 'Прогресс',
			'history' => 'История',
			'scheduled' => 'Планы',
			'scheduledAt' => 'Запланированно на',
			'enterTheNote' => 'Введите заметку :)',
			'create' => 'Создать',
			'high' => 'Высокий',
			'important' => 'Важный',
			'middle' => 'Средний',
			'secondary' => 'Побочный',
			'low' => 'Низкий',
			'comingSoon' => 'Скоро появится',
			'accessForUsingNotifications' => 'Для использования этой функции необходимо предоставить доступ к уведомлениям',
			'speechNotAvailable' => 'Речь недоступна',
			'languageNotSupported' => 'Этот язык сейчас не поддерживается. Если вы не в сети, попробуйте включить подключение к интернету',
			'somethingWentWrong' => 'Что-то пошло не так. Пожалуйста, проверьте подключение к интернету',
			'countByAllTime' => 'Количество заметок за всё время',
			_ => null,
		};
	}
}

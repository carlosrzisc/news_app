import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'locale_state.dart';
part 'locale_event.dart';
part 'locale_bloc.freezed.dart';

@lazySingleton
class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(const LocaleState.localeSet()) {
    on<_Load>(_onLoad);
    on<_SwitchLocale>(_onSwitchLocale);
  }

  void _onLoad(_Load event, Emitter<LocaleState> emit) {
    emit(const LocaleState.localeSet(locale: Locale('en')));
  }

  FutureOr<void> _onSwitchLocale(
    _SwitchLocale event,
    Emitter<LocaleState> emit,
  ) async {
    // await _storage.language.save(event.locale.languageCode);
    add(const LocaleEvent.load());
  }
}

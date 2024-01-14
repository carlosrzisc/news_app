# Ginger News 📰

Flutter app example that consumes newsapi.org that displays news, save articles in a local database. It has a clean architecture to separate concerns on different layers. Includes unit and widget tests, find those on each package.

# Screenshots
<img src="/screenshots/scr1.png" width="145"> <img src="/screenshots/scr2.png" width="145"> <img src="/screenshots/scr3.png" width="145">

---

## Installation 🔧

Execute the following steps to complete the project setup:

1. From a terminal, run the following commands:
    1. Add config.json with your api key in order to fetch data from newsapi.org. 
    ```
    {
        "API_KEY": "<YOUR-API-KEY>"
    }
    ```
    2. Setup "app_model" package.
        1. cd packages/app_model
        2. ```flutter pub get```
        3. ```dart run build_runner build --delete-conflicting-outputs```
    3. Setup "news_api" package.
        1. cd packages/news_api
        2. ```flutter pub get```
        3. ```dart run build_runner build --delete-conflicting-outputs```
    4. Setup "app_ui" package.
        1. cd packages/app_ui
        2. ```flutter pub get```
        3. ```dart run build_runner build --delete-conflicting-outputs```
    4. Setup application.
        1. cd .
        2. ```flutter pub get```
        3. ```dart run build_runner build --delete-conflicting-outputs```
        
2. For iOS, go to ios folder and run:
    1. ```pod deintegrate```
    2. ```pod install```

---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart --dart-define-from-file=config.json

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart --dart-define-from-file=config.json

# Production
$ flutter run --flavor production --target lib/main.dart --dart-define-from-file=config.json
```

_\*Ginger News works on iOS, Android, Web, and Windows._

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:news_app/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg

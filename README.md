# Weather App

A Flutter weather application that lets users search for a city and view the current forecast with a UI theme that changes based on the weather condition.

## Features

- Search for weather by city name
- Fetch forecast data from `weatherapi.com`
- Display city, country, temperature, min/max temperature, and condition
- Update the app theme dynamically based on the current weather
- Manage loading and result states with `flutter_bloc`

## Tech Stack

- Flutter
- Dart
- `flutter_bloc`
- `dio`

## Project Structure

```text
lib/
  main.dart
  models/
  services/
  cubit/
  pages/
```

## Getting Started

### Prerequisites

- Flutter SDK installed
- Dart SDK installed
- An emulator, simulator, or physical device

### Installation

1. Clone the repository.
2. Move into the project folder:

```bash
cd weather_app
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

## API Configuration

The app currently uses [WeatherAPI](https://www.weatherapi.com/) for weather data.

At the moment, the API key is hardcoded in [lib/services/weather_service.dart](/Users/fatmagalal/Development/Projects/weather_app/lib/services/weather_service.dart). For learning projects this can work, but for production apps it is better to move the key into a secure configuration approach such as:

- `--dart-define`
- environment-based configuration
- native secure storage or backend proxying

## How It Works

1. The user opens the search screen from the home page.
2. A city name is submitted.
3. `GetWeatherCubit` requests data through `WeatherService`.
4. The UI updates according to the emitted state:
   - `NoWeatherState`
   - `WeatherLoadedState`
   - `WeatherFailureState`

## Useful Commands

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

## Notes

- The current project description in `pubspec.yaml` is still the default Flutter description.
- Some code and file names can be cleaned up later for consistency, but the current structure is clear enough for learning and small-project use.

## License

This project is for learning and personal use unless you add a separate license file.

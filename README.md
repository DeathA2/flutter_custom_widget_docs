# flutter_custom_widget_docs

A documentation preview app and component catalog that demonstrates reusable custom Flutter widgets, their usage examples, and interactive previews.

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Website](#website)
- [How to Run](#how-to-run)
- [Using This Repo](#using-this-repo)
- [Dependencies](#dependencies)
- [Code Structure](#code-structure)
- [Preview App](#preview-app)

---

## Prerequisites

- **Flutter:** `>=3.35.3` (recommended tested: `3.35.6`)
- **Dart:** `3.9.2`
- Project SDK constraint (see `pubspec.yaml`): `sdk: ^3.7.2`

---

## Website

The project has a live demo and documentation site available at:

[https://customwidgetdoc.web.app/](https://customwidgetdoc.web.app/)

Open the link to view the hosted preview app and documentation.

---

## How to Run

1. Clone the repo:

```sh
git clone https://github.com/DeathA2/flutter_custom_widget_docs.git
```

2. Install dependencies:

```sh
flutter pub get
```

3. Generate code (if you change generated files / localization):

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Analyze the project:

```sh
flutter analyze
```

5. Run the preview app (web):

```sh
flutter run -t widget_docs/doc_widget_main.dart
```

## Using This Repo

This repository contains both the app/library code and a documentation preview app under `widget_docs/` that shows widget previews and usage examples.

- Add or update widgets in `lib/` as usual.
- To add a preview demonstration, create a preview file under `widget_docs/widgets/` and register it so it appears in the preview drawer.
- The preview app fetches GitHub repo information and contributors to show inside the app drawer (see `lib/network/implement/github_repository_impl.dart`).

> **Note (CI/CD):** This project has continuous deployment configured on the `dev` branch — any change merged into `dev` will be automatically deployed within approximately 5–10 minutes.

---

## Code Conventions

- See `analysis_options.yaml` for lints and style rules.
- Keep widgets modular and reusable; place common widgets in `lib/widgets/`.
- Naming conventions used in this repo are pragmatic and follow standard Flutter/Dart practices.

---

## Dependencies

This project uses a number of packages; highlights from `pubspec.yaml`:

- `highlight`, `flutter_highlight` — syntax highlighting for code previews
- `dio` — HTTP client used to fetch GitHub data
- `device_frame` — device frames for widget previews
- `url_launcher` — opening external links from the preview app
- `flutter_svg` — SVG rendering

For the full list, see `pubspec.yaml`.

---

## Code Structure

```
.
├─ lib/                       # application/library code
│  ├─ network/                # network layer & GitHub repo implementation
│  ├─ rsc/                    # resources (colors, fonts, images, styles)
│  └─ widgets/                # reusable widgets
├─ widget_docs/               # documentation preview app + previews
│  ├─ doc_preview_app.dart    # preview app shell
│  └─ widgets/                # preview widgets (usage, device frame, etc.)
├─ assets/                    # assets (fonts, svg)
└─ pubspec.yaml
```

---

## Preview App

Open `widget_docs/doc_preview_app.dart` to run the documentation preview app. Key preview widgets:

- `widget_docs/widgets/preview/device_frame_switcher.dart` — DeviceFrame switcher (iOS / Android / Web)
- `widget_docs/widgets/preview/usage_doc_widget.dart` — selectable, syntax-highlighted code previews

The preview app drawer includes a small repository info area (owner + contributors) and a "Contribute here" link which opens the repository in the browser or via `url_launcher` on native platforms.


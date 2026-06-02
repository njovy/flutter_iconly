## 2.0.0

* **Flutter 3.44 / Dart 3 compatibility.** `IconData` became a `final` class in
  Flutter 3.44 and can no longer be subclassed, which broke the previous
  `LightData`/`BoldData`/`BrokenData extends IconData` approach.
    * Each icon set is now a `@staticIconProvider abstract final class` exposing
      plain `static const IconData` constants — the same pattern Flutter's own
      `Icons` and `CupertinoIcons` classes use.
    * `@staticIconProvider` re-enables icon font tree-shaking, so release builds
      only bundle the glyphs you actually use.
    * Removed the `LightData`, `BoldData`, and `BrokenData` helper classes.
      These `IconData` subclasses were technically exported, so the rare code
      that referenced them directly must switch to the `IconlyLight` /
      `IconlyBold` / `IconlyBroken` constants (the documented usage) — `IconData`
      can no longer be subclassed in Flutter 3.44.
    * Raised the minimum SDK to Dart `>=3.0.0` and Flutter `>=3.10.0`.
* **No migration required for normal usage** — `Icon(IconlyLight.search)` and all
  `IconlyLight`/`IconlyBold`/`IconlyBroken` constants are unchanged (same names,
  same code points). Pin `iconly: ^1.0.1` if you need Flutter `< 3.10`.
* Fixed the README usage snippet that imported `font_awesome_flutter` instead of
  `iconly`.

## 1.0.1

* Example Published and document updated:
    * Example Project is now available on this [Link](https://6thsolution.github.io/flutter_iconly)
    * README.md updated
	
## 1.0.0

* Initial release. In this version, we are supporting these icon sets:
    * Light
    * Bold
    * Broken
    
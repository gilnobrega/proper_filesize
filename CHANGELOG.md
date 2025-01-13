# Changelog

## 1.0.2
*   **Pluralization:** Fixed pluralization for long-format units (e.g., "2 megabytes" instead of "2 megabyte").
*   **Typo:** Corrected `Unit.zetabyte` to `Unit.zettabyte`.
*   **README:** Minor clarifications to usage instructions and examples.

## 1.0.1
*   **Docs:** Improved package description for pub.dev.

## 1.0.0

### Features

*   **API Refactor:** Refactored the API for improved usability and clarity.
*   **New Constructors:** Introduced new constructors for creating `FileSize` objects from bytes and specific units.
*   **Unit Enum:** Added `Unit` enum for representing file size units (KB, KiB, MB, MiB, etc.).
*   **BaseType Enum:** Added `BaseType` enum to distinguish between metric and binary bases.
*   **FormatType Enum:** Added `FormatType` enum for specifying short or long format types.
*   **Size conversion:** Added a new method `toSize` to convert a size to another unit.

### Updates

*   **Examples:** Updated examples to reflect the new API and features.
*   **README:** Updated README with detailed usage instructions, examples, and badges.
*   **License:** Updated copyright year in the license file.
*   **Test Suite:** Added comprehensive unit tests for increased code reliability.
*   **Documentation:** Generated API documentation for better developer experience.
*   **Linting:** Added linter rules for improved code quality.
*   **pubspec.yaml:** Updated package description.

### Breaking Changes

*   The `ProperFilesize` class has been replaced by the `FileSize` class.
*   The `generateHumanReadableFilesize` and `parseHumanReadableFilesize` methods have been replaced by the `FileSize` constructors and `toString` method.

## 0.0.2
- Updates documentation
  
## 0.0.1
- Initial release

# Debugging Frontend

Since the app uses a library that communicates with an external library, namely "chrome" you cannot directly run the app's UI on debug mode in a web or any other platform. You need to perform a few steps before debugging the UI.

To debug the app's UI, follow these steps:

1. Comment the lines that use the "chrome" external library:

   - In the file located at "lib/backend/chrome_api/storage/chrome_storage.dart":
     - Comment line 1: `import 'package:chrome_extension/storage.dart'`
     - Comment line 11: `chrome.storage.local.set(items);`

2. `flutter pub get`

3. Specify the platform on which you would like to debug the UI:
    ```
    flutter create --platforms linux .
    ```
    options are [ Linux | Windows | Macos | Android | Ios ]

    Note: When adding support for a new platform, you will notice
    that a new folder called "test" appears,You can simply delete it.

5. `flutter run`

After finishing the work with the UI, simply uncomment the lines above and commit the changes.


# Debugging Chrome Side

When editing anything related to the Chrome library, you need to build the extension using the build script:

```dart
dart build_extension.dart
```

This script will build the extension and convert all the files in the `lib/backend/chrome_api` directory to `.dart.js` files using `dart2js`, make sure your code that uses the Chrome library is located in this directory.
# Flutter boilerplate project

## What does the project use?

1. Architectural pattern/ Design
   philosophy: [Clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).
2. State management: [flutter_riverpod](https://pub.dev/packages/riverpod).
3. To generate assets files, include: images, fonts,
   colors...: [flutter_gen](https://pub.dev/packages/flutter_gen).
4. Routing: [go_router](https://pub.dev/packages/go_router).
5. Interact APIs: [dio](https://pub.dev/packages/dio).
6. Error handling: Use `Either` class on [fpdart](https://pub.dev/packages/fpdart).
7. Generation code tool: [build_runner](https://pub.dev/packages/build_runner).
8. Local storage: [shared_preferences](https://pub.dev/packages/shared_preferences).

## Environment

This project is running on flutter version `3.16.5`.

## Flavor configuration

#### Android Studio

1. [Open the Run/Debug Configurations dialog.](https://developer.android.com/studio/run/rundebugconfig?hl=en#opening).
2. Type a flavor in **Build flavor** field. For example, type the text `dev` into the field.
3. Click **OK** or **Apply**.

#### Visual Studio Code

1. Open **Run and debug** tab.
2. Choose flavor that you want to running, `Run on dev` or `Run on prod` flavor.

   **NOTE**: You can edit the configuration in `/.vscode/launch.json`.

## Personalize

1. In **pubspec.yaml**, at line 1:
   ```
   name: flutter_boilerplate
   ```
   Change `flutter_boilerplate` to new name.

   **NOTE**: What is `name` in above snippet means?

   > The name of this package. The name is how other packages refer to yours, should you publish it.

2. Replace all **imported directories** with the new name in step 1.

   Find in project and replace all `package:flutter_boilerplate` to new name (in step 1)

   Old import:
   ```
   import 'package:flutter_boilerplate/data/data_sources/user/user_remote_data_source_impl.dart';
   ```
   New import:
   ```
   import 'package:your_new_package_name/src/data/data_sources/user/user_remote_data_source_impl.dart';
   ```
3. Change the **namespace** and the **package name** for Android:
    - In app/build.gradle:

      Change `com.example.flutter_boilerplat` to the new **namespace**.

         ```
         namespace "com.example.flutter_boilerplate"
         ```
      Change `com.example.flutter_boilerplate` to the new **package name (applicationId)**.

       ```
       applicationId "com.example.flutter_boilerplate"
       ```

    - In MainActivity.kt:
      Change `com.example.flutter_boilerplate` to the new **package name** (equivalent to *
      *namespace**).

      ```
      package com.flutter.boilerplate.flutter_boilerplate
      ```

      **NOTE**:  `namespace` in **app/build.gradle** must have like `package` in **MainActivity.kt
      **.

4. Change the **package name** for iOS:

    - Change all lines containing  `com.example.flutter_boilerplate` to the **new package name** in
      the production environment.

       ```
       PRODUCT_BUNDLE_IDENTIFIER = com.example.flutter_boilerplate
       ```

    - Change all lines containing  `com.example.flutter_boilerplate.stg` to the **new package name**
      in
      the staging environment.

       ```
       PRODUCT_BUNDLE_IDENTIFIER = com.example.flutter_boilerplate.stg
       ```
    - Change all lines containing  `com.example.flutter_boilerplate.dev` to the **new package name**
      in
      the development environment.

       ```
       PRODUCT_BUNDLE_IDENTIFIER = com.example.flutter_boilerplate.dev
       ```

## Generate code and files before running project

1. Get package dependencies:

    ```
    flutter pub get
    ```

2. Generate necessary files (assets, generation class...):
    - To delete conflicting classes and re-generate, run:

       ```
       dart run build_runner build -d
       ```

    - To generate without delete conflicting outputs, run:

       ```
       dart run build_runner build
       ```

## How to run?

**Two ways to run the project:**

1. Click on `Run` or `Debug` in the IDE.
2. Command run:

    ```
    flutter run --flavor=dev
    ```

Change `--flavor=dev` to `--flavor=prod` if you want to run in the production environment.
---
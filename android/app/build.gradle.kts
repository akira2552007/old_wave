plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.old_wave"
    compileSdk = property("flutter.compileSdkVersion") as Int
    ndkVersion = property("flutter.ndkVersion") as String

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.old_wave"
        minSdk = property("flutter.minSdkVersion") as Int
        targetSdk = property("flutter.targetSdkVersion") as Int
        versionCode = property("flutter.versionCode") as Int
        versionName = property("flutter.versionName") as String
    }

    buildTypes {
        getByName("release") {
            // Signing with debug keys for now so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

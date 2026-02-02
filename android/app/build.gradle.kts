plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// val localProperties = Properties()
// val localPropertiesFile = rootProject.file("local.properties")
// if (localPropertiesFile.exists()) {
//     localPropertiesFile.inputStream().use { localProperties.load(it) }
// }

// val flutterVersionCode = localProperties.getProperty("flutter.versionCode")?.toIntOrNull() ?: 1
// val flutterVersionName = localProperties.getProperty("flutter.versionName") ?: "1.0"

// --- keystore (مشروط) ---
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystorePropertiesFile.inputStream().use { keystoreProperties.load(it) }
}


android {
    namespace = "com.mid.food_delivery"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.mid.food_delivery"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        // أنشئ release فقط إذا توفّر الملف والقيم ليست فارغة
        if (keystorePropertiesFile.exists()) {
            val storeFilePath = keystoreProperties["storeFile"]?.toString()?.trim()
            val keyAliasVal   = keystoreProperties["keyAlias"]?.toString()?.trim()
            val keyPassVal    = keystoreProperties["keyPassword"]?.toString()?.trim()
            val storePassVal  = keystoreProperties["storePassword"]?.toString()?.trim()

            if (!storeFilePath.isNullOrEmpty()
                && !keyAliasVal.isNullOrEmpty()
                && !keyPassVal.isNullOrEmpty()
                && !storePassVal.isNullOrEmpty()
            ) {
                create("release") {
                    keyAlias = keyAliasVal
                    keyPassword = keyPassVal
                    storeFile = file(storeFilePath)
                    storePassword = storePassVal
                }
            }
        }
        // debug يستخدم debug.keystore الافتراضي
    }

    buildTypes {
        getByName("debug") {
            // لا تربطه بتوقيع release
            isMinifyEnabled = false
            isShrinkResources = false
        }
        getByName("release") {
            // اربط توقيع release فقط إذا تم إنشاؤه فعلاً
            signingConfigs.findByName("release")?.let { signingConfig = it }
            isMinifyEnabled = false
            isShrinkResources = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
}

flutter {
    source = "../.."
}

// dependencies {
//   // Import the Firebase BoM
//   implementation(platform("com.google.firebase:firebase-bom:34.6.0"))


//   // TODO: Add the dependencies for Firebase products you want to use
//   // When using the BoM, don't specify versions in Firebase dependencies
//   implementation("com.google.firebase:firebase-analytics")


//   // Add the dependencies for any other desired Firebase products
//   // https://firebase.google.com/docs/android/setup#available-libraries
// }
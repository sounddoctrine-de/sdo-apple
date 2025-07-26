<p align="center">
  <a href="https://apps.apple.com/in/app/sound-doctrine-online/id6443919279">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://storage.googleapis.com/sdo-public-assets/Text%20Logo.png">
      <img src="https://storage.googleapis.com/sdo-public-assets/Text%20Logo.png" height="128">
    </picture>
    <h1 align="center">Sound Doctrine Online</h1>
  </a>
</p>

SDO Apple is the Apple ecosystem client for Sound Doctrine Online ([sounddoctrine.online](https://sounddoctrine.online)). This repository contains both the original iOS/macOS Xcode project and a new Kotlin Multiplatform project that supports iOS, Android, and Desktop platforms.

<p align="center">
  <a href="https://apps.apple.com/in/app/sound-doctrine-online/id6443919279">
    <img src="https://storage.googleapis.com/sdo-public-assets/Download_on_the_App_Store_Badge_US-UK_RGB_wht_092917.svg">
  </a>
</p>

#### What is Sound Doctrine Online?
Looking for non-charismatic, non-ecumenical, Independent Fundamental Baptist (IFB) preaching and congregational singing from around the world? They're all on Sound Doctrine Online.

Sound Doctrine Online is a video streaming platform that hosts IFB content from around the world.

The aim of Sound Doctrine Online is to make Hard Preaching from across the world accessible to everyone. It includes documentaries, sermons, congregational singing, and short excerpts of preaching.

---

## Project Structure

This repository contains two main projects:

### 1. Original iOS/macOS Project (Xcode)
- **Location**: Root directory (`SDO.xcodeproj`)
- **Platforms**: iOS 16+, macOS 11.0+
- **Technology**: Swift, SwiftUI
- **Status**: Legacy project, being migrated to Kotlin Multiplatform

### 2. Kotlin Multiplatform Project (Compose Multiplatform)
- **Location**: `SDOMultiplatform/` directory  
- **Platforms**: iOS, Android, Desktop (macOS/Windows/Linux), Web (Wasm)
- **Technology**: Kotlin Multiplatform, Compose Multiplatform
- **Status**: Active development

---

## Running the iOS/macOS App (Xcode Project)

### Prerequisites
- [Xcode](https://developer.apple.com/xcode/) 13 or later (recommended: latest version)
- macOS 11.0 or later
- An Apple Developer account (for running on a real device)

### Steps
1. **Clone the repository:**
   ```sh
   git clone <repo-url>
   cd sdo-apple
   ```
2. **Open the project in Xcode:**
   - Double-click `SDO.xcodeproj` or open it from Xcode (`File > Open...`).
3. **Select the target:**
   - For iOS: Select `SDO (iOS)` as the scheme and choose a simulator or your device.
   - For macOS: Select `SDO (macOS)` as the scheme.
4. **Install dependencies:**
   - If prompted, resolve Swift Package Manager dependencies in Xcode (`File > Packages > Resolve Package Versions`).
5. **Build and run:**
   - Click the ▶️ (Run) button in Xcode, or press `Cmd+R`.

### Notes
- For iOS, the app supports iOS 16 and above.
- For macOS, the app supports macOS 11.0 and above.
- You may need to set up signing with your Apple ID in Xcode for device deployment.

---

## Running the Multiplatform App (Kotlin/Compose)

### Prerequisites
- [Android Studio](https://developer.android.com/studio) or [IntelliJ IDEA](https://www.jetbrains.com/idea/)
- JDK 11 or later
- For iOS development: Xcode and macOS
- For Android development: Android SDK

### Steps
1. **Navigate to the multiplatform project:**
   ```sh
   cd SDOMultiplatform
   ```

2. **Open the project:**
   - Open `SDOMultiplatform` folder in Android Studio or IntelliJ IDEA

3. **Run the app:**
   - **Android**: Select `composeApp` configuration and run
   - **iOS**: Select `iosApp` configuration and run (requires macOS and Xcode)
   - **Desktop**: Select `desktopApp` configuration and run
   - **Web**: Run `./gradlew wasmJsBrowserRun`

### Notes
- The multiplatform project shares business logic and UI across all platforms
- Platform-specific code is organized in respective source sets
- See `SDOMultiplatform/README.md` for detailed setup instructions

---

## Code Analysis with CodeQL

You can create a CodeQL database for Swift code analysis and run custom queries as follows:

### Creating a CodeQL Database

Run the following command in your project root to generate a CodeQL database for Swift:

```sh
codeql database create ./databases/swift-database \
  --language=swift \
  --command="xcodebuild build -project SDO.xcodeproj -scheme \"SDO (iOS)\""
```

**For the Kotlin Multiplatform project:**

```sh
codeql database create ./databases/kotlin-database \
  --language=java \
  --command="cd SDOMultiplatform && ./gradlew compileKotlin"
```

Refer to the [CodeQL documentation](https://codeql.github.com/docs/codeql-cli/) for more details on advanced usage.

---
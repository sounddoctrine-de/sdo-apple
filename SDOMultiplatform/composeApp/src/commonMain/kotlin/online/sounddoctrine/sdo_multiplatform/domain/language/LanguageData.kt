package online.sounddoctrine.sdo_multiplatform.domain.language

data class LanguageData(
    val languageCode: String,
    val sourceCountryFlag: String
) {
    companion object {
        operator fun invoke(
            languageCode: String? = null,
            sourceCountryFlag: String? = null
        ) = LanguageData(
            languageCode ?: "",
            sourceCountryFlag ?: ""
        )

        operator fun invoke() = LanguageData(
            "",
            ""
        )
    }
    // The concept of `Identifiable` and a UUID generated from `languageCode`
    // can be handled differently in Kotlin.
    // If you need a unique ID, you can either generate it upon creation
    // or use the languageCode itself if it's guaranteed to be unique.
    // For simplicity, I'm omitting a direct UUID equivalent here,
    // as Kotlin data classes automatically provide equals() and hashCode().

    // The `languageName` computed property requires platform-specific implementations
    // to get localized strings.

    // You would typically define an expect/actual for getting localized language names.
    // In your common code:
    // expect fun getLocalizedLanguageName(languageCode: String): String?

    // And then in your platform-specific source sets (e.g., androidMain, iosMain):
    // actual fun getLocalizedLanguageName(languageCode: String): String? {
    //     // Android implementation
    //     return Locale(languageCode).displayLanguage
    // }
    // actual fun getLocalizedLanguageName(languageCode: String): String? {
    //     // iOS implementation (can call Swift code via Cinterop or use iOS APIs)
    //     return NSLocale.currentLocale().displayNameForKey(NSLocaleLanguageCode, languageCode)
    // }

    // For now, let's keep it simple. You'd integrate the expect/actual mechanism
    // for a complete solution.
    val languageName: String
        get() {
            // This is a placeholder. You'll need to implement platform-specific
            // logic to get the localized language name.
            // For JVM, you could use:
            // return Locale(languageCode).getDisplayLanguage(Locale.getDefault())
            // For other platforms, you'll need corresponding implementations.
            return getPlatformLocalizedLanguageName(languageCode) ?: "Unknown Language"
        }
}

// Example of an expect function for platform-specific localization
expect fun getPlatformLocalizedLanguageName(languageCode: String): String?
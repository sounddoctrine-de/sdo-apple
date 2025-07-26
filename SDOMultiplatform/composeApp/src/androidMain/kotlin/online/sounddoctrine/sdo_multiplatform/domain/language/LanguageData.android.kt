package online.sounddoctrine.sdo_multiplatform.domain.language

import java.util.Locale

actual fun getPlatformLocalizedLanguageName(languageCode: String): String? {
    return Locale(languageCode).displayLanguage
}
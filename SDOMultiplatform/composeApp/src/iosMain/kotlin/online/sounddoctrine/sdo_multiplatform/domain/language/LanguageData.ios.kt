package online.sounddoctrine.sdo_multiplatform.domain.language

import platform.Foundation.NSLocale
import platform.Foundation.NSLocaleLanguageCode
import platform.Foundation.currentLocale

actual fun getPlatformLocalizedLanguageName(languageCode: String): String? {
    return NSLocale.currentLocale().displayNameForKey(NSLocaleLanguageCode, languageCode)
}
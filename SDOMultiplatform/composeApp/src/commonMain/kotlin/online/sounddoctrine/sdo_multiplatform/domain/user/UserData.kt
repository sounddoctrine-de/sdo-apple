package online.sounddoctrine.sdo_multiplatform.domain.user

/**
 * Represents user data.
 *
 * @property id The unique identifier for this user data entry.
 * @property userUuid The unique identifier (UUID) of the user.
 * @property userEmail The email address of the user.
 */
data class UserData(val id: String, val userUuid: String, val userEmail: String)

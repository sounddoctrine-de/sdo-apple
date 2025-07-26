package online.sounddoctrine.sdo_multiplatform.domain.user

/**
 * Represents the data required to delete all user data.
 *
 * @property userEmail The email address of the user whose data is to be deleted.
 * @property userUuid The unique identifier (UUID) of the user whose data is to be deleted.
 */
data class DeleteAllUserData(val userEmail: String, val userUuid: String)
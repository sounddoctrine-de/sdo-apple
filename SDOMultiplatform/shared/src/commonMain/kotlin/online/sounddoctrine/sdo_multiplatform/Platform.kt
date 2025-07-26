package online.sounddoctrine.sdo_multiplatform

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform
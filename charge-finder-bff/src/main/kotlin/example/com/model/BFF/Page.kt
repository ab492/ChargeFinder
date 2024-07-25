package example.com.model.BFF

import kotlinx.serialization.Serializable

@Serializable
data class Page(
    val name: String,
    val slug: String
)

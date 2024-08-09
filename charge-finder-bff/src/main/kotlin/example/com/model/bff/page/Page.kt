package example.com.model.bff.page

import kotlinx.serialization.Serializable

@Serializable
data class Page(
    val name: String,
    val slug: String,
    val pageType: PageType
)


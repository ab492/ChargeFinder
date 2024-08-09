package example.com.model.bff.homepage

import kotlinx.serialization.Serializable

@Serializable
data class Home(
    val title: String,
    val items: List<HomeItem>,
)


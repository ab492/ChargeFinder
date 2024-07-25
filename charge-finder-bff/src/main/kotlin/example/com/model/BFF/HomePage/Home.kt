package example.com.model.BFF.HomePage

import kotlinx.serialization.Serializable

@Serializable
data class Home(
    val title: String,
    val items: List<HomeItem>,
)


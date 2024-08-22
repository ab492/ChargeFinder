package example.com.model.bff.page
import kotlinx.serialization.Serializable
import kotlinx.serialization.SerialName

@Serializable
enum class PageType {
    @SerialName("list")
    LIST
}
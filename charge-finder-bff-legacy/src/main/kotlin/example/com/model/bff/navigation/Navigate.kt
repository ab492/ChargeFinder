package example.com.model.bff.navigation

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
@SerialName("navigationDestination")
sealed class NavigationDestination {
    @Serializable
    @SerialName("chargingStationDetail")
    data class ChargingStationDetail(val href: String) : NavigationDestination()
}

@Serializable
@SerialName("action")
sealed class Action {
    @Serializable
    @SerialName("navigateTo")
    data class NavigateTo(val destination: NavigationDestination) : Action()
}
package com.brambly.chargefinder
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class ListItem (
    @SerialName("id")
    val id: Int,
    @SerialName("title")
    val title: String,
    @SerialName("action")
    var action: Action
)

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
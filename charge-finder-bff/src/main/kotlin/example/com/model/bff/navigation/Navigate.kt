package example.com.model.bff.navigation

import kotlinx.serialization.Serializable

// TODO LEFT OF HERE TRYING TO MAKE THIS SERIALISABLE.
@Serializable
sealed class NavigationDestination {
    @Serializable
    data class ChargingStationDetail(val href: String) : NavigationDestination()
}

@Serializable
sealed class NavigationAction {
    @Serializable
    data class NavigateTo(val destination: NavigationDestination) : NavigationAction()
}
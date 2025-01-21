package com.brambly.chargefinder
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class ListItem (
    val id: String,
    val title: String,
    var navigationDestination: NavigationDestination
)

@Serializable
data class NavigationDestination (
    @SerialName("href")
    val href: String,
)
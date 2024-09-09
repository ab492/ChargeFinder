package com.brambly.chargefinder
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class ListItem (
    @SerialName("id")
    val id: String,
    @SerialName("title")
    val title: String,
    @SerialName("navigationDestination")
    var navigationDestination: NavigationDestination
)

@Serializable
data class NavigationDestination (
    @SerialName("href")
    val href: String,
)
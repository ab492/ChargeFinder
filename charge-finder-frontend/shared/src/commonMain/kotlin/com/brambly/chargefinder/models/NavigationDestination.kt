package com.brambly.chargefinder.models

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class NavigationDestination (
    @SerialName("href")
    val href: String,
)
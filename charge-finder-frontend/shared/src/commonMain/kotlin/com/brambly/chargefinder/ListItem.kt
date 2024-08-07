package com.brambly.chargefinder
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class ListItem (
    @SerialName("id")
    val id: Int,
    @SerialName("title")
    val title: String,
    @SerialName("href")
    var href: String
)
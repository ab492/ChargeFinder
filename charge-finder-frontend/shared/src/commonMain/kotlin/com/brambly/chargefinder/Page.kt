package com.brambly.chargefinder
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class Page(
    @SerialName("name")
    val name: String,
    @SerialName("slug")
    val slug: String
)

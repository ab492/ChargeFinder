package com.brambly.chargefinder
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class Page(
    val name: String,
    val slug: String,
    val pageType: PageType
)

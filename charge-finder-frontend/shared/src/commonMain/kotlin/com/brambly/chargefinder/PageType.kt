package com.brambly.chargefinder

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
enum class PageType {
    @SerialName("list")
    LIST
}
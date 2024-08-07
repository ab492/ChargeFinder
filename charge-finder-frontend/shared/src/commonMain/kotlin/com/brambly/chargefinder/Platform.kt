package com.brambly.chargefinder

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform
package com.brambly.charge_finder_frontend

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform
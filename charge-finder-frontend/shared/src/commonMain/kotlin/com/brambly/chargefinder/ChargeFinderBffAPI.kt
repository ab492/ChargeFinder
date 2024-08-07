package com.brambly.chargefinder
import io.ktor.client.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.serialization.json.Json
import io.ktor.client.request.*
import io.ktor.client.call.*
import kotlin.native.concurrent.ThreadLocal

@ThreadLocal
object ChargeFinderBffAPI {
    private val httpClient = HttpClient {
        install(ContentNegotiation) {
            json(Json {
                prettyPrint = true
                isLenient = true
                ignoreUnknownKeys = true
            })
        }
    }

    suspend fun fetchHome(): List<ListItem> {
        return httpClient.get("http://www.bramblytech.co.uk/pages/home").body()
    }


}
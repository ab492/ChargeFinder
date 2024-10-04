package com.brambly.chargefinder.api
import com.brambly.chargefinder.ChargingStationDetail
import com.brambly.chargefinder.ListItem
import io.ktor.client.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.serialization.json.Json
import io.ktor.client.request.*
import io.ktor.client.call.*
import io.ktor.client.plugins.defaultRequest
import io.ktor.http.URLProtocol
import kotlin.native.concurrent.ThreadLocal

class ChargeFinderBffImpl: ChargeFinderBff {
    private val basePath = "/pages"

    private val httpClient = HttpClient {
        defaultRequest {
            url {
                protocol = URLProtocol.HTTP
                host = "www.bramblytech.co.uk"
            }
        }
        install(ContentNegotiation) {
            json(Json {
                prettyPrint = true
                isLenient = true
                ignoreUnknownKeys = true
            })
        }
    }

    override suspend fun fetchHome(): List<ListItem> {
        return httpClient.get("$basePath/home").body()
    }

    override suspend fun fetchDetail(id: String): ChargingStationDetail {
        return httpClient.get("$basePath/detail/$id").body()
    }
}
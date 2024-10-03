package com.brambly.chargefinder.api
import com.brambly.chargefinder.ChargingStationDetail
import com.brambly.chargefinder.ListItem
import com.brambly.chargefinder.Page
import io.ktor.client.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.serialization.json.Json
import io.ktor.client.request.*
import io.ktor.client.call.*
import io.ktor.client.plugins.defaultRequest
import io.ktor.http.URLProtocol
import kotlin.native.concurrent.ThreadLocal

@ThreadLocal
object ChargeFinderBffAPI {
    const val BASE_PATH = "/pages"

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

    suspend fun fetchPages(): List<Page> {
        return httpClient.get(BASE_PATH).body()
    }

    // TODO CAN THESE BE MADE GENERIC?
    suspend fun fetchList(href: String): List<ListItem> {
        return httpClient.get("$BASE_PATH/$href").body()
    }

    suspend fun fetchDetail(href: String): ChargingStationDetail {
        return httpClient.get("$BASE_PATH/$href").body()
    }
}
package com.brambly.chargefinder
import io.ktor.client.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.serialization.json.Json
import io.ktor.client.request.*
import io.ktor.client.call.*
import io.ktor.client.plugins.defaultRequest
import io.ktor.http.URLProtocol
import io.ktor.http.Url
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
    suspend fun fetchList(slug: String): List<ListItem> {
        return httpClient.get("$BASE_PATH/$slug").body()
    }

    suspend fun fetchDetail(href: String): ChargingStationDetail {
        return httpClient.get("$BASE_PATH/$href").body() //FIX HREF SLASH
    }

//    suspend fun <T> fetchPage(href: String): T {
//        return httpClient.get("$BASE_PATH/$href").body()
//    }




}
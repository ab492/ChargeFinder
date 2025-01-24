package com.brambly.chargefinder.api
import com.brambly.chargefinder.models.ChargingStationDetail
import com.brambly.chargefinder.models.ChargingStationListItem
import io.ktor.client.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.serialization.json.Json
import io.ktor.client.request.*
import io.ktor.client.call.*
import io.ktor.client.plugins.ClientRequestException
import io.ktor.client.plugins.ServerResponseException
import io.ktor.client.plugins.defaultRequest
import io.ktor.http.URLProtocol
import io.ktor.utils.io.errors.IOException
import kotlin.coroutines.cancellation.CancellationException


class ChargeFinderBffImpl: ChargeFinderBff {
    private val BASE_PATH = "/pages"

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

    @Throws(ApiException::class, CancellationException::class)
    override suspend fun fetchHome(): List<ChargingStationListItem> {
        try {
            return httpClient.get("$BASE_PATH/home").body()
        } catch (e: CancellationException) {
            throw e
        } catch (e: Exception) {
            throw handleException(e)
        }
    }

    @Throws(ApiException::class, CancellationException::class)
    override suspend fun fetchDetail(id: String): ChargingStationDetail {
        try {
            return httpClient.get("$BASE_PATH/chargingStationDetail/$id").body()
        } catch (e: CancellationException) {
            throw e
        } catch (e: Exception) {
            throw handleException(e)
        }
    }

    private fun handleException(exception: Exception): Exception {
        return when (exception) {
            is ClientRequestException -> ApiException("Client error: ${exception.response.status}", exception)
            is ServerResponseException -> ApiException("Server error: ${exception.response.status}", exception)
            is IOException -> ApiException("Network error: ${exception.message}", exception)
            else -> ApiException("Unexpected error: ${exception.message}", exception)
        }
    }
}
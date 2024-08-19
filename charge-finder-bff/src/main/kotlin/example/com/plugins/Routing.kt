package example.com.plugins

import example.com.model.bff.charging_station_detail.ChargingStationDetail
import example.com.model.bff.homepage.HomeItem
import example.com.model.bff.page.Page
import example.com.model.Data.ChargingStationRepository
import example.com.model.bff.navigation.*
import example.com.model.bff.page.PageType
import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.auth.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Application.configureRouting() {
    val chargingStationDetailRoute = "/chargingStationDetail"

    routing {
        authenticate("auth-bearer") {
            route("/pages") {
                get {
                    val page = listOf(Page(name = "Home", slug = "home", pageType = PageType.LIST))
                    call.respond(page)
                }

                get("/home") {
                    val chargingStations = ChargingStationRepository.allStations()
                    val homeItems = chargingStations.map {
                        val detailHref = "$chargingStationDetailRoute/${it.id}"

                        HomeItem(
                            chargingStation = it,
                            action = Action.NavigateTo(
                                NavigationDestination.ChargingStationDetail(href = detailHref)
                            )
                        )
                    }
                    call.respond(homeItems)
                }

                get("$chargingStationDetailRoute/{id}") {
                    val idAsText = call.parameters["id"]
                    if (idAsText == null) {
                        call.respond(HttpStatusCode.BadRequest, "Missing or invalid ID parameter")
                        return@get
                    }

                    try {
                        val location = ChargingStationRepository.stationById(id = idAsText)
                        if (location == null) {
                            call.respond(HttpStatusCode.NotFound, "Charging station not found")
                            return@get
                        }

                        val chargingStationDetail = ChargingStationDetail(location)
                        call.respond(chargingStationDetail)

                    } catch(ex: IllegalArgumentException) {
                        call.respond(HttpStatusCode.BadRequest, "Invalid ID format")
                    }
                }
            }
        }
    }
}

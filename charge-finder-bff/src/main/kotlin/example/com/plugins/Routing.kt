package example.com.plugins

import example.com.model.*
import example.com.model.BFF.ChargingStationDetail.ChargingStationDetail
import example.com.model.BFF.HomePage.HomeItem
import example.com.model.BFF.Page
import example.com.model.Data.ChargingStationRepository
import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Application.configureRouting() {
    routing {

        route("/pages") {
            get {
                val page = listOf(Page(name = "Home", slug = "home"))
                call.respond(page)
            }

            get("/home") {
                val chargingStations = ChargingStationRepository.allStations()
                val homeItems = chargingStations.map { HomeItem(it) }
                call.respond(homeItems)
            }

            get("/chargingStationDetail/{id}") {
                val idAsText = call.parameters["id"]
                if (idAsText == null) {
                    call.respond(HttpStatusCode.BadRequest)
                    return@get
                }

                try {
                    val location = ChargingStationRepository.stationById(id = idAsText)
                    if (location == null) {
                        call.respond(HttpStatusCode.NotFound)
                        return@get
                    }

                    val chargingStationDetail = ChargingStationDetail(location)
                    call.respond(chargingStationDetail)

                } catch(ex: IllegalArgumentException) {
                    call.respond(HttpStatusCode.BadRequest)
                }
            }
        }
    }
}

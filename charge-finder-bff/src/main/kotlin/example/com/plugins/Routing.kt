package example.com.plugins

import example.com.model.*
import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Application.configureRouting() {
    routing {

        route("/pages") {
            get {
                val feature = Page(name = "Home", slug = "home")
                val featureText = "Name: ${feature.name}, Slug: ${feature.slug}"
                call.respondText(featureText)
            }

            get("/home") {
                val chargingStations = ChargingStationRepository.allStations()
                val homeItems = chargingStations.toHomeItems()

                call.respondText(
                    contentType = ContentType.parse("text/html"),
                    text = homeItems.tasksAsTable()
                )
            }
        }

        get("/locations/{id}") {
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

                call.respondText(
                    contentType = ContentType.parse("text/html"),
                    text = "Hello"
                    )
            } catch(ex: IllegalArgumentException) {
                call.respond(HttpStatusCode.BadRequest)
            }

            // TODO LEFT OFF HERE: NEED TO REPLACE HELLO WITH PROPER RESULT! 
        }
    }
}

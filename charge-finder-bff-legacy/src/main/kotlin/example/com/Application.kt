package example.com

import example.com.plugins.configureRouting
import example.com.plugins.configureSerialization
import example.com.plugins.*
import io.ktor.server.application.*

fun main(args: Array<String>) {
    io.ktor.server.netty.EngineMain.main(args)
}

fun Application.module() {
    configureAuthentication()
    configureSerialization()
    configureRouting()
}

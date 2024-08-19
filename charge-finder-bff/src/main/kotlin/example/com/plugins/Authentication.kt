package example.com.plugins

import io.ktor.server.application.*
import io.ktor.server.auth.*

fun Application.configureAuthentication() {
    install(Authentication) {
        bearer("auth-bearer") {
            authenticate { tokenCredential ->
                if (tokenCredential.token == "abc123") {
                    UserIdPrincipal("jetbrains")
                } else {
                    null
                }
            }
        }
    }
}
package com.brambly.chargefinder

import platform.UIKit.UIDevice

class IOSPlatform: Platform {
    override val name: String = "HELLOOOOOOO"
}

actual fun getPlatform(): Platform = IOSPlatform()
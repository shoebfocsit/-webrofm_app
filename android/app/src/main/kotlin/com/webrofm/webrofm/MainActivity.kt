package com.webrofm.webrofm

import com.ryanheise.audioservice.AudioServiceActivity

class MainActivity : AudioServiceActivity() {
    // The engine is created and managed by AudioServicePlugin, so it must not
    // be destroyed when the Activity is. Keeping the engine alive lets the app
    // resume exactly where the user left off after minimize/reopen.
    override fun shouldDestroyEngineWithHost(): Boolean = false
}
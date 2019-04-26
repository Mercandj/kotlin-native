package com.mercandalli.sdk.native

import com.mercandalli.sdk.native.math.MathManager
import com.mercandalli.sdk.native.math.MathManagerImpl

object NativeGraph {

    private val mathManagerInternal by lazy { createMathManager() }

    fun getMathManager() = mathManagerInternal

    private fun createMathManager(): MathManager {
        return MathManagerImpl()
    }
}

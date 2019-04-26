package com.mercandalli.sdk.native.math

interface MathManager {

    fun sumVector(
        vector1: FloatArray,
        vector2: FloatArray,
        outputVector: FloatArray,
        safe: Boolean = true
    )
}

package com.mercandalli.sdk.native.math

class MathManagerImpl : MathManager {

    override fun sumVector(
        vector1: FloatArray,
        vector2: FloatArray,
        outputVector: FloatArray,
        safe: Boolean
    ) {
        if (safe) {
            if (vector1.size != vector2.size) {
                throw Exception("Vector input should have same size")
            }
            if (vector1.size != outputVector.size) {
                throw Exception("Vector input should have same size")
            }
        }
        for (i in 0 until outputVector.size) {
            outputVector[i] = vector1[i] + vector2[i]
        }
    }
}

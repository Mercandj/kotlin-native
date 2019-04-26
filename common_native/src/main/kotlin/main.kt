import com.mercandalli.sdk.native.NativeGraph

import kotlin.system.measureNanoTime

fun main(args: Array<String>) {
    val argsString = args.joinToString(",")
    val benchmarkIterations = if (args.isEmpty()) {
        1
    } else {
        args[0].toInt()
    }
    println("Args: $argsString")
    sumVectorBenchmark(benchmarkIterations)
    println("End")
}

private fun sumVectorBenchmark(
    benchmarkIterations: Int = 1,
    vectorSize: Int = 5_000
) {
    val mathManager = NativeGraph.getMathManager()
    val op1List = ArrayList<Float>()
    val op2List = ArrayList<Float>()
    for (i in 0 until vectorSize) {
        op1List.add(i.toFloat())
        op2List.add(i.toFloat())
    }
    val op1 = op1List.toFloatArray()
    val op2 = op2List.toFloatArray()
    val result = FloatArray(vectorSize)

    var totalTime = 0L
    for (i in 0 until benchmarkIterations) {
        totalTime += measureNanoTime {
            mathManager.sumVector(
                op1,
                op2,
                result
            )
        }
    }
    val timeMs = ((totalTime.toFloat() / benchmarkIterations.toFloat())).toInt() / 1000
    println(
        "sumVectorBenchmark(benchmarkIterations:$benchmarkIterations,vectorSize:$vectorSize) -> time: $timeMs ms"
    )

}

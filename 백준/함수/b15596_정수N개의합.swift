func solve(a: [Int]) -> Int {
    var sum = 0
    a.forEach {sum+=$0}
    return sum
}
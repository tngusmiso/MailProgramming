func solution(_ m: Int, _ n: Int, _ puddles: [[Int]]) -> Int {
    var storage = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    
    func shortPath(_ i: Int, _ j: Int) -> Int {
        // 물에 잠긴 곳
        if puddles.contains([j, i]) {
            return 0
        }
        // 저장된 값이 있음
        if storage[i-1][j-1] != 0 {
            return storage[i-1][j-1]
        }
        // 출발지
        if (i-1, j-1) == (0, 0) {
            storage[i-1][j-1] = 1
            return 1
        }
        // 위에서 올 수 있음
        if i > 1 {
            storage[i-1][j-1] = storage[i-1][j-1] + shortPath(i-1, j)
        }
        // 왼쪽에서 올 수 있음
        if j > 1 {
            storage[i-1][j-1] = storage[i-1][j-1] + shortPath(i, j-1)
        }
        return storage[i-1][j-1]
    }

    return shortPath(n,m) % 1000000007
}
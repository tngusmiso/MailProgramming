func solution(_ triangle: [[Int]]) -> Int {
    
    // 저장할 공간은 -1로 채워 넣는다.
    var storage = [[Int]]()
    for i in 0..<triangle.count {
        storage.append([Int](repeating: -1, count: i+1))
    }

    func maxPath(_ i: Int,_ j: Int) {
        // 이미 계산된 값이 있으면 바로 반환한다.
        if storage[i][j] != -1 {
            return storage[i][j]
        }

        // (0,0)은 자기 자신 반환
        if i == 0 {
            storage[i][j] = triangle[0][0]
            return storage[i][j]
        }

        // j == 0 이면 왼쪽 대각선 위로부터는 올 수 없음
        if j == 0 {
            storage[i][j] = maxPath(i-1, j) + triangle[i][j]
            return storage[i][j]
        }

        // i-1 < j 이면 바로 위로부터는 올 수 없음
        if i-1 < j {
            storage[i][j] = maxPath(i-1, j-1) + triangle[i][j]
            return storage[i][j]
        }

        if maxPath(i-1,j-1) < maxPath(i-1, j) {
            storage[i][j] = maxPath(i-1, j) + triangle[i][j]
        } else {
            storage[i][j] = maxPath(i-1, j-1) + triangle[i][j]
        }
        return storage[i][j]
    
    for i in range(len(triangle)) {
        maxPath(len(triangle)-1, i)
    }

    return storage[triangle.count-1].max()!
}
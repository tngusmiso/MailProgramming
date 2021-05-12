import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    let board: [[Int]] = makeBoard(n: n, costs: costs)
    var visited: Set<Int> = []
    var sum: Int = 0
    
    func choose(_ island: Int) {
        visited.insert(island)
        if visited.count == n {
            return
        }
        
        var cost: Int = Int.max
        var next: Int = -1
        for v in visited {
            for i in 0..<n {
                if visited.contains(i) || board[v][i] == -1 { continue }
                if cost > board[v][i] {
                    cost = board[v][i]
                    next = i
                }
            }
        }
        
        choose(next)
        sum += cost
    }
    
    choose(0)
    return sum
}

func makeBoard(n: Int, costs: [[Int]]) -> [[Int]] {
    var board = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)
    
    for row in costs {
        let cost = row[2]
        board[row[0]][row[1]] = cost
        board[row[1]][row[0]] = cost
    }
    
    return board
}
import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var top = Array(repeating: -1, count: board.count)
    var basket:[Int] = []
    var count = 0
    for move in moves {
        
        // 꼭대기 정보가 없으면 찾는다
        if top[move-1] == -1 {
            for row in 0..<board.count {
                if board[row][move-1] != 0 {
                    top[move-1] = row
                    break
                }
            }
        }
        
        // 해당 칸에 인형이 하나도 없으면 다음 칸
        if top[move-1] >= board.count {continue}
        
        let doll = board[top[move-1]][move-1]
        if basket.last == doll { 
            // 같은 인형이 연속이면 터뜨리고 count 증가
            basket.removeLast()
            count += 2
        } else { 
            // 다른 인형이면 바구니에 인형을 쌓는다
            basket.append(doll)
        }
        
        // 꼭대기 정보를 갱신한다
        top[move-1] += 1
    }
    return count
}
import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited: Set<Int> = []
    var count: Int = 1
    
    func dfs(_ i: Int, network: [Int]){
        var stack: [Int] = network
        visited.insert(i)
        
        for j in 0..<n {
            // i==j 이거나, j를 이미 방문한 경우 무시
            if i==j || visited.contains(j) { continue }
            // i와 j가 연결되어 있는 경우, network에 추가
            if computers[i][j] == 1 {
                stack.append(j)
            }
        }
        
        if let next = stack.popLast() {
            dfs(next, network: stack)
        }
    }
    
    dfs(0, network:[])
    while visited.count < n {
        count += 1
        for k in 0..<n {
            if !visited.contains(k) {
                dfs(k, network:[])
                break
            }
        }
    }
    
    return count
}
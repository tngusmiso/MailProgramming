import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var airports: [String:[String]] = [:]
    
    // 모든 경로를 저장
    for ticket in tickets {
        let origin = ticket[0]
        let destination = ticket[1]
        if airports[origin] != nil {
            airports[origin]!.append(destination)
        } else {
            airports[origin] = [destination]
        }
    }
    
    var path: [[String]] = []
    func dfs(now: String, usable: [[String]], nowPath: [String]) -> [String] {

        // 모든 티켓을 사용했으면
        if usable.isEmpty {
            return nowPath
        }
        
        // 더이상 갈 수 있는 곳이 없으면
        guard let nextAirports = airports[now] else {
            return []
        }
        
        // 다음 경로 탐색
        for next in nextAirports.sorted() {
            // 이미 사용한 티켓은 방문하지 않음
            guard usable.contains([now, next]) else {
                continue
            }
            
            guard let index = usable.firstIndex(of: [now, next]) else {
                continue
            }
            var tickets = usable
            tickets.remove(at: index)
            
            // 최종 목적지로 도달할 수 없는 경로라면
            let nextPath = dfs(now: next, usable: tickets, nowPath: nowPath+[next])
            if nextPath == [] {
                continue
            }
            return nextPath
        }
        
        return []
    }
    
    let answer = dfs(now: "ICN", usable: tickets, nowPath: ["ICN"])
    return answer
}
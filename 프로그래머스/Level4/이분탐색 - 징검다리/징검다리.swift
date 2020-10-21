import Foundation

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    let rocks = rocks.sorted()
    var answer = 1
    var start = 1
    var end = distance
    
    while(start <= end) {
        // 몇개의 바위를 제거해야 mid가 최솟값이 될 수 있는지 알아보자
        let mid = (start+end)/2
        var indicator = 0
        var removeCnt = 0
        
        // 바위 사이 거리가 mid보다 작은 것은 모조리 지워버리자!
        for rock in rocks {
            // 앞바위(기준바위) - 현재바위 거리
            if rock-indicator < mid {
                // 거리가 mid보다 짧으면 안되니까 지우자!
                // CNT 1 증가
                removeCnt += 1
            } else {
                // 거리가 mid보다 멀거나 같으면 그냥 두자! 
                // 기준 바위를 현재 바위로 업데이트
                indicator = rock
            }
            if removeCnt > n {
                end = mid - 1
                break
            }
        }
        
        if distance - indicator < mid {
            removeCnt += 1
        }
        
        if removeCnt <= n {
            // mid보다 거리가 짧아서 지운 개수가 n보다 작으면 뒷 부분 탐색
            answer = mid
            start = mid + 1
        } else {
            // mid보다 거리가 짧아서 지운 개수가 n보다 크면 앞 부분 탐색
            end = mid - 1
        }
    }
    
    return answer
}
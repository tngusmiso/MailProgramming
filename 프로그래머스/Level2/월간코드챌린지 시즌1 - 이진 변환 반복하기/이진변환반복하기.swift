import Foundation

func solution(_ s:String) -> [Int] {
    var answer = [0,0]
    var x = s
    while x != "1" {
        var zeroCount = 0
        for n in x { 
            if n == "0" { 
                zeroCount += 1
            }
        }
        x = String(x.count - zeroCount, radix: 2)
        answer[0] += 1
        answer[1] += zeroCount
    }
    return answer
}
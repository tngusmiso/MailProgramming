import Foundation

func solution(_ operations:[String]) -> [Int] {
    var dpQueue: [Int] = [] // double priority queue
    for operation in operations {
        if operation == "D 1" {
            // 최대값 삭제
            dpQueue.popLast()
        }
        if operation == "D -1" {
            // 최소값 삭제
            if !dpQueue.isEmpty {
                dpQueue.removeFirst()
            }
        }
        
        let elements = operation.split(separator: " ")
        if elements[0] == "I" {
            guard let number = Int(elements[1]) else { continue }
            // 값 삽입 (이진삽입)
            var start = 0
            var end = dpQueue.count

            while start < end {
                let mid = (start + end) / 2
                if dpQueue[mid] == number {
                    start = mid
                    break
                }
                if dpQueue[mid] < number {
                    start = mid + 1
                } else {
                    end = mid
                }
            }
            dpQueue.insert(number, at: start)
        }
    }
    
    if dpQueue.isEmpty { return [0, 0]}
    return [dpQueue[dpQueue.count-1], dpQueue[0]]
}
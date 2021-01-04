import Foundation

func solution(_ n:Int) -> [Int] {
    
    let arrayLength: Int = n * (n+1) / 2
    var answer: [Int] = [Int](repeating: 0, count: arrayLength)
    var number = 1
    
    func goDown(count: Int) {
        var index: Int = 2 * count * (count + 1)
        let total: Int = n-3*count
        let gap: Int = 2 * count + 1
        
        for i in 0..<total {
            answer[index] = number
            index += (gap + i)
            number += 1
        }
        // print("DOWN: \(answer)")
    }
    
    func goRight(count: Int) {
        let index: Int = (n - count - 1) * (n - count) / 2 + count + 1
        let total: Int = n - (3 * count) - 1
        
        for i in 0..<total {
            answer[index + i] = number
            number += 1
        }
        // print("RIGHT: \(answer)")
    }
    
    func goUp(count: Int) {
        var index: Int = (n - count - 2) * (n - count - 1) / 2 + (n - 2 * count - 2)
        let total: Int = n - (3 * count) - 2 
        let gap = n-count-1
        
        for i in 0..<total {
            answer[index] = number
            index -= (gap - i)
            number += 1
        }
        // print("UP: \(answer)")
    }
    
    // 한 변 진행
    for direction in 0..<n {
        if direction%3 == 0 { 
            goDown(count: direction/3) 
        } else if direction%3 == 1 {
            goRight(count: direction/3) 
        } else { 
            goUp(count: direction/3) 
        }
    }
    // print(answer)
    
    return answer
}
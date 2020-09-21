import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let patterns = [[1,2,3,4,5], [2,1,2,3,2,4,2,5], [3,3,1,1,2,2,4,4,5,5]]
    var corrects = [0,0,0]
   
    for i in 0..<answers.count {
        for j in 0..<3 {
            let pattern = patterns[j]
            if pattern[i%pattern.count] == answers[i] {
                corrects[j] += 1
            }
        }
    }
    
    let max = corrects.max()
    var answer = [Int]()
    for k in 0..<3 {
        if corrects[k] == max {
            answer.append(k+1)
        }
    }
    return answer
}
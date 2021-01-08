import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
  var feature = progresses
  var speed = speeds
  var answer: [Int] = []
  
  repeat {
    var count = 0
    
    for idx in 0..<feature.count {
      feature[idx] += speed[idx]
    }

    repeat {
      if feature[0] >= 100 {
        feature.removeFirst()
        speed.removeFirst()
        count += 1
      } else {
        break
      }
    } while !feature.isEmpty
    
    if count > 0 {
      answer.append(count)
    }
  } while !feature.isEmpty
    
  return answer
}
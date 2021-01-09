import Foundation

func solution(_ number: String, _ k:Int) -> String {
    var numArr: [Character] = number.map { $0 }
    var count: Int = 0
    var noMore: Bool = true
    
    while count < k {
        noMore = true
        for i in 0..<numArr.count-1 {
            if numArr[i] < numArr[i+1] { // 앞 숫자가 뒷 숫자보다 작다면 삭제
                numArr.remove(at:i)
                count += 1
                noMore = false
                break
            }
        }
        
        if noMore {
            for _ in 0..<k-count {
                numArr.removeLast()
            }
            break
        }
    }
    
    let answer = numArr.reduce(""){"\($0)\($1)"}
    return answer
}

// Stack을 이용한 방법 (*수정 필요*)
func solution2(_ number: String, _ k:Int) -> String {
    var numArr: [Character] = number.map { $0 }
    var stack: [Character] = []
    var count: Int = 0
    var i: Int = 0
    
    while count < k && i < numArr.count {
        guard let last = stack.last else {
            stack.append(numArr[i])
            i += 1
            continue
        }
        if last < numArr[i] {
            stack.removeLast()
            count += 1
            continue
        }
        stack.append(numArr[i])
        i += 1
    }
    
    if i < numArr.count {
        stack.append(contentsOf: numArr[i...])
    }
    
    let answer = stack.reduce(""){"\($0)\($1)"}
    return answer
}
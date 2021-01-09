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

// Stack을 이용한 방법
func solution2(_ number: String, _ k:Int) -> String {
    var numArr: [Character] = number.map { $0 }
    var stack: [Character] = []
    var delete: Int = 0
    var i: Int = 0
    
    while delete < k && i < numArr.count {
        // 스택이 비어있으면 
        // 현재 인덱스의 숫자를 넣는다. (i 증가)
        guard let last = stack.last else {
            stack.append(numArr[i])
            i += 1
            continue
        }
        
        // 스택의 마지막 숫자보다 현재 인덱스의 숫자가 크면
        // 스택의 마지막 숫자를 꺼내고 현재 인덱스의 숫자를 넣는다.
        if last < numArr[i] {
            stack.removeLast()
            delete += 1
            continue
        }
        
        // 스택에 현재 인덱스의 숫자를 넣는다.(i 증가)
        stack.append(numArr[i])
        i += 1
    }
    
    // k개의 숫자를 제거 완료한 경우
    // 아직 탐색 못한 숫자들까지 합친다.
    if delete >= k {
        stack.append(contentsOf: numArr[i...])
    }
    
    // 인덱스를 끝까지 탐색했는데도 k개 제거하지 못했을 경우
    // 뒤에서부터 k개는 제거한다
    if i >= numArr.count {
        return stack[0..<numArr.count-k].reduce(""){"\($0)\($1)"}
    }
    
    return stack.reduce(""){"\($0)\($1)"}
}
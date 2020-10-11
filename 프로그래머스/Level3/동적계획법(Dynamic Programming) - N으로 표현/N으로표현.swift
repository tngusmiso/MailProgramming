import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    
    if N == number {return 1}
    
    var expressions = [Int:[Int]]()
    var usecount = [Int:Int]()
    expressions[1] = [N]   // 5를 1개 사용하여 표현 가능한 숫자: 5
    usecount[N] = 1   // 5를 표현하는 데에 필요한 숫자: 1개
    
    func expressable(_ num: Int, use count: Int) {
        guard usecount[num] == nil else {return}
        guard 0 < num && num <= 32000 else {return}

        expressions[count]?.append(num)
        usecount[num] = count
    }
    
    for count in 2...8 {
        expressions[count] = [Int]()
        
        // N을 count번 반복
        if makeRepeating(N, count: count) == number { return count }
        expressable(makeRepeating(N, count: count), use: count)
        
        for i in 1..<count {
            guard let numbers1 = expressions[i], let numbers2 = expressions[count-i] else {
                continue
            }
            
            for op1 in numbers1 {
                for op2 in numbers2 {
                    if op1/op2==number||op1-op2==number||op1+op2==number||op1*op2==number {
                        return count
                    }
                    expressable(op1/op2, use: count)
                    expressable(op1-op2, use: count)
                    expressable(op1+op2, use: count)
                    expressable(op1*op2, use: count)
                }
            }
        }
    }
    return -1
}

func makeRepeating(_ num: Int, count: Int) -> Int {
    var result = 0
    for _ in 0..<count {
        result = result*10 + num
    }
    return result
}
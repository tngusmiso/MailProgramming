import Foundation

func solution(_ numbers: String) -> Int {
    let combinations = comb(digit: numbers.count, numbers: numbers.seperate()).compactMap { 
        return Int($0)
    }
    let answer = primeCount(Set(combinations))
    return answer
}

func comb(digit: Int, numbers: [String]) -> Set<String> {
    if digit == 1 { return Set(numbers) }
    if digit < 1 { return [] }
    
    var answer: Set<String> = []
    for i in 0..<numbers.count {
        let num = numbers[i]
        var subNumbers: [String] = numbers
        subNumbers.remove(at: i)
        
        let subComb = comb(digit: digit-1, numbers: subNumbers)
        let subArray = subComb.compactMap{ num + $0 }
        answer = answer.union(subComb)
        answer = answer.union(Set(subArray))
    }
    
    return answer
}

func primeCount(_ numbers: Set<Int>) -> Int {
    var primes = [Int]()
    var count = 0
    
    // 가장 큰 수의 제곱근까지 모든 소수를 구한다.
    let max = numbers.max() ?? 0
    for i in 2...max.sqrtUp() {
        var isPrime = true
        for prime in primes {
            if i % prime == 0 {
                isPrime = false
                break
            } 
        }
        if !isPrime { continue }
        primes.append(i)
    }
    
    // num의 제곱근 보다 작은 모든 소수로 나누어 떨어지지 않는 수는 소수이다.
    for num in numbers {
        if num < 2 {continue}
        var isPrime = true
        for prime in primes {
            if num.sqrtUp() > prime && num % prime == 0 {
                isPrime = false
                break
            } 
        }
        if isPrime { count += 1 }
    }
    
    return count
}

extension String {
    func seperate() -> [String] {
        let array = self.compactMap{ String($0) }
        return array
    }
}

extension Int {
    func sqrtUp() -> Int {
        let root = sqrt(Double(self))
        return Int(root)+1
    }
}
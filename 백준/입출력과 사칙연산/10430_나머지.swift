if let line = readLine() {
    let elements = line.split(separator: " ").compactMap{Int($0)}
    if elements.count == 3 {
        let a = elements[0]
        let b = elements[1]
        let c = elements[2]
        // 첫째 줄에 (A+B)%C, 둘째 줄에 ((A%C) + (B%C))%C, 
        // 셋째 줄에 (A×B)%C, 넷째 줄에 ((A%C) × (B%C))%C를 출력한다.
        
        print((a + b) % c)
        print(((a % c) + (b % c)) % c)
        print((a * b) % c)
        print(((a % c) * (b % c)) % c)
    }
}
if let input1 = readLine(), let input2 = readLine() {
    if let a = Int(input1), let b = Int(input2) {
        print(a*(b%10))
        print(a*((b%100 - b%10)/10))
        print(a*(b/100))
        print(a*b)
    }
}
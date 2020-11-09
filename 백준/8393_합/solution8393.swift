import Foundation

guard let line = readLine(), let n = Int(line) else {
    exit(-1)
}

var sum = 0
for i in 1...n {
    sum += i
}

print(sum)
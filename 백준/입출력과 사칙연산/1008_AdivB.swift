if let line = readLine() {
    let elements = line.split(separator: " ").compactMap{Double($0)}
    if elements.count == 2 {
        print(elements[0] / elements[1])
    }
}
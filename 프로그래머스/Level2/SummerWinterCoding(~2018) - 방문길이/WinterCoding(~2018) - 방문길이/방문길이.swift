import Foundation

func solution(_ dirs:String) -> Int {
    var verticalPath = [[Bool]](repeating: [Bool](repeating: false, count: 11), count: 10)
    var horizontalPath = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: 11)
    
    var xPos = 5
    var yPos = 5
    var count = 0
    for dir in dirs {
        if dir == "U" {
            if yPos <= 0 { continue }
            yPos -= 1
            if !verticalPath[yPos][xPos] {
                count += 1
                verticalPath[yPos][xPos] = true
            }
        } else if dir == "D" {
            if yPos >= 10 { continue }
            if !verticalPath[yPos][xPos] {
                count += 1
                verticalPath[yPos][xPos] = true
            }
            yPos += 1            
        } else if dir == "R" {
            if xPos >= 10 { continue }
            if !horizontalPath[yPos][xPos] {
                count += 1
                horizontalPath[yPos][xPos] = true
            }
            xPos += 1
        } else if dir == "L" {
            if xPos <= 0 { continue }
            xPos -= 1
            if !horizontalPath[yPos][xPos] {
                count += 1
                horizontalPath[yPos][xPos] = true
            }
        }
    }
    
    return count
}
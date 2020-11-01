func solution(_ a:Int, _ b:Int) -> String {
    let daysOfMonth = [31,29,31,30,31,30,31,31,30,31,30,31]
    let dayOfWeek = ["FRI","SAT","SUN","MON","TUE","WED","THU"]
    
    var totalDays = 0
    for month in 0..<a-1 {
        totalDays += daysOfMonth[month]
    }
    
    totalDays += b
    return dayOfWeek[(totalDays-1) % 7]
}
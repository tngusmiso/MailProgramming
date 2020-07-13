def solution(s):
    answer = []
    
    sList = s[2:-2].split("},{")
    sList.sort(key = len)
    
    for item in sList:
        numList = item.split(',')
        for num in numList:
            if int(num) not in answer:
                answer.append(int(num))
    
    return answer
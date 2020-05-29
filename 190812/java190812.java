import java.util.Set;
import java.util.HashSet;

public class java190812 {
    public static void main(String[] args) {
        int[] input1 = {1, 2, 4, 0, 3};
        int[] input2 = {1, 4, 5, 0, 3, 2};
        int[] input3 = {1, 2, 2, 0};

        System.out.println(solution(input1));
        System.out.println(solution(input2));
        System.out.println(solution(input3));
    }

    private static boolean solution(int[] array) {
        // 방문한 인덱스
        Set<Integer> visited = new HashSet<>();
        int index = 0;

        // 배열의 크기만큼 반복
        for(int i=0; i<array.length; i++){
            // 다음 인덱스
            index = array[index];
            
            // 인덱스가 0인데
            if(index == 0){
                // 전부 방문 못했을 경우 = false
                if(visited.size() < array.length-1) return false;
                // 전부 방문 했을 경우 = true
                return true;
            }

            // 인덱스가 이미 방문한 인덱스일 경우 = false
            if(visited.contains(index)) return false;

            // 방문한 인덱스에 추가 
            visited.add(index);
        }

        // 반복했는데도 리턴이 안됐으면 = false
        return false;
    }
}
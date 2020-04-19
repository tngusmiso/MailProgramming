import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class java190506 {

    public static void main(String[] args) {
        System.out.println(Arrays.toString(solution(new int[]{2, 5, 6, 1, 10}, 8))); //{0,2}
    }

    public static int[] solution(int[] arr, int target) {
        Map<Integer, Integer> map = new HashMap<>();

        for (int i = 0; i < arr.length; i++) {
            int complement = target - arr[i];
            if (map.containsKey(complement)) {
                return new int[]{map.get(complement), i};
            }
            map.put(arr[i], i);
        }
        return new int[]{-1, -1};
    }
}
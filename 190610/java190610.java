import java.util.Map;
import java.util.HashMap;

public class java190610 {
    public static void main(String[] args) {
        String input = "aabcbcbc";
        String input2 = "aaaaaaaa";
        String input3 = "aaaackkuakbcdabbaa";

        System.out.println(solution(input));
        System.out.println(solution(input2));
        System.out.println(solution(input3));
    }

    public static int solution(String input) {
        int max = 0;
        int startIdx = 0;
        Map<Character, Integer> charMap = new HashMap();
        for (int i = 0; i < input.length(); i++) {
            if (charMap.containsKey(input.charAt(i))) {
                startIdx = Math.max(charMap.get(input.charAt(i)), startIdx);
            }
            max = Math.max(max, (i - startIdx) + 1);
            charMap.put(input.charAt(i), i + 1); 
        }
        return max;
    }
}
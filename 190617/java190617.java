import java.util.Map;
import java.util.HashMap;

public class java190617 {
    public static void main(String[] args) {

        System.out.println(solution("EGG", "FOO"));
        System.out.println(solution("ABBCD", "APPLE"));
        System.out.println(solution("AAB", "FOO"));
    }

    public static boolean solution(String str1, String str2) {
        Map<Character, Character> keyMap = new HashMap<>();

        for(int i=0; i<str1.length(); ++i){
            char c1 = str1.charAt(i);
            char c2 = str2.charAt(i);

            if(keyMap.containsKey(c1) && keyMap.get(c1) != c2)
                return false;

            else if(keyMap.containsValue(c2))
                return false;
            
            keyMap.put(c1,c2);
        }
        return true;
    }
}
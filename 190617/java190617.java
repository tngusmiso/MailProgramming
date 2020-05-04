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
        Character c1, c2;

        for(int i=0; i<str1.length(); ++i){
            c1 = str1.charAt(i);
            c2 = str2.charAt(i);
            if(keyMap.containsKey(c1))
                if(keyMap.get(c1) != c2)
                    return false;

            keyMap.put(c1,c2);
        }
        return true;
    }
}
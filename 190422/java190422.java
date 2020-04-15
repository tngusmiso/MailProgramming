import java.util.List;
import java.util.ArrayList;

public class java190422 {
    
    public static void main(String[] args) {

        System.out.println(solution(1));    // ["()"]
        System.out.println(solution(2));    // ["(())", "()()"]
        System.out.println(solution(3));    // ["((()))", "(()())", "()(())", "(())()", "()()()"]

    }

    public static List<String> solution(int n) {
        List<String> answer = new ArrayList<>();
        recurse(answer, "", 0, 0, n);

        return answer;
    }

    public static void recurse(List<String> ans, String cur, int open, int close, int n){
        if (cur.length() == n * 2) {
            ans.add(cur);
            return;
        }
        if (open < n) {
            recurse(ans, cur + "(", open + 1, close, n);
        }
        if (close < open) {
            recurse(ans, cur + ")", open, close + 1, n);
        }
    }
}
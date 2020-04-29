public class java190520 {
    public static void main(String[] args) {
        System.out.println(solution("abc 123 apple"));
    }

    public static String solution(String input) {
        StringBuilder answer = new StringBuilder();
        String[] splited = input.split(" ");

        for (String s : splited){
            StringBuilder sb = new StringBuilder(s);
            answer.append(sb.reverse());
            answer.append(" ");
        }

        return answer.toString().trim();
    }
}
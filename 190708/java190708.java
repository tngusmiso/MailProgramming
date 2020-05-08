public class java190708 {
    public static void main(String[] args) {

        System.out.println(solution(new String[]{"apple", "apps", "ape"}));
        System.out.println(solution(new String[]{"hawaii", "happy"}));
        System.out.println(solution(new String[]{"dog", "dogs", "doge"}));
    }

    public static int solution(String[] input) {
        int shortestLen = Integer.MAX_VALUE;
        for(String str:input){
            shortestLen = Math.min(shortestLen, str.length());
        }

        for(int i=1; i<shortestLen+1; ++i){
            String prefix = input[0].substring(0,i);
            for(int j=1; j<input.length; ++j){
                if(!prefix.equals(input[j].substring(0,i))){
                    return i-1;
                }
            }
        }
        return shortestLen;
    }
}
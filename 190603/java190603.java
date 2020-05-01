import java.util.Arrays;

public class java190603 {
    public static void main(String[] args) {
        int[] input = {0, 5, 0, 3, -1};
        int[] input2 = {3, 0, 3};
        System.out.println(Arrays.toString(solution(input)));
        System.out.println(Arrays.toString(solution(input2)));
    }

    public static int[] solution(int[] input) {
        int lastIdx = 0;

        for(int i=0; i<input.length; ++i)
            if(input[i]!=0)
                input[lastIdx++] = input[i];

        for(int j=lastIdx; j<input.length; ++j)
            input[j] = 0;
        
        return input;
    }
}
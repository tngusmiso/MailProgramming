
public class java190819 {
    public static void main(String[] args) {
        int[] input1 = {1, 2, 3, 7, 10};
        int[] input2 = {-5, -3, 0, 1};
        int[] input3 = {1, 4, 5, 6, 8, 9};
        int[] input4 = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30};

        System.out.println(solution(input1, 7));    // true
        System.out.println(solution(input2, 0));    // true
        System.out.println(solution(input3, 10));   // false
        System.out.println(solution(input4, 1));   // true
    }

    private static boolean solution(int[] array, int num) {
        int start = 0;
        int end = array.length-1;
        int mid = (end+start)/2;

        while(start<=end) {
            System.out.println(array[mid]);
            
            if (num == array[mid] || num == array[start] || num == array[end])
                return true;

            start = start+1;
            end = end-1;
            if (num > array[mid]) start = mid + 1;
            else end = mid - 1;

            mid = (end+start)/2;
        }
        return false;
    }
}
import java.util.Arrays;

public class java190822 {
    public static void main(String[] args) {
        int[] input = {3,9,1,5,2,7,8};
        mergeSort(input);
        System.out.println(Arrays.toString(input));
    }

    static int[] mergeSort(int[] array) {
        mergeSort(array, 0, array.length-1);
        return new int[0];
    }

    static void mergeSort(int[] array, int start, int end){
        // 길이가 1이면 그냥 리턴
        if(start == end){
            return;
        }
        // 가운데를 기준으로 분할
        int mid = (start+end)/2;
        mergeSort(array, start, mid);
        mergeSort(array, mid+1, end);

        // 병합
        merge(array, start, mid, end);
    }
    static void merge(int[] array, int start, int mid, int end){
        int length = end - start + 1;
        int[] temp = new int[length];
        int pivot1 = start;
        int pivot2 = mid+1;
        int i = 0;

        while(pivot1 <= mid && pivot2 <= end){
            if(array[pivot1] < array[pivot2]){
                temp[i++] = array[pivot1++];
            } else {
                temp[i++] = array[pivot2++];
            }
        }
        while(pivot1 <= mid){
            temp[i++] = array[pivot1++];
        }
        while(pivot2 <= end){
            temp[i++] = array[pivot2++];
        }

        for(int j=0; j<temp.length; j++){
            array[start+j] = temp[j];
        }

    }
}
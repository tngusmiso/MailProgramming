public class java190715 {
    
    static class Node {
        int num;
        Node next;

        public Node(int num){
            this.num = num;
        }
        public Node(int num, Node next){
            this.num = num;
            this.next = next;
        }

        @Override
        public String toString() {
            String str = "" + this.num;
            if (this.next != null ) {
                str += " -> ";
                str += this.next.toString();
            }
            return str;
        }
    }

    public static void main(String[] args) {
        Node input1 = new Node(1, new Node(2, new Node(3, new Node(4, new Node(5)))));
        Node input2 = new Node(1, new Node(2, new Node(3)));
        Node input3 = new Node(1);

        System.out.println(solution(input1, 2));
        System.out.println(solution(input2, 3));
        System.out.println(solution(input3, 1));
    }

    public static Node solution(Node head, int n) {
        if (head == null)
            return null;

        Node first = head, second = head;

        for (int i = 0; i < n; i++) {
            first = first.next;
        }
        if (first == null) {
            head = head.next;
            return head;
        }
        while (first.next != null) {
            first = first.next;
            second = second.next;
        }
        second.next = second.next.next;
        return head;
    }   
}
public class java190805 {
    static class TreeNode{
        TreeNode left = null, right = null;
        int value;

        public TreeNode(int value){
            this.value = value;
        }
        public TreeNode(int value, TreeNode left, TreeNode right){
            this.value = value;
            this.left = left;
            this.right = right;
        }

        public void addChild(TreeNode left, TreeNode right){
            this.left = left;
            this.right = right;
        }
    }
    public static void main(String[] args) {
        TreeNode node1 = new TreeNode(1);
        TreeNode node2 = new TreeNode(2);
        TreeNode node3 = new TreeNode(3);
        TreeNode node4 = new TreeNode(4);
        TreeNode node5 = new TreeNode(5);
        TreeNode node6 = new TreeNode(6);
        TreeNode node7 = new TreeNode(7);

        node1.addChild(node2, node3);
        node2.addChild(node4, node5);
        node3.addChild(node6, node7);

        solution(node1);
    }

    private static TreeNode solution(TreeNode node) {

        TreeNode temp = node.left;
        node.left = node.right;
        node.right = temp;

        if (node.left != null) {
            solution(node.left);
        }
        if (node.right != null) {
            solution(node.right);
        }

        return node;
    }
}
class Solution:
    it=0
    def helper(self,preorder,inorder,st,end):
        if st>end:
            return None
        if self.it >= len(preorder):
            return None
        temp = TreeNode(preorder[self.it])
        x = inorder.index(preorder[self.it])
        self.it+=1
        temp.left = self.helper(preorder,inorder,st,x-1)
        temp.right = self.helper(preorder,inorder,x+1,end)
        return temp
        
    def bstFromPreorder(self, preorder: List[int]) -> Optional[TreeNode]:
        inorder = preorder.copy()
        inorder.sort()
        return self.helper(preorder,inorder,0,len(preorder)-1)
        


class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None


def areIdentical(root1, root2):

    if root1 is None and root2 is None:
        return True
    if root1 is None or root2 is None:
        return False

    return (root1.data == root2.data and
            areIdentical(root1.left, root2.left) and
            areIdentical(root1.right, root2.right)
            )


def isSubtree(Tree1, Tree2):

    if Tree2 is None:
        return True

    if Tree1 is None:
        return False

    if (areIdentical(Tree1, Tree2)):
        return True

    return isSubtree(Tree1.left, Tree2) or isSubtree(Tree1.right, Tree2)


Tree1 = Node(26)
Tree1.right = Node(3)
Tree1.right.right = Node(3)
Tree1.left = Node(10)
Tree1.left.left = Node(4)
Tree1.left.left.right = Node(30)
Tree1.left.right = Node(6)

Tree2 = Node(10)
Tree2.right = Node(6)
Tree2.left = Node(4)
Tree2.left.right = Node(30)

if isSubtree(Tree1, Tree1):
    print("Tree 2 is subtree of Tree 1")
else:
    print("Tree 2 is not a subtree of Tree 1")

import UIKit

class BinaryNode<Element> {
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?

    init(_ value: Element) {
        self.value = value
    }
}

/*
             10
           /    \
          9      2
         / \    / \
        1   3   4  6
 */

extension BinaryNode {

    func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }

    func traverseInOder(visit: (Element) -> Void) {
        leftChild?.traverseInOder(visit: visit)
        visit(value)
        rightChild?.traverseInOder(visit: visit)
    }

    func preOrderTraversal(visit: (Element) -> Void) {
        visit(value)
        leftChild?.preOrderTraversal(visit: visit)
        rightChild?.preOrderTraversal(visit: visit)

    }

}

let ten = BinaryNode(10)
let nine = BinaryNode(9)
let one = BinaryNode(1)
let three = BinaryNode(3)
let two = BinaryNode(2)
let four = BinaryNode(4)
let six = BinaryNode(6)

ten.leftChild = nine
ten.rightChild = two

nine.leftChild = one
nine.rightChild = three

two.leftChild = four
two.rightChild = six

ten.traverseInOder { _ in
//    print($0)
}

ten.traversePostOrder { _ in
//    print($0)
}

ten.preOrderTraversal {
    print($0)
}

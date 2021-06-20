import UIKit

struct Queue<Element> {
    var elements: [Element] = []

    var isEmpty: Bool {
        return elements.isEmpty
    }

    @discardableResult
    mutating func enqueue(_ value: Element) -> Bool {
        elements.append(value)
        return true
    }

    mutating func dequeue() -> Element? {
        return isEmpty ? nil : elements.removeFirst()
    }
}


class TreeNode<Element> {
    var value: Element
    var children: [TreeNode<Element>] = []

    init(value: Element) {
        self.value = value
    }

    func add(value: TreeNode<Element>) {
        self.children.append(value)
    }
}

extension TreeNode where Element : Equatable {
    func forEachDepthFirst(_ visit: (_ node: TreeNode) -> Void) {
        visit(self)
        self.children.forEach {
            $0.forEachDepthFirst(visit)
        }
    }

    func forEachLevelOrder(_ visit: (_ node: TreeNode) -> Void) {

        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach {
            queue.enqueue($0)
        }

        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }

    func search(_ value: Element) -> TreeNode? {
        var result: TreeNode?

        self.forEachLevelOrder {
            if $0.value == value {
                result = $0
            }
        }

        return result
    }
}

let baverages = TreeNode<String>(value: "Baverages")

let hot = TreeNode<String>(value: "Hot")
let cold = TreeNode<String>(value: "Cold")

baverages.add(value: hot)
baverages.add(value: cold)

let tea = TreeNode(value: "Tea")
let coffee = TreeNode(value: "Coffee")

hot.add(value: tea)
hot.add(value: coffee)

let soda = TreeNode(value: "Soda")
let milk = TreeNode(value: "Milk")

cold.add(value: soda)
cold.add(value: milk)

print("Depth First Traversal")
baverages.forEachDepthFirst { node in
    print(node.value)
}

/*

               Baverages
              /         \
             /           \
           Hot          cold
           / \           / \
          /   \         /   \
        tea  coffee   soda  milk
 */

print("Level Order Traversal")
baverages.forEachLevelOrder { node in
    print(node.value)
}

let searchResult = baverages.search("Soda")
print(searchResult?.value)

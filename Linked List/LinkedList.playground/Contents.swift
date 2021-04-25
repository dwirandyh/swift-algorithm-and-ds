import UIKit

struct LinkedList<Value> {

    var head: Node<Value>?
    var tail: Node<Value>?

    var isEmpty: Bool {
        return head == nil
    }

    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }

    func node(at index: Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head

        while (currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }

        return currentNode
    }

    mutating func insert(value: Value, after node: Node<Value>) {
        node.next = Node(value: value, next: node.next)
    }

    mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }

        tail?.next = Node(value: value)
        tail = tail?.next
    }

    mutating func pop() -> Value? {
        let headValue = head?.value
        head = head?.next

        if isEmpty {
            tail = nil
        }

        return headValue
    }

    mutating func removeLast() -> Value? {
        guard let head = head else {
            return nil
        }

        guard head.next != nil else {
            return pop()
        }

        var prevNode = head
        var currentNode = head

        while let next = currentNode.next {
            prevNode = currentNode
            currentNode = next
        }

        prevNode.next = nil
        tail = prevNode
        return currentNode.value
    }

    mutating func remove(after node: Node<Value>) -> Value? {
        let value = node.next?.value
        if node.next === tail {
            tail = node
        }

        node.next = node.next?.next

        return value
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty List"
        }

        return String(describing: head)
    }
}

class Node<Value> {
    var value: Value
    var next: Node<Value>?

    init(value: Value, next: Node? = nil){
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }

        return "\(value) -> " + String(describing: next) + ""
    }
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

//print(node1)


var list = LinkedList<Int>()
list.push(1)
list.push(2)
list.push(3)

var list2 = LinkedList<Int>()
list2.append(1)
list2.append(2)
list2.append(3)
list2.append(4)

var middleNode = list2.node(at: 1)!
list2.remove(after: middleNode)

print(list2)

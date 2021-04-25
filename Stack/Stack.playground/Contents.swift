import UIKit

struct Stack<Element> {
    private var storage: [Element] = []

    mutating func push(_ element: Element) {
        storage.append(element)
    }

    mutating func pop() -> Element? {
        return storage.removeLast()
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "-----top------\n"
        let bottomDivider = "\n-----bottom-----"

        let stackElements = storage.map { "\($0)" }.reversed().joined(separator: "\n")

        return topDivider + stackElements + bottomDivider
    }
}

var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)

print("Before popping")
print(stack)

print("After popping")
stack.pop()

print(stack)

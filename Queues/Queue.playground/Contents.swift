import UIKit


struct Queue<Element> {
    var array: [Element] = []

    var isEmpty: Bool {
        return array.isEmpty
    }

    var peek: Element? {
        return array.first
    }

    mutating func enqueue(_ element: Element) -> Bool {
        array.append(element)
        return true
    }

    mutating func dequeue() -> Element? {
        return isEmpty ? nil : array.removeFirst()
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        return String(describing: array)
    }
}

var queue = Queue<Int>()
queue.enqueue(10)
queue.enqueue(2)
queue.enqueue(4)
queue.enqueue(45)

print(queue)

queue.dequeue()

print(queue)

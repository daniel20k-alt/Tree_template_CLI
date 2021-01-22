//
//  main.swift
//  Tree_template_CLI
//
//  Created by DDDD on 17/01/2021.
//

import Foundation
print("Hello, World!")


//extension Node: Equatable where Value: Equatable { }
//extension Node: Hashable where Value: Hashable { }
extension Node: Codable where Value: Codable { }

extension Node: Equatable where Value: Equatable {
    static func ==(lhs: Node, rhs: Node) -> Bool {
        lhs.value == rhs.value && lhs.children == rhs.children
    }
}

extension Node: Hashable where Value: Hashable {
    func  hash(into hasher: inout Hasher)  {
        hasher.combine(value)
        hasher.combine(children)
        
    }
}

final class Node<Value> {
    var value: Value
    private (set) var children: [Node]
    
    
  func add(child: Node) {
        children.append(child)
    }
    
    
    init(_ value: Value) {
        self.value = value
        children = [ ]
    }
    
    
    init(_ value: Value, children: [Node]) {
        self.value = value
        self.children = children
    }

    //calculating the total size of the tree
    
    var count: Int {
        1 + children.reduce(0) { $0 + $1.count }
    }


    @_functionBuilder
    struct NodeBuilder {
        static func buildBlock<Value>(_ children: Node<Value>...) -> [Node<Value>] {
            children
        }
    }

    init(_ value: Value, @NodeBuilder builder: () -> [Node]) {
        self.value = value
        self.children = builder()
    }
}

extension Node where Value: Equatable {
    func find (_ value: Value) -> Node? {
        if self.value == value {
            return self
        }

        for child in children {
            if let match = child.find(value) {
                return match
            }
        }

        return nil

    }
}


//creating nodes and model them

var andrei = Node("Andrei")
var alexei = Node("Alexei")
andrei.add(child: alexei)

var bianca = Node("Bianca")
var bogdan = Node("Bogdan")
var bucur = Node("Bucur")
bianca.add(child: bogdan)
bianca.add(child: bucur)

var root = Node("Cristi")
root.add(child: andrei)
root.add(child: bianca)

print(root)
print(andrei)


print(andrei == bianca)
print(andrei != bianca)
print(andrei == andrei)


print(root.count)
print(andrei.count)
print(bianca.count)


if let bianca = root.find("Bianca") {
    print(bianca.count)
}


let jonnie = Node("Jonnie") {
    Node("Alice") {
        Node("Jr. Jonnie")
        Node("Alisson")
    }
    
    Node("Barbara") {
        Node("Don")
    }
}

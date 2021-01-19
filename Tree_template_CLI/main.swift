//
//  main.swift
//  Tree_template_CLI
//
//  Created by DDDD on 17/01/2021.
//

import Foundation
print("Hello, World!")


extension Node: Equatable where Value: Equatable { }
extension Node: Hashable where Value: Hashable { }
extension Node: Codable where Value: Codable { }

struct Node<Value> {
    var value: Value
   private (set) var children: [Node]
    
    
    mutating func add(child: Node) {
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

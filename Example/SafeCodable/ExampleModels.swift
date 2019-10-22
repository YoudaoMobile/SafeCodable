//
//  ExampleModels.swift
//  SafeCodable_Example
//
//  Created by ximiao on 2019/9/12.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import SafeCodable

struct Person: SafeCodable {
    // sourcery: key = "my_name"
    var myName: String
    
    var boy: Bool
    
    var test: Bool?
    
//    // sourcery: default = false
//    var married: Bool
    
    // sourcery: default = []
    var array: [School]
    
//    // sourcery: skip
//    var ignored: Int = 2
}

struct School: SafeCodable {
    var name: String
    var desc: String?
}

//enum ConcreteType: SafeCodable {
//    case option1(String)
//    case option2(School)
//    case option3(String, School, Int)
//}
//
//class ClassModel: SafeCodable {
//    var data1: String
//    var data2: ConcreteType
//    
//    // sourcery:inline:ClassModel.SafeCodable
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        data1 = try container.decode(String.self, forKey: .data1)
//        data2 = try container.decode(ConcreteType.self, forKey: .data2)
//    }
//    // sourcery:end
//}

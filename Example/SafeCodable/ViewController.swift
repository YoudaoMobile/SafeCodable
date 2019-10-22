//
//  ViewController.swift
//  SafeCodable
//
//  Created by wudijimao on 09/12/2019.
//  Copyright (c) 2019 wudijimao. All rights reserved.
//

import UIKit
import SafeCodable



public class ABC: SafeDecodable {
    var a = 0;
}

extension Int: SafeCodable {}

extension Decodable where Self == Array<ABC> {
    public init(from decoder: Decoder) throws {
        self.init()
        print("aaa")
    }
}


//extension Array: SafeDecodable where Element: ABC {
//
//    public init(with str: String) {
//        self.init()
//    }
//
//  /// Creates a new array by decoding from the given decoder.
//  ///
//  /// This initializer throws an error if reading from the decoder fails, or
//  /// if the data read is corrupted or otherwise invalid.
//  ///
//  /// - Parameter decoder: The decoder to read data from.
//  public init(from decoder: Decoder) throws {
//    self.init()
//
//    var container = try decoder.unkeyedContainer()
//    while !container.isAtEnd {
//        guard let element = try? container.decode(Element.self) else {
//            assertionFailure("解析json，有数组元素解析失败)")
//            continue
//        }
//        self.append(element)
//    }
//  }
//
//    public func testIn() {
//
//    }
//}
//
//


class ViewController: UIViewController {
    
    let json = """
        {
        "myName": "LZephyr",
        "boy": true,
        "array": [{"name": "a", "desc": "desc1"},
                {"name": "b"},
                {"desc": "desc3"}]
        }
        """

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let decoder = JSONDecoder()
//        let data = array.data(using: .utf8)!
//        let array = try! decoder.decode(Array<Bool?>.self, from: data)
        let person = try! JSONDecoder().decode(Person.self, from: json.data(using: .utf8)!)
        print(person.array.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


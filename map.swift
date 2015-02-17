import Foundation


extension Array {
    func map<R>(fun: (T) -> R) -> [R]{
        var accumulation:[R] = [R]();

        for member in self {
            accumulation.append(fun(member))
        }

        return accumulation;
    }
}


-------- Tests --------------


import Foundation
import XCTest

extension String {

    var length: Int {return countElements(self)}

    func reverse() -> String {
        var result:String = ""
        for char in self {
            result = "\(char)\(result)"
        }
        return result
    }

}

class mapTest: XCTestCase {

    func test_empty_accumulation() {

        let input = [Int]([])
        let expected = []
        func square(input:Int) -> Int {
            return input * input
        }

        let result = input.map(square)

        XCTAssert(expected == result)
    }

    func test_map_squares() {

        let input = [1,2,3,4]
        let expected = [1,4,9,16]
        func square(input:Int) -> Int {
            return input * input
        }

        let result = input.map(square)

        XCTAssert(expected == result)
    }


    func test_map_upcases() {

        let input = ["hello","world"]
        let expected = ["HELLO","WORLD"]
        func toUpper(input:String) -> String {
            return input.uppercaseString
        }

        let result = input.map(toUpper)

        XCTAssert(expected == result)

    }


    func test_map_reversed_strings() {

        let input =    ["the","quick","brown","fox","etc"]
        let expected = ["eht","kciuq","nworb","xof","cte"]
        func reverse(input:String) -> String {
            return input.reverse()
        }

        let result = input.map(reverse)

        XCTAssert(expected == result)
    }

    func test_map_recursively() {

        let input =   ["a","b","c"]

        let expected = [
            ["a1","a2","a3"],
            ["b1","b2","b3"],
            ["c1","c2","c3"]
        ]

        func recurse(input:String) -> [String] {
            func appendTo(innerInput:String) -> String {
                return input+innerInput
            }
            let result = ["1","2","3"].map(appendTo)
            return result
        }


        let result = input.map(recurse)

        XCTAssert(expected == result)
    }
}

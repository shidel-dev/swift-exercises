import Foundation


class Hamming {
    class func compute(seq: String, against: String) -> Int? {
        if (countElements(seq) != countElements(against)){
            return nil;
        } else if (countElements(seq) == 0) {
            return 0;
        }

        let seqArray = Array(seq);
        let againstArray = Array(against);

        var diff : Int = 0;

        for i in 0...(seqArray.count - 1) {
            if (seqArray[i] != againstArray[i]){
                diff += 1;
            }
        }
        return diff;
    }
}


--------- TESTS -----------------

import XCTest

class hammingTests: XCTestCase {
    func testNoDifferenceBetweenEmptyStrands() {
        let result = Hamming.compute("", against: "")!
        let expected = 0
        XCTAssertEqual(expected, result)
    }

    func testNoDifferenceBetweenIdenticalStrands() {
        let result = Hamming.compute("GGACTGA", against:"GGACTGA")!
        let expected = 0
        XCTAssertEqual(expected,result)
    }

    func testCompleteHammingDistanceInSmallStrand() {
        let result = Hamming.compute("ACT", against: "GGA")!
        let expected = 3
        XCTAssertEqual(expected,result)
    }

    func testSmallHammingDistanceInMiddleSomewhere() {
        let result = Hamming.compute("GGACG", against:"GGTCG")!
        let expected = 1
        XCTAssertEqual(expected,result)
    }

    func testLargerDistance() {
        let result = Hamming.compute("ACCAGGG", against:"ACTATGG")!
        let expected = 2
        XCTAssertEqual(expected,result)
    }

    func testReturnsNilWhenOtherStrandLonger() {
        let result = Hamming.compute("AAACTAGGGG", against:"AGGCTAGCGGTAGGAC")
        let expected: Int? = nil
        XCTAssertNil(result, "Different length strands return nil")
    }

    func testReturnsNilWhenOriginalStrandLonger() {
        let result = Hamming.compute("GACTACGGACAGGGTAGGGAAT", against:"GACATCGCACACC")
        XCTAssertNil(result, "Different length strands return nil")
    }
}


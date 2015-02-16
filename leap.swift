import Foundation


class Year {
    var isLeapYear:Bool = false;

    func calculateLeapYear(year: Int) -> Bool {
        if (year % 4 != 0){
            return false
        } else if (year % 400 == 0) {
            return true
        } else if (year % 100 == 0) {
            return false
        } else {
            return true
        }
    }

    init(calendarYear: Int){
        isLeapYear = calculateLeapYear(calendarYear)
    }
}

--------------- TESTS ----------------

import XCTest

class LeapTest : XCTestCase {

    func testVanillaLeapYear() {
        let year = Year(calendarYear: 1996)
        XCTAssertTrue(year.isLeapYear)
    }

    func testAnyOldYear() {
        let year = Year(calendarYear: 1997)
        XCTAssertTrue(!year.isLeapYear)
    }

    func testCentury() {
        let year = Year(calendarYear: 1900)
        XCTAssertTrue(!year.isLeapYear)
    }

    func testExceptionalCentury() {
        let year = Year(calendarYear: 2400)
        XCTAssertTrue(year.isLeapYear)
    }

}



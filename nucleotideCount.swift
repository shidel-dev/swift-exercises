import Foundation

class DNA {
    var nucleotides: String;
    var nucleotideCounts: [String : Int] = [ "A": 0, "T" : 0, "C" : 0, "G" : 0 ];
    var isValid: Bool = true;

    class func withStrand(strand: String) -> DNA?{
        var dna = DNA(nucleotides: strand);
        if (!dna.isValid) { return nil };
        return dna;
    }

    init(nucleotides: String) {
        self.nucleotides = nucleotides;
        self.countNucleotides();
    }

    func countNucleotides(){
        for nucleotide in self.nucleotides {
            let key = String(nucleotide);
            var count : Int? = nucleotideCounts[key];
            if (count != nil){
                nucleotideCounts[key] = count! + 1;
            } else {
                self.isValid = false;
            }
        }
    }

    func count(nucleotide: String) -> Int? {
        return self.nucleotideCounts[nucleotide]!;
    }
}


------ Tests --------

import XCTest

class NucleotideCountTest: XCTestCase
{
    func testEmptyDNAStringHasNoAdenosine() {
        let dna = DNA.withStrand("")!
        let result = dna.count("A")
        let expected = 0
        XCTAssertEqual(result!, expected)
    }

    func testEmptyDNAStringHasNoNucleotides() {
        let dna = DNA.withStrand("")!
        let results = dna.nucleotideCounts
        let expected = [ "A": 0, "T" : 0, "C" : 0, "G" : 0 ]
        XCTAssertEqual(results, expected)
    }

    func testRepetitiveCytidineGetsCounted() {
        let dna = DNA.withStrand("CCCCC")!
        let result = dna.count("C")!
        let expected = 5
        XCTAssertEqual(result, expected)
    }

    func testRepetitiveSequenceHasOnlyGuanosine() {
        let dna = DNA.withStrand("GGGGGGGG")!
        let results = dna.nucleotideCounts
        let expected = [ "A": 0, "T" : 0, "C" : 0, "G" : 8 ]
        XCTAssertEqual(results, expected)
    }

    func testCountsByThymidine() {
        let dna = DNA.withStrand("GGGGGTAACCCGG")!
        let result = dna.count("T")!
        let expected = 1
        XCTAssertEqual(result, expected)
    }

    func testCountsANucleotideOnlyOnce() {
        let dna = DNA.withStrand("CGATTGGG")!
        var result = dna.count("T")!
        result = dna.count("T")!
        let expected = 2
        XCTAssertEqual(result, expected)
    }

    func testValidatesDNA() {
        let dna = DNA.withStrand("John")
        XCTAssert(dna == nil)
    }

    func testCountsAllNucleotides() {
        var longStrand = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
        let dna = DNA.withStrand(longStrand)!
        let results = dna.nucleotideCounts
        let expected = [ "A": 20, "T" : 21, "C" : 12, "G" : 17 ]
        XCTAssertEqual(results, expected)
    }
}

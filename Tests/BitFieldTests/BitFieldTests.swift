import XCTest
@testable import BitField

final class BitFieldTests: XCTestCase {
    func testConstructor() throws {
        let rawValue: UInt8 = 0b00000001
        let field = BitField(rawValue: rawValue)
        XCTAssertEqual(0b00000001, field.rawValue)
    }
    
    func testSubscriptGet() throws {
        do {
            let rawValue: UInt8 = 0b00000001
            let field = BitField(rawValue: rawValue)
            XCTAssertTrue(field[0])
            XCTAssertFalse(field[1])
            XCTAssertFalse(field[2])
            XCTAssertFalse(field[3])
            XCTAssertFalse(field[4])
            XCTAssertFalse(field[5])
            XCTAssertFalse(field[6])
            XCTAssertFalse(field[7])
        }
        do {
            let rawValue: UInt8 = 0b00000010
            let field = BitField(rawValue: rawValue)
            XCTAssertFalse(field[0])
            XCTAssertTrue(field[1])
            XCTAssertFalse(field[2])
            XCTAssertFalse(field[3])
            XCTAssertFalse(field[4])
            XCTAssertFalse(field[5])
            XCTAssertFalse(field[6])
            XCTAssertFalse(field[7])
        }
        do {
            let rawValue: UInt8 = 0b00000100
            let field = BitField(rawValue: rawValue)
            XCTAssertFalse(field[0])
            XCTAssertFalse(field[1])
            XCTAssertTrue(field[2])
            XCTAssertFalse(field[3])
            XCTAssertFalse(field[4])
            XCTAssertFalse(field[5])
            XCTAssertFalse(field[6])
            XCTAssertFalse(field[7])
        }
        do {
            let rawValue: UInt8 = 0b00001000
            let field = BitField(rawValue: rawValue)
            XCTAssertFalse(field[0])
            XCTAssertFalse(field[1])
            XCTAssertFalse(field[2])
            XCTAssertTrue(field[3])
            XCTAssertFalse(field[4])
            XCTAssertFalse(field[5])
            XCTAssertFalse(field[6])
            XCTAssertFalse(field[7])
        }
        do {
            let rawValue: UInt8 = 0b00010000
            let field = BitField(rawValue: rawValue)
            XCTAssertFalse(field[0])
            XCTAssertFalse(field[1])
            XCTAssertFalse(field[2])
            XCTAssertFalse(field[3])
            XCTAssertTrue(field[4])
            XCTAssertFalse(field[5])
            XCTAssertFalse(field[6])
            XCTAssertFalse(field[7])
        }
        do {
            let rawValue: UInt8 = 0b00100000
            let field = BitField(rawValue: rawValue)
            XCTAssertFalse(field[0])
            XCTAssertFalse(field[1])
            XCTAssertFalse(field[2])
            XCTAssertFalse(field[3])
            XCTAssertFalse(field[4])
            XCTAssertTrue(field[5])
            XCTAssertFalse(field[6])
            XCTAssertFalse(field[7])
        }
        do {
            let rawValue: UInt8 = 0b01000000
            let field = BitField(rawValue: rawValue)
            XCTAssertFalse(field[0])
            XCTAssertFalse(field[1])
            XCTAssertFalse(field[2])
            XCTAssertFalse(field[3])
            XCTAssertFalse(field[4])
            XCTAssertFalse(field[5])
            XCTAssertTrue(field[6])
            XCTAssertFalse(field[7])
        }
        do {
            let rawValue: UInt8 = 0b10000000
            let field = BitField(rawValue: rawValue)
            XCTAssertFalse(field[0])
            XCTAssertFalse(field[1])
            XCTAssertFalse(field[2])
            XCTAssertFalse(field[3])
            XCTAssertFalse(field[4])
            XCTAssertFalse(field[5])
            XCTAssertFalse(field[6])
            XCTAssertTrue(field[7])
        }
    }

    func testSubscriptSet() throws {
        do {
            let rawValue: UInt8 = 0b00000001
            var field = BitField(rawValue: rawValue)
            field[0] = false
            XCTAssertFalse(field[0])
            XCTAssertEqual(0b00000000, field.rawValue)
            
            field[0] = true
            XCTAssertTrue(field[0])
            XCTAssertEqual(0b00000001, field.rawValue)
            
            field[5] = true
            XCTAssertTrue(field[0])
            XCTAssertTrue(field[5])
            XCTAssertEqual(0b00100001, field.rawValue)
            
            field[7] = true
            XCTAssertTrue(field[0])
            XCTAssertTrue(field[5])
            XCTAssertTrue(field[7])
            XCTAssertEqual(0b10100001, field.rawValue)
        }
    }

    func testGetBit() throws {
        do {
            let rawValue: UInt8 = 0b00000001
            let field = BitField(rawValue: rawValue)
            XCTAssertTrue(field.getBit(0))
            XCTAssertFalse(field.getBit(1))
            XCTAssertFalse(field.getBit(2))
            XCTAssertFalse(field.getBit(3))
            XCTAssertFalse(field.getBit(4))
            XCTAssertFalse(field.getBit(5))
            XCTAssertFalse(field.getBit(6))
            XCTAssertFalse(field.getBit(7))
        }
        do {
            let rawValue: UInt8 = 0b00000010
            let field = BitField(rawValue: rawValue)
            XCTAssertFalse(field.getBit(0))
            XCTAssertTrue(field.getBit(1))
            XCTAssertFalse(field.getBit(2))
            XCTAssertFalse(field.getBit(3))
            XCTAssertFalse(field.getBit(4))
            XCTAssertFalse(field.getBit(5))
            XCTAssertFalse(field.getBit(6))
            XCTAssertFalse(field.getBit(7))
        }
        do {
            let rawValue: UInt8 = 0b00000100
            let field = BitField(rawValue: rawValue)
            XCTAssertFalse(field.getBit(0))
            XCTAssertFalse(field.getBit(1))
            XCTAssertTrue(field.getBit(2))
            XCTAssertFalse(field.getBit(3))
            XCTAssertFalse(field.getBit(4))
            XCTAssertFalse(field.getBit(5))
            XCTAssertFalse(field.getBit(6))
            XCTAssertFalse(field.getBit(7))
        }
        do {
            let rawValue: UInt8 = 0b00001000
            let field = BitField(rawValue: rawValue)
            XCTAssertFalse(field.getBit(0))
            XCTAssertFalse(field.getBit(1))
            XCTAssertFalse(field.getBit(2))
            XCTAssertTrue(field.getBit(3))
            XCTAssertFalse(field.getBit(4))
            XCTAssertFalse(field.getBit(5))
            XCTAssertFalse(field.getBit(6))
            XCTAssertFalse(field.getBit(7))
        }
        do {
            let rawValue: UInt8 = 0b00010000
            let field = BitField(rawValue: rawValue)
            XCTAssertFalse(field.getBit(0))
            XCTAssertFalse(field.getBit(1))
            XCTAssertFalse(field.getBit(2))
            XCTAssertFalse(field.getBit(3))
            XCTAssertTrue(field.getBit(4))
            XCTAssertFalse(field.getBit(5))
            XCTAssertFalse(field.getBit(6))
            XCTAssertFalse(field.getBit(7))
        }
        do {
            let rawValue: UInt8 = 0b00100000
            let field = BitField(rawValue: rawValue)
            XCTAssertFalse(field.getBit(0))
            XCTAssertFalse(field.getBit(1))
            XCTAssertFalse(field.getBit(2))
            XCTAssertFalse(field.getBit(3))
            XCTAssertFalse(field.getBit(4))
            XCTAssertTrue(field.getBit(5))
            XCTAssertFalse(field.getBit(6))
            XCTAssertFalse(field.getBit(7))
        }
        do {
            let rawValue: UInt8 = 0b01000000
            let field = BitField(rawValue: rawValue)
            XCTAssertFalse(field.getBit(0))
            XCTAssertFalse(field.getBit(1))
            XCTAssertFalse(field.getBit(2))
            XCTAssertFalse(field.getBit(3))
            XCTAssertFalse(field.getBit(4))
            XCTAssertFalse(field.getBit(5))
            XCTAssertTrue(field.getBit(6))
            XCTAssertFalse(field.getBit(7))
        }
        do {
            let rawValue: UInt8 = 0b10000000
            let field = BitField(rawValue: rawValue)
            XCTAssertFalse(field.getBit(0))
            XCTAssertFalse(field.getBit(1))
            XCTAssertFalse(field.getBit(2))
            XCTAssertFalse(field.getBit(3))
            XCTAssertFalse(field.getBit(4))
            XCTAssertFalse(field.getBit(5))
            XCTAssertFalse(field.getBit(6))
            XCTAssertTrue(field.getBit(7))
        }
    }

    func testSetBit() throws {
        do {
            let rawValue: UInt8 = 0b00000001
            var field = BitField(rawValue: rawValue)
            field.setBit(0, value: false)
            XCTAssertFalse(field.getBit(0))
            XCTAssertEqual(0b00000000, field.rawValue)
            
            field.setBit(0, value: true)
            XCTAssertTrue(field.getBit(0))
            XCTAssertEqual(0b00000001, field.rawValue)
            
            field.setBit(5, value: true)
            XCTAssertTrue(field.getBit(0))
            XCTAssertTrue(field.getBit(5))
            XCTAssertEqual(0b00100001, field.rawValue)
            
            field.setBit(7, value: true)
            XCTAssertTrue(field.getBit(0))
            XCTAssertTrue(field.getBit(5))
            XCTAssertTrue(field.getBit(7))
            XCTAssertEqual(0b10100001, field.rawValue)
        }
    }
    
    func testGetBits() throws {
        do {
            let rawValue: UInt8 = 0b10101010
            let field = BitField(rawValue: rawValue)
            XCTAssertEqual(0b10101010, field.getBits(offset: 0, count: 8))
            XCTAssertEqual(0b101, field.getBits(offset: 1, count: 3))
            XCTAssertEqual(0b1010101, field.getBits(offset: 1, count: 7))
            XCTAssertEqual(0b1, field.getBits(offset: 7, count: 1))
        }
        do {
            let rawValue: UInt8 = 0b01010101
            let field = BitField(rawValue: rawValue)
            XCTAssertEqual(0b01010101, field.getBits(offset: 0, count: 8))
            XCTAssertEqual(0b010, field.getBits(offset: 1, count: 3))
            XCTAssertEqual(0b0101010, field.getBits(offset: 1, count: 7))
            XCTAssertEqual(0b0, field.getBits(offset: 7, count: 1))
        }
        do {
            let rawValue: UInt8 = 0b00101011
            let field = BitField(rawValue: rawValue)
            XCTAssertEqual(0b00101011, field.getBits(offset: 0, count: 8))
            XCTAssertEqual(0b101, field.getBits(offset: 1, count: 3))
            XCTAssertEqual(0b0010101, field.getBits(offset: 1, count: 7))
            XCTAssertEqual(0b0, field.getBits(offset: 7, count: 1))
        }
    }

    static var allTests = [
        ("testConstructor", testConstructor),
        ("testSubscriptGet", testSubscriptGet),
        ("testSubscriptSet", testSubscriptSet),
        ("testGetBit", testGetBit),
        ("testSetBit", testSetBit),
        ("testGetBits", testGetBits),
    ]
}

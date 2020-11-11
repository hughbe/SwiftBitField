# Swift BitField

Package for defining bit fields in Swift.

## Example Usage

Use `getBit(_ index:)` to get the boolean value of a bit at a zero-based index into the raw value.

```swift
let field = BitField(rawValue: 0b10101010)
XCTAssertFalse(field.getBit(0))
XCTAssertTrue(field.getBit(1))
XCTAssertFalse(field.getBit(2))
XCTAssertTrue(field.getBit(3))
XCTAssertFalse(field.getBit(4))
XCTAssertTrue(field.getBit(5))
XCTAssertFalse(field.getBit(6))
XCTAssertTrue(field.getBit(7))
```

Use `getBit(offset:count:)` to get the integer value of a series of bit starting at a zero-based index into the raw value.

```swift
let field = BitField(rawValue: 0b10101010)
XCTAssertEqual(0b10101010, field.getBits(offset: 0, count: 8))
XCTAssertEqual(0b101, field.getBits(offset: 1, count: 3))
XCTAssertEqual(0b1010101, field.getBits(offset: 1, count: 7))
XCTAssertEqual(0b1, field.getBits(offset: 7, count: 1))
```

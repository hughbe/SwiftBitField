//
//  BitField.swift
//
//
//  Created by Hugh Bellamy on 11/11/2020.
//

public struct BitField<T> where T: FixedWidthInteger {
    public var rawValue: T
    
    public init(rawValue: T) {
        self.rawValue = rawValue
    }
    
    public subscript(_ index: Int) -> Bool {
        get { getBit(index) }
        set { setBit(index, value: newValue) }
    }
    
    public func getBit(_ index: Int) -> Bool {
        precondition(index >= 0 && index < T.bitWidth)
        return ((rawValue & (1 << index)) >> index) != 0
    }
    
    public mutating func setBit(_ index: Int, value: Bool) {
        precondition(index >= 0 && index < T.bitWidth)
        
        if value {
            rawValue |= 1 << index
        } else {
            rawValue &= ~(1 << index)
        }
    }
    
    public func getBits(offset: Int, count: Int) -> T {
        precondition(offset >= 0 && offset < T.bitWidth)
        precondition(count > 0 && offset + count <= T.bitWidth)
        
        var bitMask: T = 1
        for i in 0..<count {
            bitMask |= 1 << i
        }

        return (rawValue >> offset) & bitMask
    }
}

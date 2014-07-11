//
// ByteOrder.swift
// Lilliput
//
// Copyright (c) 2014 Justin Kolb - https://github.com/jkolb/Lilliput
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

protocol ByteOrder {
    func toNative(value: UInt16) -> UInt16
    func toNative(value: UInt32) -> UInt32
    func toNative(value: UInt64) -> UInt64
    
    func fromNative(value: UInt16) -> UInt16
    func fromNative(value: UInt32) -> UInt32
    func fromNative(value: UInt64) -> UInt64
}

struct LittleEndian : ByteOrder {
    func toNative(value: UInt16) -> UInt16 {
        return UInt16(littleEndian: value)
    }
    
    func toNative(value: UInt32) -> UInt32 {
        return UInt32(littleEndian: value)
    }
    
    func toNative(value: UInt64) -> UInt64 {
        return UInt64(littleEndian: value)
    }
    
    func fromNative(value: UInt16) -> UInt16 {
        return value.littleEndian
    }
    
    func fromNative(value: UInt32) -> UInt32 {
        return value.littleEndian
    }
    
    func fromNative(value: UInt64) -> UInt64 {
        return value.littleEndian
    }
}

struct BigEndian : ByteOrder {
    func toNative(value: UInt16) -> UInt16 {
        return UInt16(bigEndian: value)
    }
    
    func toNative(value: UInt32) -> UInt32 {
        return UInt32(bigEndian: value)
    }
    
    func toNative(value: UInt64) -> UInt64 {
        return UInt64(bigEndian: value)
    }

    func fromNative(value: UInt16) -> UInt16 {
        return value.bigEndian
    }
    
    func fromNative(value: UInt32) -> UInt32 {
        return value.bigEndian
    }
    
    func fromNative(value: UInt64) -> UInt64 {
        return value.bigEndian
    }
}

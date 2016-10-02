/*
 The MIT License (MIT)
 
 Copyright (c) 2016 Justin Kolb
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

public protocol WritableByteChannel : class {
    func writeData(_ data: UnsafeRawPointer, numberOfBytes: Int) throws -> Int
}

extension WritableByteChannel {
    public func writeBytes(_ bytes: UnsafePointer<UInt8>, numberOfBytes: Int) throws -> Int {
        return try writeData(bytes, numberOfBytes: numberOfBytes)
    }
    
    public func writeBuffer(_ buffer: Buffer) throws -> Int {
        return try writeBuffer(buffer, numberOfBytes: buffer.count)
    }
    
    public func writeBuffer(_ buffer: Buffer, numberOfBytes: Int) throws -> Int {
        precondition(numberOfBytes <= buffer.count)
        
        return try buffer.withUnsafeBytes { (pointer: UnsafePointer<UInt8>) -> Int in
            try writeData(UnsafeRawPointer(pointer), numberOfBytes: numberOfBytes)
        }
    }
    
    public func writeByteBuffer<Order: ByteOrder>(_ buffer: ByteBuffer<Order>) throws -> Int {
        return try writeByteBuffer(buffer, numberOfBytes: buffer.remaining)
    }
    
    public func writeByteBuffer<Order: ByteOrder>(_ buffer: ByteBuffer<Order>, numberOfBytes: Int) throws -> Int {
        precondition(numberOfBytes <= buffer.remaining)
        
        let bytesWritten = try buffer.withUnsafeBytes { (pointer: UnsafePointer<UInt8>) -> Int in
            try writeBytes(pointer.advanced(by: buffer.position), numberOfBytes: numberOfBytes)
        }
        
        buffer.position += bytesWritten
        
        return bytesWritten
    }
}
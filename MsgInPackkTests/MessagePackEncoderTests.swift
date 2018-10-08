//
//  MessagePackEncoderTests.swift
//  MsgInPackkTests
//
//  Created by Enrico Secondulfo on 08/10/2018.
//  Copyright © 2018 Enrico Secondulfo. All rights reserved.
//

import XCTest
@testable import MsgInPackk

class MessagePackEncoderTests: XCTestCase {
    
    var encoder: MessagePackEncoder?
    var decoder: MessagePackDecoder?
    
    override func setUp() {
        self.encoder = MessagePackEncoder()
        self.decoder = MessagePackDecoder()
    }
    
    func testEncodeFalse() {
        let data: Data? = try! self.encoder?.encode(false)
        XCTAssertEqual(data, Data([0xc2]))
    }
    
    func testEncodeImageData() {
        let fakeImage: UIImage = UIImage.size(width: 1, height: 1)
            .color(UIColor.white)
            .border(color: UIColor.red)
            .border(width: 1)
            .corner(radius: 1)
            .image
        
        let imageData: Data? = fakeImage.jpegData(compressionQuality: 1.0)
        
        let encodedImageData: Data? = try! self.encoder?.encode(imageData)
        let decodedImageData: Data? = try! self.decoder?.decode(Data.self, from: encodedImageData!)
        
        XCTAssertEqual(imageData, decodedImageData)
    }
}

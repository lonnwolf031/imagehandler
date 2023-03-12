//
//  ImageReader.swift
//  imagehandler
//
//  Created by Lonneke Kolkman on 11/03/2023.
//

import SwiftUI

// approach 1

func convertByteArray() {
    
    guard let image = UIImage(named: "someImage"),
          let data = image.jpegData(compressionQuality: 1.0) else { return }
    
    // OR
    
    guard let image = UIImage(named: "someImage"),
          let data = image.pngData() else { return }
}
// approach 2

func getArrayOfBytesFromImage(imageData:NSData) -> Array<UInt8>
{

  // the number of elements:
  let count = imageData.length / MemoryLayout<Int8>.size

  // create array of appropriate length:
  var bytes = [UInt8](repeating: 0, count: count)

  // copy bytes into array
  imageData.getBytes(&bytes, length:count * MemoryLayout<Int8>.size)

  var byteArray:Array = Array<UInt8>()

  for i in 0 ..< count {
    byteArray.append(bytes[i])
  }

  return byteArray


}

// use
func foo() {
    
    
    //let data = imageX.pngData()
    //var bytes = getArrayOfBytesFromImage(imageData: data! as NSData)
    //let datos: NSData = NSData(bytes: bytes, length: bytes.count)
//   var newImage = UIImage(data: datos as Data) // Note it's optional. Don't force unwrap!!!
}

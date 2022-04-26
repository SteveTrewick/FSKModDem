import XCTest
@testable import FSKModDem

final class FSKModDemTests: XCTestCase {
    
  // these are just basic sanity tests
  
  func testNonInverted() {
    
    // generate two symbols at 1200 baud, 48 KHz
    // we should expect 40 samples of each symbol value
    
    let bits : [Int] = [0, 1]
    let fsk    = FSKModDem.Modulator(baud: 1200, inverted: false)
    let expect = [Float](repeating: -1.0, count: 40) + [Float](repeating: 1.0, count: 40)
    let result = fsk.modulate(bits: bits)
    
    XCTAssert(result == expect)
  }
  
  // the same, but upside down
  
  func testInverted() {
    
    let bits : [Int] = [0, 1]
    let fsk    = FSKModDem.Modulator(baud: 1200, inverted: true)
    let expect = [Float](repeating: 1.0, count: 40) + [Float](repeating: -1.0, count: 40)
    let result = fsk.modulate(bits: bits)
  
    XCTAssert(result == expect)
  
  }
  
}

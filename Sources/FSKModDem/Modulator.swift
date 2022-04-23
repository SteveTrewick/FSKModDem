
import Foundation

// FSK Modulator, for the moment only support 48 KHz sample rate
// which will work nicely with 1200 and 2400 baud, but not e.g. 512
// I shall fancy this up later

public class Modulator {

  let symbol_length : Int
  
  public init(baud: Int) {
    self.symbol_length = 48000 / baud
  }
  
  
  
  // Modulate bits into 48 KHz audio samples this will produce a very harsh square wave.
  // If you are going to transmit this you may need to scale the amplitude, depending
  // on what's at the RX end and how much it cares about precise deviation
  
  public func modulate (bits: [Int]) -> [Float] {
    
    var samples : [Float] = []
    
    for bit in bits {
      for _ in 0..<symbol_length {
        if bit == 1 { samples += [1.0] }
        else        { samples += [0.0] }
      }
    }
    
    return samples
  }
  
  // demod needs refactoring before adding, watch this space
  
}


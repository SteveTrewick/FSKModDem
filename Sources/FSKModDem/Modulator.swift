
import Foundation

// FSK Modulator, for the moment only support 48 KHz sample rate
// which will work nicely with 1200 and 2400 baud, but not e.g. 512
//
// this is going to get slightly more sophisticated as we go,
// but not by all that much, much of the work will be on the
// audio out side


public class Modulator {

  let symbol_length : Int
  let zero_symbol   : Float
  let one_symbol    : Float
  
  public init(baud: Int, inverted : Bool) {
    symbol_length             = 48000 / baud
    (one_symbol, zero_symbol) = inverted ? (-1.0, 1.0) : (1.0, -1.0)
  }
  
  
  
  // Modulate bits into 48 KHz audio samples this will produce a very harsh square wave.
  // If you are going to transmit this you may need to scale the amplitude, depending
  // on what's at the RX end and how much it cares about precise deviation
  
  public func modulate (bits: [Int]) -> [Float] {
    
    var samples : [Float] = []
    
    for bit in bits {
      for _ in 0..<symbol_length {
        if bit == 1 { samples += [ one_symbol ] }
        else        { samples += [ zero_symbol] }
      }
    }
    
    return samples
  }
  
  // demod needs refactoring before adding, watch this space
  
}


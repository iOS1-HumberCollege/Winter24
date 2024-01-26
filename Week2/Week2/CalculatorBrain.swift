//
//  CalculatorBrain.swift
//  Week2
//
//  Created by Rania Arbash on 2024-01-26.
//

import Foundation

class CalculatorBrain {
    // "11 + 33"
    // "100 - 3"
    func doMath(statment : String) -> Int {
        // 1 1 + 3 3 =
       
        var result = 0
        var opIndex = 0
        var operands = [String]()
       //var allValues = statment.components(separatedBy: " ")
        for sym in statment {
            opIndex += 1
            if sym == "+"{
             operands = statment.components(separatedBy: "+")
               // var l=  operands[0].tr
                let lo = Int(operands[0])
                
                let ro = Int(operands[1])
                if let goodLo = lo {
                    if let goodRO = ro{
                        result = goodLo + goodRO
                    }
                }
               
            }
            else if sym == "-"{
                operands = statment.components(separatedBy: "-")
                let lo : Int? = Int(operands[0])
                let ro : Int? = Int(operands[1])
                    if let goodLo = lo {
                    if let goodRO = ro{
                        result = goodLo - goodRO
                    }
                }
            }
        }
        
        return result
    }
    
    
}

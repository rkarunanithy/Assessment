//
//  Field.swift
//  Assessment
//
//  Created by Ravisankar Karunanithy on 30/01/18.
//  Copyright © 2018 RKarunanithy. All rights reserved.
//

import UIKit

class Field: Decodable {
    var  id : Int
    var  name : String
    var  title : String
    var  answer : String?
    var required : Bool = false
    var diasbled : Bool = false
    
    /*
     enum fieldType : String {
     case TEXTITEM
     case SELECTITEM
     case LABEL
     
     }
     
     enum datatype : String {
     case rpcenum
     case rpcstring
     }*/
    
    func printObj(){
        print("The id  \(id)")
        print("The name  \(String(describing: name))")
        print("The name  \(String(describing: answer))")
        print("The title  \(String(describing: title))")
        print("The required  \(required)")
        print("The diasbled  \(diasbled)")
    }
}


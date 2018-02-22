//
//  Tabs.swift
//  Assessment
//
//  Created by Ravisankar Karunanithy on 30/01/18.
//  Copyright © 2018 RKarunanithy. All rights reserved.
//

import UIKit

class Tabs: Decodable {
    
    var  id : Int
    var  name : String
    var  title : String
    
    func printObj(){
        print("The id  \(id)")
        print("The name  \(String(describing: name))")
        print("The title  \(String(describing: title))")
    }
    
}


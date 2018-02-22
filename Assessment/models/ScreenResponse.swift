//
//  ScreenResponse.swift
//  JsonConnect
//
//  Created by Ravisankar Karunanithy on 28/01/18.
//  Copyright © 2018 RKarunanithy. All rights reserved.
//

import UIKit

class ScreenResponse: Decodable {
    var  screenList  : [Screen] = [];
    var  success : Bool = false
    
    func printObj() {
        print("Success :  \(success )")
        for screen in screenList {
            screen.printObj()
        }
    }
}

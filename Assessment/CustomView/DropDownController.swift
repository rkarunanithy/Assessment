//
//  CustomDropDown.swift
//  Assessment
//
//  Created by Ravisankar Karunanithy on 06/02/18.
//  Copyright © 2018 RKarunanithy. All rights reserved.
//

import Foundation
import UIKit

open class DropDownController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var button = UIButton(type : .custom)
    var tableView = UITableView()
    
    var prevView = UIView()
    
    var data = [String]()
    
    
    var flag = 1
    
    func setPrevView(view : UIView){
        self.prevView = view
    }
    func setData(data : [String]){
        self.data = data
    }
    
    func createButton() -> UIView {
        
        button.setTitle("Select", for: UIControlState.normal)
        button.frame = CGRect(x : self.prevView.frame.origin.x, y: self.prevView.frame.origin.y, width : 150, height : 50)
        button.layer.borderWidth = 1
        button.center = self.view.center
        //view.addSubView(button)
        
        button.addTarget(self, action: #selector(selectDropDown), for : .touchUpInside)
        
        return button
    }
    
    func createDropDown() -> UIView {
        
        self.tableView.frame = CGRect(x : self.button.frame.origin.x, y: (self.button.frame.origin.y + self.button.frame.height),            width : self.button.frame.width, height : 500)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.tableView.delegate = self
        self.tableView.allowsSelection = true
        self.tableView.dataSource = self
        self.tableView.isHidden = true
        
        return tableView
        
    }
    @objc func selectDropDown(){
        
        print("###################")
        var height = 0
        var f = 0;
        if(flag == 0){
            height = 0
            f = 1
            self.tableView.isHidden = true
        }else{ //Show
            height = 500
            self.tableView.isHidden = false
            f = 0
        }
        UIView.animate(withDuration : 0.1){
            self.tableView.frame = CGRect(x : self.button.frame.origin.x, y: (self.button.frame.origin.y + self.button.frame.height),            width : self.button.frame.width, height : CGFloat(height))
            self.flag = f
        }
    }
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        print("**********Drop*1*******************")
        return 1 //As of now one section.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("*********Drop**2*******************")
        return self.data.count;
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("***********3*******************\(indexPath)")
        // let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        print("Row Ind \(indexPath.row)")
        cell.textLabel?.text = self.data[indexPath.row]
        
        //print("***********3*******************\(cell)")
        return cell
        
        
        
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
        
    }
    
    
    
    
    
}


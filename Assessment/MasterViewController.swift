//
//  MasterViewController.swift
//  Assessment
//
//  Created by Ravisankar Karunanithy on 29/01/18.
//  Copyright © 2018 RKarunanithy. All rights reserved.
//

import UIKit
import CoreData
import SQLite3




class MasterViewController: UITableViewController {

    var screenResponse : ScreenResponse?
    
    var db: OpaquePointer?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        doJsonParse()
        //doConnectDatabase()
        self.tableView.delegate = self
        self.tableView.allowsSelection = true
        self.tableView.dataSource = self
    }
    /*
    func doConnectDatabase(){
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask,                appropriateFor: nil, create: false).appendingPathComponent("HeroesDatabase.sqlite")
        
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Heroes (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, powerrank INTEGER)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        
        
        //getting values from textfields
        let name = textFieldName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let powerRanking = textFieldPowerRanking.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        //validating that values are not empty
        if(name?.isEmpty)!{
            textFieldName.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        if(powerRanking?.isEmpty)!{
            textFieldName.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        //creating a statement
        var stmt: OpaquePointer?
        
        //the insert query
        let queryString = "INSERT INTO Heroes (name, powerrank) VALUES (?,?)"
        
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        //binding the parameters
        if sqlite3_bind_text(stmt, 1, name, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
        
        if sqlite3_bind_int(stmt, 2, (powerRanking! as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
        
        //executing the query to insert values
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting hero: \(errmsg)")
            return
        }
        
        //emptying the textfields
        textFieldName.text=""
        textFieldPowerRanking.text=""
        
        
        readValues()
        
        //displaying a success message
        print("Herro saved successfully")
    }
     
     
   
    }*/
        
    override func numberOfSections(in tableView: UITableView) -> Int {
        //return fetchedResultsController.sections?.count ?? 0
        print("***********1*******************")
        return 1 //As of now one section.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       print("***********2*******************\(screenResponse!.screenList[0].tabsList.count)")
       return screenResponse!.screenList[0].tabsList.count;
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("***********3*******************\(indexPath)")
       // let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        _ = screenResponse!.screenList[0].tabsList[0];
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let tab =  screenResponse!.screenList[0].tabsList[indexPath.row]
        cell.textLabel?.text = tab.title
        
          print("***********3*******************\(cell)")
        return cell
       
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row #: \(indexPath)")
        
        guard let detailViewNavigationController  = self.splitViewController?.viewControllers[1] as? UINavigationController else {
            return
        }
        //Get a reference to your custom detail view controller
        guard let detailController = detailViewNavigationController.viewControllers[0] as? DetailViewController else {
            return
        }
        let tab =  screenResponse!.screenList[0].tabsList[indexPath.row]
        detailController.reloadView(screen: screenResponse!.screenList[0],  tab : tab)
    }
    
  


    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
       print("***********4*******************")
        // Return false if you do not want the specified item to be editable.
        return true
    }

  
    
    func doJsonParse(){
        
        //let url = Bundle.main.url(forResource: "person", withExtension: "json")!
        let url = Bundle.main.url(forResource: "Screen", withExtension: "json")!
        
        // Load Data
        let data = try! Data(contentsOf: url)
        
        
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options:[]) as? [String:Any] {
                print(json)
                let decoder = JSONDecoder()
                screenResponse = try decoder.decode(ScreenResponse.self, from: data)
                //screenResponse.printObj()
                
                
                
            }
        } catch let err{
            print(err)
            print(err.localizedDescription)
        }
        
        //print(JSON["success"])
        
        
        
    }
    
    
    

}



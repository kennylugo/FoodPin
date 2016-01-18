//
//  FoodPinTableViewController.swift
//  FoodPin
//
//  Created by Kenny Batista on 1/16/16.
//  Copyright © 2016 Kenny Batista. All rights reserved.
//

import UIKit

class FoodPinTableViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "ForKee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "PalominoEspresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "CafeLore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg",
        "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg",
        "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg",
        "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg",
        "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var restaurantLocations = ["Hong Kong", "HongKong", "Hong Kong", "Hong Kong", "Hong Kong", "HongKong", "Hong Kong", "Sydney", "Sydney", "Sydney",
            "New York", "New York", "New York", "New York", "NewYork", "New York", "New York", "London", "London",
            "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop",
            "Cafe", "Tea House", "Austrian / Causual Drink",
            "French", "Bakery", "Bakery", "Chocolate", "Cafe",
            "American / Seafood", "American", "American",
            "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish",
            "Spanish", "British", "Thai"]
    
    
    var restaurantIsVisited = [Bool](count:21,repeatedValue:false)
        

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.restaurantNames.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell
        

        // Configure the cell...
        cell.nameLabel?.text = restaurantNames[indexPath.row]
        cell.imageContainer?.image = UIImage(imageLiteral: restaurantImages[indexPath.row])
        cell.locationLabel?.text = restaurantLocations[indexPath.row]
        cell.typeLabel?.text = restaurantTypes[indexPath.row]
        
            
            
        //Circular/smooth edge images
//        cell.imageContainer.layer.cornerRadius = cell.imageContainer.frame.size.width / 2
        cell.imageContainer.layer.cornerRadius = 10.0
        cell.imageContainer.clipsToBounds = true
        

        
//        cell.accesoryType = restaurantIsVisited[indexPath.row] ? .Checkmark : .None
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //Create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do", preferredStyle: .ActionSheet)
        
        //Add actions to the menu
        let CancelingAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        optionMenu.addAction(CancelingAction)
        
        //The call action
        
        let callActionHandler = {(action:UIAlertAction!) -> Void in
        let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available is not available yet. Please try again later", preferredStyle: .Alert)
        alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alertMessage, animated: true, completion: nil)}
        
        let callAction = UIAlertAction(title: "Call " + "123-000-\(restaurantNames[indexPath.row])", style: UIAlertActionStyle.Default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        //I've been here action
        let isVisitedAction = UIAlertAction(title: "I've been here", style: .Default, handler: {
            (action: UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .Checkmark
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
            
            self.restaurantIsVisited[indexPath.row] = true
        })
        optionMenu.addAction(isVisitedAction)
        
        
        
        
        //Display the menu
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

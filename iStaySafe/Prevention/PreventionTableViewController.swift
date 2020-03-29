//
//  PreventionTableViewController.swift
//  iStaySafe
//
//  Created by Z Xiao on 3/29/20.
//  Copyright © 2020 Z Xiao. All rights reserved.
//

import UIKit

class PreventionTableViewController: UITableViewController {
    var guidelines: [Guideline] = []
    var touchCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        guidelines = createGuidelines()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func createGuidelines() -> [Guideline] {
        let guideline1 = Guideline(image: #imageLiteral(resourceName: "TouchFace"), title: "Face Touching Prevention", description: "You've touched your face \(touchCount) times today! Try to avoid touching your face to prevent harmful germs from entering your body!")
        let guideline2 = Guideline(image: #imageLiteral(resourceName: "HandWash"), title: "Hand Washing Reminders", description: "Set repeating reminders to wash your hands. Use the Apple Watch app to help you time your hand washing.")
        
        return [guideline1, guideline2]
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 1
        default:
            return guidelines.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PreventionHeaderCell", for: indexPath)
            return cell
        } else {
            let guideline = guidelines[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "PreventionCell") as! PreventionTableViewCell
            cell.setGuideline(guideline: guideline)
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Call function when the coressponding row is selected
        if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                break
            case 1:
                break
            default:
                break
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

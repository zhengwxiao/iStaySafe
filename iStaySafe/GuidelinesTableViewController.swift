//
//  GuidelinesTableViewController.swift
//  iStaySafe
//
//  Created by Z Xiao on 3/29/20.
//  Copyright © 2020 Z Xiao. All rights reserved.
//

import UIKit

class GuidelinesTableViewController: UITableViewController {
    
    
    var guidelines: [Guideline] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        guidelines = createGuidelines()
    }
    
    private func createGuidelines() -> [Guideline] {
        let guideline1 = Guideline(image: #imageLiteral(resourceName: "SocialDistancing"), title: "Practice Social Distancing", description: "Keep a distance between yourself and others whenever you're not home. Avoid close contact with people who are sick.")
        let guideline2 = Guideline(image: #imageLiteral(resourceName: "HandWash"), title: "Personal Hygiene is Important!", description: "Be sure to wash your hands often, especially if you're out in a public place or have been coughing, sneezing, or blowing your nose. When washing your hands, ensure that you use both water and soap, and wash for at least 20 seconds.")
        let guideline3 = Guideline(image: #imageLiteral(resourceName: "CoverMouth"), title: "Cover Up a Sneeze/Cough", description: "Cover your mouth and nose with a tissue when you cough or sneeze or use the inside of your elbow. Throw used tissues in the trash. Immediately wash your hands with soap and water, and apply a hand sanitizer that contains at least 60% alcohol.")
        let guideline4 = Guideline(image: #imageLiteral(resourceName: "MedicalMask"), title: "Wear a Face Mask", description: "If you're showing symptom or think you may be sick, wear a mask! This is important because it helps prevent rapid spread of the virus. This still applies if you are visiting a medical facility. If you are NOT sick, you do not need wear a mask. Facemasks are in short supply and should be saved for caregivers.")
        
        return [guideline1, guideline2, guideline3, guideline4]
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "GuidelinesHeaderCell", for: indexPath)
            return cell
        } else {
            let guideline = guidelines[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "GuidelineCell") as! GuidelinesTableViewCell
            cell.setGuideline(guideline: guideline)
            
            return cell
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

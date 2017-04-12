//
//  BookmarkTableVC.swift
//  Bookmarker
//
//  Created by jefferson on 10/23/16.
//  Copyright © 2016 tony. All rights reserved.
//

import UIKit

class BookmarkTableVC: UITableViewController {
    let simpleCell = "simpleCell"
    var bookmarks = [Bookmark]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Bookmarks"
        bookmarks.append(Bookmark(name: "RIT", url: "http://www.rit.edu"))
        bookmarks.append(Bookmark(name: "Google News", url: "http://news.google.com"))
        bookmarks.append(Bookmark(name: "Apple Developer", url: "http://developer.apple.com"))

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return bookmarks.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: simpleCell, for: indexPath)
        let bookmark = bookmarks[indexPath.row]
        cell.textLabel?.text = bookmark.name

        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow{
            let selectedRow = indexPath.row
            guard selectedRow < bookmarks.count else{
                print("row \(selectedRow) is not in bookmarks!)")
                return
            }
            let detailVC = segue.destination as! BookmarkDetailTableVC
            detailVC.bookmark = bookmarks[selectedRow]
        }
    }
    

}

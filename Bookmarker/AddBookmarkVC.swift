//
//  AddBookmarkVCViewController.swift
//  Bookmarker
//
//  Created by Benjamin Wilcox on 4/11/17.
//  Copyright © 2017 tony. All rights reserved.
//

import UIKit

class AddBookmarkVC: UIViewController {

    var bookmark:Bookmark?
    @IBOutlet weak var titleField:UITextField!
    @IBOutlet weak var urlField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Bookmark"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let name = (titleField.text?.characters.count)! > 0 ? titleField.text! : "No title entered"
        let url = (urlField.text?.characters.count)! > 0 ? urlField.text! : "No URL entered"
        
        bookmark = Bookmark(name: name, url: url)
    }

}

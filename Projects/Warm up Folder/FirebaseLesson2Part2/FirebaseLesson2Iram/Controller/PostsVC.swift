//
//  PostsVC.swift
//  FirebaseLesson2Iram
//
//  Created by C4Q on 11/9/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit

class PostsVC: UITableViewController {
    
    
    var posts = [Post]() {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getPosts()

    }
    override func viewWillAppear(_ animated: Bool) {
        getPosts()
    }
    
    private func getPosts() {
        FirestoreService.manager.getPosts { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let postsFromFireStore):
                self.posts = postsFromFireStore
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "postCell")
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        return cell
        
    }
    

}

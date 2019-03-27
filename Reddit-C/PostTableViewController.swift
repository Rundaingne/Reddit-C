//
//  PostTableViewController.swift
//  Reddit-C
//
//  Created by Brooke Kumpunen on 3/27/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    
    var posts: [EKKPost]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postDetailCell", for: indexPath) as? EKKPostTableViewCell
        guard let posts = posts else {return UITableViewCell()}
        let post = posts[indexPath.row]
        cell?.post = post

        // Configure the cell...

        return cell ?? UITableViewCell()
    }

}

extension PostTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else {return}
        EKKSubredditClient.fetchAllSubReddits(forTitle: searchTerm) { (posts) in
            self.posts = posts
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

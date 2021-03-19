//
//  ViewController.swift
//  Youtube Clone
//
//  Created by muhammad abdul latief on 15/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate, ModelDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  
  var model = Model()
  var videos = [Video]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.delegate = self
    model.delegate = self
    
    model.getVideos()
  }
  
  func videosFetched(_ videos:[Video]) {
    
    self.videos = videos
    tableView.reloadData()
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
      // Confirm that a video was selected
      guard tableView.indexPathForSelectedRow != nil else {
        return
      }
      
      // Get a reference to the video that was tapped on
      let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
      
      // Get a reference to the detail view controller
    let detailVC = segue.destination as! DetailViewController
      
      // Set the video property of the detail view controller
      detailVC.video = selectedVideo
      
      
    }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return videos.count
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
    
    let video = self.videos[indexPath.row]
    
    cell.setCell(video)
    
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
  
  
  
}


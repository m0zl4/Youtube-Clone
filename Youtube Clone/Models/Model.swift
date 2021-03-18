//
//  Model.swift
//  Youtube Clone
//
//  Created by muhammad abdul latief on 15/03/21.
//

import Foundation

protocol ModelDelegate {
  
  func videosFetched(_ videos:[Video])
  
}

class Model {
  
  var delegate:ModelDelegate?
  
  //buat fungsi mgambil data dr youtube API
  func getVideos() {
    //nyimpan url ke dlm variabel
    let url = URL(string: Constants.API_URL)
    
    //kita cek urlnya kosong gk?
    guard url != nil else {
      return
    }
    
    //mendapatkan  URLSession dr object
    let session = URLSession.shared
    
    //mendapatkan data dari URLsession
    let dataTask = session.dataTask(with: url!){ (data, response, error) in
      
      //cek kali ada error
      if  error != nil || data == nil{
        return
      }
      
      do {
        //memasukan data kedalam file project video
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let response = try decoder.decode(Response.self, from: data!)
        
        if response.items != nil{
          DispatchQueue.main.sync {
            self.delegate?.videosFetched(response.items!)
          }
        }
        
        //dump(response)
        
      }
      catch {
        
      }
    }
    
    //start
    dataTask.resume()
  }
}

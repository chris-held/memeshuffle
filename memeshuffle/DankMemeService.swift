//
//  DankMemeService.swift
//  memeshuffle
//
//  Created by Chris Held on 7/16/17.
//  Copyright © 2017 Chris Held. All rights reserved.
//

import Foundation
import Just

class DankMemeService: NSObject {
    
    func getUrl(_ criteria: String) -> String {
        let q: String = criteria + " meme"
        return "https://www.googleapis.com/customsearch/v1?key=AIzaSyBsZ4trxyJZRx7W5tDFa6-SrCI-tAGsX0Q&cx=011910645984746659053:torlpc4hvqe&q=" + q.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! + "&searchType=image"
    }
    
    //return the array of images in the response body
    func parseResponse(_ response: [String: AnyObject?]) -> [[String: AnyObject?]]? {
        //return [["foo": "bar" as AnyObject]]
        if let val = response["items"] {
            return val as? [[String : AnyObject?]]
        } else {
            return nil
        }
    }
    
    func getRandomUrl(_ images: [[String: AnyObject?]]) -> String {
        let count = images.count
        let idx = arc4random_uniform(UInt32(count)) + 1
        return images[Int(arc4random_uniform(idx))]["link"] as! String
    }
    func getMemeImageUrl(_ criteria: String) -> String? {
        let url: String = self.getUrl(criteria)
        //TODO - probably make this asynchronous
        let r = Just.get(url)
        if (r.ok) {
            if let images = self.parseResponse(r.json as! [String : AnyObject?]) {
                let img = self.getRandomUrl(images)
                return img
            } else {
                return nil
            }
            
        } else {
            return nil
        }
        /*Just.get(url) { r in
            if (r?.ok)! {
                let images = self.parseResponse(response: r!.json as! [String : AnyObject?])
                let image = self.getRandomUrl(images: images)
                return image
                
            } else {
                
            }
        }*/
    }
}

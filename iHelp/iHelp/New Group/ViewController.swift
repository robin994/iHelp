//
//  ViewController.swift
//  PushNotification
//
//  Created by Cirillo Stefano on 06/07/17.
//  Copyright © 2017 Cirillo Stefano. All rights reserved.
//

import UIKit
import Firebase
import FirebaseMessaging

class ViewController: UIViewController {

    @IBOutlet weak var send: UIButton!
    
    @IBOutlet weak var topic: UIButton!
    
    @IBAction func subscrive(_ sender: Any) {
        Messaging.messaging().subscribe(toTopic: "/topics/Notifiche")
    }
    
    @IBAction func sendNotification(_ sender: Any) {
        let url = NSURL(string: "https://fcm.googleapis.com/fcm/send")
        var tk = InstanceID.instanceID().token()
        
        print("\n\n \(tk!) \n\n")
        let postParams = [
            "to": "/topics/Notifiche",
            "notification": ["body": "This is the body.", "title": "This is the title.", "icon" : "logo.png"]
            ] as [String : Any]
        
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("key=AAAAih1qe8c:APA91bHsgEHV5_JUY8OgIcd3wZZcLwuBau24-hBaF4uMUZ4awKsSq5BHV1TY8smJIGcpsQ1yqt3qDrHLB_w9-HggOX_tsIKgFEwr1Hw8W-joX4qYP7T_86Mayzuby7Q7skGwPDCV_amY", forHTTPHeaderField: "Authorization")
        
        do
        {
            request.httpBody = try JSONSerialization.data(withJSONObject: postParams, options: JSONSerialization.WritingOptions())
            print("My paramaters: \(postParams)")
        }
        catch
        {
            print("Caught an error: \(error)")
        }
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            if let realResponse = response as? HTTPURLResponse
            {
                if realResponse.statusCode != 200
                {
                    print("Not a 200 response")
                }
            }
            
            if let postString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as String?
            {
                print("POST: \(postString)")
            }
        }
        
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


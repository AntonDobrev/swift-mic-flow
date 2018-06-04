//
//  ViewController.swift
//  KinveyMICLogin
//
//  Created by Victor Hugo on 2017-09-05.
//  Copyright © 2017 Kinvey. All rights reserved.
//

import UIKit
import Kinvey

class ViewController: UIViewController {

    
    lazy var store: DataStore<Book>! = {
        return DataStore<Book>.collection(StoreType.sync)
    }()
    
    @IBOutlet weak var userIdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func fetchBooks(_ sender: Any) {
//        let query:Query = Query()
//        // query body ommitted for brevity
//                self.store.sync() { (count, books, error) -> Void in
//            if let books = books, let count = count {
//                //succeed
//                print("\(count) Books: \(books)") // count is always 0
//            } else {
//                //fail
//                print(error)
//            }
//        }
		
//        let userId = "";
//
//                User.get(userId: userId, completionHandler: { (user, error) in
//            print("get")

//
  //  }
        self.store.sync(){ (result: Result<(UInt, AnyRandomAccessCollection<Book>), [Swift.Error]>) in // only returns count of 0
            switch result {
    case .success(let count, let books):
    print("\(count) Books: \(books)")
   
            
            case .failure(let error):
                if let error = error as? Kinvey.Error {
                    switch error {
//                    case .unauthorized(let httpResponse, let data, let errorMessage, let debugMessage, let description):
//                        print(httpResponse?.statusCode as Any) // 401
//                        print(data!) // 209 bytes
//                        print(errorMessage) // InsufficientCredentials
//                        print(debugMessage)
//                        print(description) // The credentials used to authenticate this request are not authorized to run this operation. Please retry your request with appropriate credentials
//                    case .unknownJsonError(let httpResponse, let data, let jsonObject):
//                        print(httpResponse?.statusCode as Any) // 400
//                        print(data!) // 274 bytes
//                        print(jsonObject) /// ["debug": The script was terminated due to timing constraints: took more than 2000ms to complete. Did you forget to call response.complete() or response.continue()?, "description": The Business Logic script did not complete. Please contact support, "error": BLTimeoutError]
//                    case .invalidResponse(let httpResponse, _):
//                        print(error) // Invalid response from the server
//                        print(httpResponse?.statusCode as Any) // 400
                    default:
                        print(error)
                    }
                }
            }
        }
    }

    @IBAction func createBookButton(_ sender: UIButton) {

        
        let book:Book = Book()
        book.title = "some swift title" // NSNull.init() - if you need to set the value to null

        self.store.save(book) { book, error in
            if let book = book {
                //succeed
                print("Book: \(book)")
            } else {
                //fail
                print("error")

            }
        }
    }
    
    @IBAction func loginWithMIC(_ sender: Any) {
       
        
        // you can use for iOS11+ MICUserInterface safariAuthentication seession - better thing, will fallback to .safari if below iOS11
        User.presentMICViewController(redirectURI: mobileUrlSchemeRedirect, timeout: TimeInterval(60*3), micUserInterface: MICUserInterface.safariAuthenticationSession, currentViewController: self, client: Kinvey.sharedClient){ (user: User?, error: Swift.Error?) -> Void in
            
            if (user != nil) {
                // logged in successfully
                NSLog("Logged in successfully!")
               
                NSLog("Active User \(String(describing: Kinvey.sharedClient.activeUser))")
            } else if (error != nil) {
                NSLog("Error Logging In: " + error.debugDescription)
                print("We are unable to log you in at this time")
            }
        }
            
//        User.presentMICViewController(redirectURI: mobileUrlSchemeRedirect) { user, error in
//            if let user = user {
//                self.userIdLabel.text = user.userId
//            } else {
//                self.userIdLabel.text = error?.localizedDescription ?? "Unknown Error"
//            }
//        }
    }

}


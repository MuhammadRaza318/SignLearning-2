//
//  MainTableViewController.swift
//  SignLearning
//
//  Created by Zain on 09/01/2017.
//  Copyright © 2017 Zain. All rights reserved.
//

import UIKit
import GoogleMobileAds
import UnityAds

class MainTableViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , GADInterstitialDelegate, UnityAdsDelegate{
    
    @IBOutlet weak var bannerView: GADBannerView!
    struct staticVal
    {
        static var isUnityAdd = false
        static var index = 0
        static var mainArray : [String] = ["Alphabets" , "Numbers" , "Greetings and Phrasses" , "Question Words" , "Days and Time Of Day" , "Clothing" , "Family members and People" , "Emotions and Feelings" , "Colors" , "Foods and Meals" , "Health and the body" , "Time" , "Around the house" , "Opposites" , "Nature and the Weather" , "Money" , "A letter words (BSL)" ,"B letter words (BSL)" , "C letter words (BSL)" , "D letter words (BSL)" , "E letter words (BSL)" , "F letter words (BSL)" , "G letter words (BSL)" , "H letter words (BSL)" ,"I letter words (BSL)" , "J letter words (BSL)" , "K letter words (BSL)" , "L letter words (BSL)" , "M letter words (BSL)" , "N letter words (BSL)" , "O letter words (BSL)" , "P letter words (BSL)" , "Q letter words (BSL)" , "R letter words (BSL)" , "S letter words (BSL)" , "T letter words (BSL)" , "U letter words (BSL)" ,"V letter words (BSL)" , "W letter words (BSL)" , "Y letter words (BSL)"]
        
        static var countArray : [Int] = [1,1,2,1,1,1,2,1,1,2,2,1,2,2,1,1]
        static var labelArray : [String] = []
        static var clearFlag = false
        static var interstitialFlag = false
        static var adCounter = 0
        
    }

    @IBOutlet weak var myTableView: UITableView!
    var interstitial: GADInterstitial!
    
   override func viewDidLoad() {
        super.viewDidLoad()

       myTableView.delegate = self
       myTableView.dataSource = self
       myTableView.backgroundColor = UIColor.clear
    bannerView.adUnitID = BANNER_ID
    bannerView.rootViewController = self
    bannerView.load(GADRequest())
    interstitial =   createAndLoadInterstitial()
    initializeUnityAdd()

    
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainTableViewController.staticVal.mainArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        cell.label.text = MainTableViewController.staticVal.mainArray[indexPath.row]
        cell.label.adjustsFontSizeToFitWidth = true
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        MainTableViewController.staticVal.index = indexPath.row
        MainTableViewController.staticVal.adCounter += 1
        if(MainTableViewController.staticVal.adCounter >= interstitialCheck)
        {
            presentInterstitial()
            MainTableViewController.staticVal.adCounter = 0
        }
        if(indexPath.row  < 16)
        {
            let transition = CATransition()
            transition.duration = 0.3
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            self.view.window!.layer.add(transition, forKey: nil)
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
            self.present(viewController!, animated: false, completion: nil)
        }
        else
        {
            let transition = CATransition()
            transition.duration = 0.3
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            self.view.window!.layer.add(transition, forKey: nil)
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "LettersViewController")
            self.present(viewController!, animated: false, completion: nil)
        }
        

    }
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        
        
        interstitial = createAndLoadInterstitial()
    }
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("Ads Receive")
        
    }
    private func createAndLoadInterstitial() -> GADInterstitial{
        
        let interstitial = GADInterstitial(adUnitID:INTER_ID)
        interstitial.delegate = self
        interstitial.load(GADRequest())
        
        return interstitial
    }
    
    func initializeUnityAdd() {
        UnityAds.initialize(UNITY_ID, delegate: self)
    }
    
    func presentUnityAdd() {
        if UnityAds.isReady() {
            UnityAds.show(self)
        }
    }
    
    func presentInterstitial() {
        if MainTableViewController.staticVal.isUnityAdd{
            MainTableViewController.staticVal.isUnityAdd = !MainTableViewController.staticVal.isUnityAdd
            presentUnityAdd()
        }else{
            if interstitial.isReady{
                print("ready")
                MainTableViewController.staticVal.isUnityAdd = !MainTableViewController.staticVal.isUnityAdd
                interstitial.present(fromRootViewController: self)
            }
        }
        
    }

    
    func unityAdsReady(_ placementId: String) {
        
    }
    
    func unityAdsDidError(_ error: UnityAdsError, withMessage message: String) {
        
    }
    
    func unityAdsDidStart(_ placementId: String) {
        
    }
    
    func unityAdsDidFinish(_ placementId: String, with state: UnityAdsFinishState) {
        
    }
    
    func interstitialDidFail(toPresentScreen ad: GADInterstitial) {
        presentUnityAdd()
    }
  

}

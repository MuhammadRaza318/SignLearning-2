//
//  SecondViewController.swift
//  SignLearning
//
//  Created by Zain on 09/01/2017.
//  Copyright © 2017 Zain. All rights reserved.
//

import UIKit
import GoogleMobileAds
import UnityAds

class SecondViewController: UIViewController , GADInterstitialDelegate , GADBannerViewDelegate, UnityAdsDelegate{
    
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var topView: UIView!
    
    var interstitial: GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView.adUnitID = BANNER_ID
        bannerView.rootViewController = self
        bannerView.delegate = self
        bannerView.load(GADRequest())
        interstitial =   createAndLoadInterstitial()
        initializeUnityAdd()

        topLabel.text = MainTableViewController.staticVal.mainArray[MainTableViewController.staticVal.index]
        topLabel.adjustsFontSizeToFitWidth = true
        
        if(MainTableViewController.staticVal.countArray[MainTableViewController.staticVal.index] > 1)
        {
            var height : CGFloat!
            var widht : CGFloat!
            let image1 = UIImage(named: MainTableViewController.staticVal.mainArray[MainTableViewController.staticVal.index] + ".jpg" )
            let image2 = UIImage(named: MainTableViewController.staticVal.mainArray[MainTableViewController.staticVal.index] + "1" + ".jpg" )
            height = (image1?.size.height)! + (image2?.size.height)!
            widht = (image1?.size.width)! + (image2?.size.width)!
            scrollView.contentSize = CGSize(width: widht, height: height)
            imageView1.frame = CGRect(x: 0, y: self.topView.frame.size.height, width: (image1?.size.width)!, height: (image1?.size.height)!)
            let imageView2 = UIImageView(frame : CGRect(x: self.imageView1.frame.size.width, y: self.topView.frame.size.height, width: (image2?.size.width)!, height: (image2?.size.height)!))
            scrollView.addSubview(imageView2)
            imageView1.image = image1
            imageView2.image = image2
            
            MainTableViewController.staticVal.adCounter += 1
            if(MainTableViewController.staticVal.adCounter >= interstitialCheck)
            {
                presentInterstitial()
                MainTableViewController.staticVal.adCounter = 0
            }

        }
        else
        {
            let image = UIImage(named: MainTableViewController.staticVal.mainArray[MainTableViewController.staticVal.index] + ".jpg")
            scrollView.contentSize = CGSize(width: image!.size.width, height: image!.size.height)
            imageView1.frame = CGRect(x: 0, y: self.topView.frame.size.height, width: image!.size.width, height: image!.size.height)
            imageView1.image = UIImage(named: MainTableViewController.staticVal.mainArray[MainTableViewController.staticVal.index] + ".jpg")
            MainTableViewController.staticVal.adCounter += 1
            if(MainTableViewController.staticVal.adCounter >= interstitialCheck)
            {
                presentInterstitial()
                MainTableViewController.staticVal.adCounter = 0
            }
            
        }
    }
    

    
    @IBAction func backAction(_ sender: Any) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainTableViewController")
        self.present(viewController!, animated: false, completion: nil)
        
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
            if (interstitial.isReady) {
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
    
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        self.bannerView.isHidden = false
        self.scrollView.frame = CGRect(x: 0, y: self.topView.frame.size.height, width: self.scrollView.frame.size.width, height: self.view.frame.size.height - (self.topView.frame.size.height + self.bannerView.frame.size.height))
        
               self.bannerView.frame = CGRect(x: 0, y: self.topView.frame.size.height + self.scrollView.frame.size.height, width: self.bannerView.frame.size.width, height: self.bannerView.frame.size.height)
        
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        self.scrollView.frame = CGRect(x: 0, y: self.topView.frame.size.height, width: self.scrollView.frame.size.width, height: self.view.frame.size.height - (self.topView.frame.size.height ))
        
               self.bannerView.isHidden = true
    }

    
}

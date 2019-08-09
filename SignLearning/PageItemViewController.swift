//
//  PageItemViewController.swift
//  SignLearning
//
//  Created by Zain on 09/01/2017.
//  Copyright © 2017 Zain. All rights reserved.
//

import UIKit
import GoogleMobileAds
import UnityAds

class PageItemViewController: UIViewController , GADInterstitialDelegate , GADBannerViewDelegate, UnityAdsDelegate{
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    struct staticVal
    {
        static var interstitial: GADInterstitial!
    }
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    var itemIndex: Int = 0
    var imageName: String = "" {
        didSet {
            
            if let imageView = contentImageView {
                imageView.image = UIImage(named: imageName)
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topLabel.text = MainTableViewController.staticVal.mainArray[MainTableViewController.staticVal.index]
        topLabel.adjustsFontSizeToFitWidth = true
        label.text = MainTableViewController.staticVal.labelArray[itemIndex].uppercased()
        if(MainTableViewController.staticVal.clearFlag == true)
        {
            label.alpha = 0
        }
        else
        {
            label.alpha = 1
        }
        
        contentImageView.image = UIImage(named: imageName + ".png")
        bannerView.adUnitID = BANNER_ID
        bannerView.delegate = self
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        initializeUnityAdd()
        if(MainTableViewController.staticVal.interstitialFlag == false)
        {
            PageItemViewController.staticVal.interstitial =   createAndLoadInterstitial()
            MainTableViewController.staticVal.interstitialFlag = true
        }
        
        

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        MainTableViewController.staticVal.adCounter += 1
        if(MainTableViewController.staticVal.adCounter >= interstitialCheck)
        {
            self.presentInterstitial()
            MainTableViewController.staticVal.adCounter = 0
        }
    }
    
    @IBAction func back(_ sender: Any) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainTableViewController")
        self.present(viewController!, animated: false, completion: nil)
    }
    
    @IBAction func clearLabel(_ sender: Any) {
        
        if(MainTableViewController.staticVal.clearFlag == false)
        {
            UIView.animate(withDuration: 1.0, animations: {
                self.label.alpha = 0
            }, completion: { (Bool) in
                MainTableViewController.staticVal.clearFlag = true
            })
        }
        else
        {
            UIView.animate(withDuration: 1.0, animations: {
                self.label.alpha = 1
            }, completion: { (Bool) in
                MainTableViewController.staticVal.clearFlag = false
            })
        }
        
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        
        
      PageItemViewController.staticVal.interstitial = createAndLoadInterstitial()
        MainTableViewController.staticVal.interstitialFlag = true
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
            if (staticVal.interstitial.isReady) {
                print("ready")
                MainTableViewController.staticVal.isUnityAdd = !MainTableViewController.staticVal.isUnityAdd
                staticVal.interstitial.present(fromRootViewController: self)
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
        self.contentImageView.frame = CGRect(x: 0, y: self.topView.frame.size.height, width: self.contentImageView.frame.size.width, height: self.view.frame.size.height - (self.topView.frame.size.height + self.labelView.frame.size.height +  self.bannerView.frame.size.height))
        
        self.labelView.frame = CGRect(x: 0, y: self.topView.frame.size.height + self.contentImageView.frame.size.height , width: self.labelView.frame.size.width, height: self.labelView.frame.size.height)
        self.bannerView.frame = CGRect(x: 0, y: self.topView.frame.size.height + self.contentImageView.frame.size.height + self.labelView.frame.size.height, width: self.bannerView.frame.size.width, height: self.bannerView.frame.size.height)
        self.image.frame = CGRect(x: self.image.frame.origin.x, y: self.labelView.frame.origin.y - self.image.frame.size.height, width: self.image.frame.size.width, height: self.image.frame.size.height)
        
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        self.contentImageView.frame = CGRect(x: 0, y: self.topView.frame.size.height, width: self.contentImageView.frame.size.width, height: self.view.frame.size.height - (self.topView.frame.size.height + self.labelView.frame.size.height ))
        
        self.labelView.frame = CGRect(x: 0, y: self.topView.frame.size.height + self.contentImageView.frame.size.height , width: self.labelView.frame.size.width, height: self.labelView.frame.size.height)
         self.image.frame = CGRect(x: self.image.frame.origin.x, y: self.labelView.frame.origin.y - self.image.frame.size.height, width: self.image.frame.size.width, height: self.image.frame.size.height)
        self.bannerView.isHidden = true
    }
}

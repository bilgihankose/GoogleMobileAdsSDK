//
//  ViewController.swift
//  GoogleMobileAdsSDK
//
//  Created by Bilgihan Köse on 15.05.2020.
//  Copyright © 2020 Bilgihan Kose. All rights reserved.
//

import GoogleMobileAds
import UIKit

class ViewController: UIViewController, GADBannerViewDelegate {

    var bannerView: DFPBannerView!


  var interstitial: DFPInterstitial!

  override func viewDidLoad() {
    super.viewDidLoad()
    interstitial = DFPInterstitial(adUnitID: "/6499/example/interstitial")
    let request = DFPRequest()
    interstitial.load(request)
   
    bannerView = DFPBannerView(adSize: kGADAdSizeBanner)

    addBannerViewToView(bannerView)
    bannerView.adUnitID = "/6499/example/banner"
    bannerView.rootViewController = self
     bannerView.load(DFPRequest())
      bannerView.delegate = self
    
  }
    @IBAction func adsDownload(_ sender: UIButton) {
        
        if interstitial.isReady {
          interstitial.present(fromRootViewController: self)
        } else {
          print("Ad wasn't ready")
        }
    }
    
    func addBannerViewToView(_ bannerView: DFPBannerView) {
     bannerView.translatesAutoresizingMaskIntoConstraints = false
     view.addSubview(bannerView)
     view.addConstraints(
       [NSLayoutConstraint(item: bannerView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: bottomLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0),
        NSLayoutConstraint(item: bannerView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0)
       ])
    }
    
}


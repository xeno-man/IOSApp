//
//  Sharing manager.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 30/12/2021.
//
import Social
import SwiftUI
public protocol SocialMediaShareable {
    func image() -> UIImage?
    func url() -> URL?
    func text() -> String?
}
public class SocialMediaSharingManager {
    public static func shareOnFacebook(object: SocialMediaShareable, from presentingVC: UIViewController) {
        share(object: object, for: SLServiceTypeFacebook, from: presentingVC)
    }
    public static func shareOnTwitter(object: SocialMediaShareable, from presentingVC: UIViewController) {
        share(object: object, for: SLServiceTypeTwitter, from: presentingVC)
    }
    private static func share(object: SocialMediaShareable, for serviceType: String, from presentingVC: UIViewController) {
        if let composeVC = SLComposeViewController(forServiceType:serviceType) {
            composeVC.add(object.image())
            composeVC.add(object.url())
            composeVC.setInitialText(object.text())
            presentingVC.present(composeVC, animated: true, completion: nil)
        }
    }
}

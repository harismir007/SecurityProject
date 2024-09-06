//
//  uiview+Extension.swift
//  FoodBoy
//
//  Created by ZeeshanFayyaz on 17/04/2019.
//  Copyright © 2019 Eashwar. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func setBorder(radius:CGFloat, color: UIColor = UIColor.clear) -> UIView{
        let roundView:UIView = self
        roundView.layer.cornerRadius = CGFloat(radius)
        roundView.layer.borderWidth = 1
        roundView.layer.borderColor = color.cgColor
        roundView.clipsToBounds = true
        return roundView
    }
}



//Mark: - site https://spin.atomicobject.com/2017/07/18/swift-interface-builder/
@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

//Mark: - associateObjectValue variable
var associateObjectValue: Int = 0

extension UIView {
    
   // @IBInspectable
//    var cornerRadius: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        set {
//            layer.cornerRadius = newValue
//        }
//    }
    
  //  @IBInspectable
//    var borderWidth: CGFloat {
//        get {
//            return layer.borderWidth
//        }
//        set {
//            layer.borderWidth = newValue
//        }
//    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    //Mark: - Shimmer Animation Extension
    
    fileprivate var isAnimate: Bool {
        get {
            return objc_getAssociatedObject(self, &associateObjectValue) as? Bool ?? false
        }
        set {
            return objc_setAssociatedObject(self, &associateObjectValue, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    @IBInspectable var shimmerAnimation: Bool {
        get {
            return isAnimate
        }
        set {
            self.isAnimate = newValue
        }
    }
    
    func subviewsRecursive() -> [UIView] {
        return subviews + subviews.flatMap { $0.subviewsRecursive() }
    }
    
    @IBInspectable var RoundCorners: Bool {
        get {
            return true
        }
        set {
            //self.isAnimate = newValue
            
            self.layer.cornerRadius = self.bounds.height * 0.5
//            self.layer.masksToBounds = true
            self.clipsToBounds = true
        }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    
    
    @IBInspectable var ViewBottomline: Bool{
        get {
            return true
        }
        set {
            if newValue{
                Viewunderline(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            }
        }
    }
    func Viewunderline(color: CGColor){
            
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width, height: 1.5)
            bottomLine.backgroundColor = color
            // Remove border on text field
          //  self.borderStyle = .none
            
            // Add the line to the text field
            self.layer.addSublayer(bottomLine)
            
        
    }
}

func showShimerCon(onVC: UIViewController) {
    let SB = UIStoryboard(name: "Main", bundle: nil)
    let controller = SB.instantiateViewController(withIdentifier: "ShimmerAnimationControllerViewController")
    
    controller.view.frame = onVC.view.bounds
    controller.willMove(toParent: onVC)
    onVC.view.addSubview(controller.view)
    onVC.addChild(controller)
    controller.didMove(toParent: onVC)
}

func RemoveShimerCon(FromVC: UIViewController?) {
//    let SB = UIStoryboard(name: "Main", bundle: nil)
//    let controller = SB.instantiateViewController(withIdentifier: "ShimmerAnimationControllerViewController")
    
    FromVC?.view.alpha = 1
    FromVC?.willMove(toParent: nil)
    FromVC?.view.removeFromSuperview()
    FromVC?.removeFromParent()
//    controller.view.isHidden = true
//    controller.dismiss(animated: true, completion: nil)
    
//    if FromVC.children.count > 0{
//        let vc:[UIViewController] = FromVC.children
//        for viewContoller in vc{
//
//            if viewContoller.isKind(of: ShimmerAnimationControllerViewController.self)
//            {
//                viewContoller.view.alpha = 1
//                viewContoller.willMove(toParent: nil)
//                viewContoller.view.removeFromSuperview()
//                viewContoller.removeFromParent()
//                viewContoller.view.isHidden = true
//                viewContoller.dismiss(animated: true, completion: nil)
//
//                return
//            }
//        }
//    }
}

//Mark :- Shimmer Global function to start/stop Shimmer

func getSubViewsForAnimate(vc: UIView) -> [UIView] {
    
    var obj: [UIView] = []
    for objView in vc.subviewsRecursive() {
        obj.append(objView)
    }
    return obj.filter({ (obj) -> Bool in
        obj.shimmerAnimation
    })
}
extension UITextField{
    //    MARK: - Textfield Padding
    
    @IBInspectable var paddingLeftCustom: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }

    @IBInspectable var paddingRightCustom: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
    @IBInspectable var RightImage: UIImage {
        get {
            return #imageLiteral(resourceName: "check-mark (1)")
        }
        set {
            let Rightimageview = UIImageView(frame:CGRect(x: 0.0, y: 0.0, width: 20, height: 20))
            Rightimageview.image = newValue
            Rightimageview.contentMode = .scaleAspectFit
            
            let viewRight: UIView = UIView(frame: CGRect(x:0, y:0,  width:16, height: self.frame.height))// set per your requirement
            Rightimageview.center = viewRight.center
            viewRight.addSubview(Rightimageview)
            
            self.rightView = viewRight
            self.rightViewMode = .always
        }
    }
    
    @IBInspectable var leftImage: UIImage {
        get {
            return #imageLiteral(resourceName: "check-mark (1)")
        }
        set {
            let leftimageview = UIImageView(frame:CGRect(x: 0.0, y: 0.0, width: 20, height: 20))
            leftimageview.image = newValue
            leftimageview.contentMode = .scaleAspectFit
            
            let viewLeft: UIView = UIView(frame: CGRect(x:0, y:0,  width:self.frame.height, height: self.frame.height))// set per your requirement
            leftimageview.center = viewLeft.center
            viewLeft.addSubview(leftimageview)
            
            self.leftView = viewLeft
            self.leftViewMode = .always
        }
    }
    @IBInspectable var Bottomline: Bool{
        get {
            return true
        }
        set {
            if newValue{
                underline(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            }
        }
    }
    func underline(color: CGColor){
            
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width, height: 1.5)
            bottomLine.backgroundColor = color
            // Remove border on text field
            self.borderStyle = .none
            
            // Add the line to the text field
            self.layer.addSublayer(bottomLine)
            
        
    }
  
    @IBInspectable var Localize:String {
        
        get {
            return "val"
            
        }
        
        set{
        if newValue != ""
        {
            //self.text = newValue.localize()
        }
            
    }
    }
}


//MARK:-

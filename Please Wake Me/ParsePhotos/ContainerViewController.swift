//
//  ContainerViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit
import QuartzCore
import Parse

/*
This will let you keep track of the current state of the side panels, so you can tell whether neither panel is visible, or one of the left or right panels are visible.
*/
enum SlideOutState {
    case BothCollapsed
    case LeftPanelExpanded
    case RightPanelExpanded
}


class ContainerViewController: UIViewController {
    
    var centerNavigationController: UINavigationController!
    var centerViewController: CenterViewController!
    
    //    These will hold the current state, and the left side panel view controller itself:
    //    The current state is initialized to be .BothCollapsed – that is, neither of the side panels are visible when the app first loads. The leftViewController property is an optional, because you’ll be adding and removing the view controller at various times, so it might not always have a value.
    var currentState: SlideOutState = .BothCollapsed {
        didSet {
            let shouldShowShadow = currentState != .BothCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
    
    var leftViewController: SidePanelViewController?
    var rightViewController: SidePanelViewController?
    
    //This value is the width, in points, of the center view controller that will be left visible once it has animated offscreen. 60 points should do it.
    let centerPanelExpandedOffset: CGFloat = 60
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        centerViewController = UIStoryboard.centerViewController()
        centerViewController.delegate = self
        
        // wrap the centerViewController in a navigation controller, so we can push views to it
        // and display bar button items in the navigation bar
        centerNavigationController = UINavigationController(rootViewController: centerViewController)
        view.addSubview(centerNavigationController.view)
        addChildViewController(centerNavigationController)
        
        centerNavigationController.didMoveToParentViewController(self)
        
        
        //        The above code defines a UIPanGestureRecognizer and assigns handlePanGesture(_:) to it to handle any detected pan gestures. (You will write the code for that method in a moment.)
        //        By default, a pan gesture recognizer detects a single touch with a single finger, so it doesn’t need any extra configuration. All that’s required is to add the newly created gesture recognizer to centerNavigationController.view.
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
        centerNavigationController.view.addGestureRecognizer(panGestureRecognizer)
        
    }
}


private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
    
    class func leftViewController() -> SidePanelViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("LeftViewController") as? SidePanelViewController
    }
    
    class func rightViewController() -> SidePanelViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("RightViewController") as? SidePanelViewController
    }
    
    class func centerViewController() -> CenterViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("CenterViewController") as? CenterViewController
    }
}


//make this class a UIGestureRecognizerDelegate by adding an extension

//The pan gesture recognizer detects pans in any direction, but you’re only interested in horizontal movement. First, you set up the gestureIsDraggingFromLeftToRight Boolean to check for this.
//    There are three states that need to be tracked: UIGestureRecognizerState.Began, UIGestureRecognizerState.Changed, and UIGestureRecognizerState.Ended:
//Began: If the user starts panning, and neither panel is visible then show the correct panel based on the pan direction.
//Changed: If the user is already panning, translate the center view controller’s view by the amount that the user has panned
//Ended: When the pan ends, check whether the left or right view controller is visible. Depending on which one is visible and how far the pan has gone, perform the animation.
//You can move the center view around, and show and hide the left and right views using a combination of these three states, as well as the location and velocity / direction of the pan gesture.
//For example, if the gesture direction is right, then show the left panel. If the direction is left, then show the right panel.

extension ContainerViewController: UIGestureRecognizerDelegate {
    // MARK: Gesture recognizer
    
    func handlePanGesture(recognizer: UIPanGestureRecognizer) {
        let gestureIsDraggingFromLeftToRight = (recognizer.velocityInView(view).x > 0)
        
        switch(recognizer.state) {
        case .Began:
            if (currentState == .BothCollapsed) {
                if (gestureIsDraggingFromLeftToRight) {
                    addLeftPanelViewController()
                } else {
                    addRightPanelViewController()
                }
                
                showShadowForCenterViewController(true)
            }
        case .Changed:
            recognizer.view!.center.x = recognizer.view!.center.x + recognizer.translationInView(view).x
            recognizer.setTranslation(CGPointZero, inView: view)
        case .Ended:
            if (leftViewController != nil) {
                // animate the side panel open or closed based on whether the view has moved more or less than halfway
                let hasMovedGreaterThanHalfway = recognizer.view!.center.x > view.bounds.size.width
                animateLeftPanel(shouldExpand: hasMovedGreaterThanHalfway)
            } else if (rightViewController != nil) {
                let hasMovedGreaterThanHalfway = recognizer.view!.center.x < 0
                animateRightPanel(shouldExpand: hasMovedGreaterThanHalfway)
            }
        default:
            break
        }
    }
}

// MARK: CenterViewController delegate

extension ContainerViewController: CenterViewControllerDelegate {
    //    First, this method checks whether the left side panel is already expanded or not. If it’s not already visible, then the panel is added and animated to its ‘open’ position. If the panel is already visible, then it will be animated to its ‘closed’ position.
    func toggleLeftPanel() {
        let notAlreadyExpanded = (currentState != .LeftPanelExpanded)
        
        if notAlreadyExpanded {
            addLeftPanelViewController()
        }
        
        animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
    
    func toggleRightPanel() {
        let notAlreadyExpanded = (currentState != .RightPanelExpanded)
        
        if notAlreadyExpanded {
            addRightPanelViewController()
        }
        
        animateRightPanel(shouldExpand: notAlreadyExpanded)
    }
    
    //    The code below first checks to see if the leftViewController property is nil. If it is, then the code creates a new SidePanelViewController, and assigns it a list of animals to display – in this case, cats!
    func addLeftPanelViewController() {
        if (leftViewController == nil) {
            leftViewController = UIStoryboard.leftViewController()
            //            leftViewController!.animals = Animal.allCats()
            
            addChildSidePanelController(leftViewController!)
        }
    }
    func addRightPanelViewController() {
        if (rightViewController == nil) {
            rightViewController = UIStoryboard.rightViewController()
            //            rightViewController!.animals = Animal.allDogs()
            
            addChildSidePanelController(rightViewController!)
        }
    }
    //    This method inserts the child view into the container view controller. This is much the same as adding the center view controller earlier. It simply inserts its view (in this case it’s inserted at z-index 0, which means that it will be below the center view controller) and adds it as a child view controller.
    func addChildSidePanelController(sidePanelController: SidePanelViewController) {
        view.insertSubview(sidePanelController.view, atIndex: 0)
        
        addChildViewController(sidePanelController)
        sidePanelController.didMoveToParentViewController(self)
    }
    
    //    This is where the actual animation happens. The center view controller’s view is animated to the specified position, with a nice spring animation. The method also takes an optional completion closure, which it passes on to the UIView animation. You can try tweaking the duration and spring damping parameters if you want to change the appearance of the animation.
    func animateCenterPanelXPosition(#targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
            self.centerNavigationController.view.frame.origin.x = targetPosition
            }, completion: completion)
    }
    //    This method simply checks whether it’s been told to expand or collapse the side panel. If it should expand, then it sets the current state to indicate that the left panel is expanded, and then animates the center panel so it’s open. Otherwise, it animates the center panel closed and then removes its view and sets the current state to indicate that it’s closed.
    func animateLeftPanel(#shouldExpand: Bool) {
        if (shouldExpand) {
            currentState = .LeftPanelExpanded
            
            animateCenterPanelXPosition(targetPosition: CGRectGetWidth(centerNavigationController.view.frame) - centerPanelExpandedOffset)
        } else {
            animateCenterPanelXPosition(targetPosition: 0) { finished in
                self.currentState = .BothCollapsed
                
                self.leftViewController!.view.removeFromSuperview()
                self.leftViewController = nil;
            }
        }
    }
    func animateRightPanel(#shouldExpand: Bool) {
        if (shouldExpand) {
            currentState = .RightPanelExpanded
            
            animateCenterPanelXPosition(targetPosition: -CGRectGetWidth(centerNavigationController.view.frame) + centerPanelExpandedOffset)
        } else {
            animateCenterPanelXPosition(targetPosition: 0) { _ in
                self.currentState = .BothCollapsed
                
                self.rightViewController!.view.removeFromSuperview()
                self.rightViewController = nil;
            }
        }
    }
    
    //    This adjusts the opacity of the navigation controller’s shadow to make it visible or hidden. You can implement a didSet observer to add or remove the shadow whenever the currentState property changes.
    func showShadowForCenterViewController(shouldShowShadow: Bool) {
        if (shouldShowShadow) {
            centerNavigationController.view.layer.shadowOpacity = 1.0
        } else {
            centerNavigationController.view.layer.shadowOpacity = 0.0
        }
    }
}
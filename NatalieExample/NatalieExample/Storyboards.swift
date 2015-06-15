//
// Autogenerated by Natalie - Storyboard Generator Script.
// http://blog.krzyzanowskim.com
//

import UIKit

//MARK: - Storyboards
struct Storyboards {

    struct Main {

        static let identifier = "Main"

        static var storyboard:UIStoryboard {
            return UIStoryboard(name: self.identifier, bundle: nil)
        }

        static func instantiateInitialViewController() -> UINavigationController! {
            return self.storyboard.instantiateInitialViewController() as! UINavigationController
        }

        static func instantiateViewControllerWithIdentifier(identifier: String) -> UIViewController {
            return self.storyboard.instantiateViewControllerWithIdentifier(identifier) as! UIViewController
        }

        static func instantiateMainViewController() -> MainViewController! {
            return self.storyboard.instantiateViewControllerWithIdentifier("MainViewController") as! MainViewController

        }

        static func instantiateScreenTwoViewController() -> ScreenTwoViewController! {
            return self.storyboard.instantiateViewControllerWithIdentifier("ScreenTwoViewController") as! ScreenTwoViewController

        }

        static func instantiateScreenOneViewController() -> ScreenOneViewController! {
            return self.storyboard.instantiateViewControllerWithIdentifier("ScreenOneViewController") as! ScreenOneViewController

        }
    }
}

//MARK: - ReusableKind
enum ReusableKind: String, Printable {
    case TableViewCell = "tableViewCell"
    case CollectionViewCell = "collectionViewCell"

    var description: String { return self.rawValue }
}

//MARK: - SegueKind
enum SegueKind: String, Printable {    
    case Relationship = "relationship" 
    case Show = "show"                 
    case Presentation = "presentation" 
    case Embed = "embed"               
    case Unwind = "unwind"             

    var description: String { return self.rawValue } 
}

//MARK: - SegueProtocol
public protocol IdentifiableProtocol: Equatable {
    var identifier: String? { get }
}

public protocol SegueProtocol: IdentifiableProtocol {
}

public func ==<T: SegueProtocol, U: SegueProtocol>(lhs: T, rhs: U) -> Bool {
   return lhs.identifier == rhs.identifier
}

public func ~=<T: SegueProtocol, U: SegueProtocol>(lhs: T, rhs: U) -> Bool {
   return lhs.identifier == rhs.identifier
}

//MARK: - ReusableProtocol
public protocol ReusableProtocol: IdentifiableProtocol {
    var viewType: UIView.Type? {get}
}

public func ==<T: ReusableProtocol, U: ReusableProtocol>(lhs: T, rhs: U) -> Bool {
   return lhs.identifier == rhs.identifier
}

//MARK: - Protocol Implementation
extension UIStoryboardSegue: SegueProtocol {
}

extension UICollectionReusableView: ReusableProtocol {
    public var viewType: UIView.Type? { return self.dynamicType}
    public var identifier: String? { return self.reuseIdentifier}
}

extension UITableViewCell: ReusableProtocol {
    public var viewType: UIView.Type? { return self.dynamicType}
    public var identifier: String? { return self.reuseIdentifier}
}

//MARK: - UIViewController extension
extension UIViewController {
    func performSegue<T: SegueProtocol>(segue: T, sender: AnyObject?) {
       performSegueWithIdentifier(segue.identifier, sender: sender)
    }
}

//MARK: - UICollectionViewController

extension UICollectionViewController {

    func dequeueReusableCell<T: ReusableProtocol>(reusable: T, forIndexPath: NSIndexPath!) -> AnyObject {
        return self.collectionView!.dequeueReusableCellWithReuseIdentifier(reusable.identifier!, forIndexPath: forIndexPath)
    }

    func registerReusable<T: ReusableProtocol>(reusable: T) {
        if let type = reusable.viewType, identifier = reusable.identifier {
            self.collectionView?.registerClass(type, forCellWithReuseIdentifier: identifier)
        }
    }

    func dequeueReusableSupplementaryViewOfKind<T: ReusableProtocol>(elementKind: String, withReusable reusable: T, forIndexPath: NSIndexPath!) -> AnyObject {
        return self.collectionView!.dequeueReusableSupplementaryViewOfKind(elementKind, withReuseIdentifier: reusable.identifier!, forIndexPath: forIndexPath)
    }

    func registerReusable<T: ReusableProtocol>(reusable: T, forSupplementaryViewOfKind elementKind: String) {
        if let type = reusable.viewType, identifier = reusable.identifier {
            self.collectionView?.registerClass(type, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: identifier)
        }
    }
}
//MARK: - UITableViewController

extension UITableViewController {

    func dequeueReusableCell<T: ReusableProtocol>(reusable: T, forIndexPath: NSIndexPath!) -> AnyObject {
        return self.tableView!.dequeueReusableCellWithIdentifier(reusable.identifier!, forIndexPath: forIndexPath)
    }

    func registerReusableCell<T: ReusableProtocol>(reusable: T) {
        if let type = reusable.viewType, identifier = reusable.identifier {
            self.tableView?.registerClass(type, forCellReuseIdentifier: identifier)
        }
    }

    func dequeueReusableHeaderFooter<T: ReusableProtocol>(reusable: T) -> AnyObject? {
        if let identifier = reusable.identifier {
            return self.tableView?.dequeueReusableHeaderFooterViewWithIdentifier(identifier)
        }
        return nil
    }

    func registerReusableHeaderFooter<T: ReusableProtocol>(reusable: T) {
        if let type = reusable.viewType, identifier = reusable.identifier {
             self.tableView?.registerClass(type, forHeaderFooterViewReuseIdentifier: identifier)
        }
    }
}

//MARK: - MainViewController
extension UIStoryboardSegue {
    func selection() -> MainViewController.Segue? {
        if let identifier = self.identifier {
            return MainViewController.Segue(rawValue: identifier)
        }
        return nil
    }
}

extension MainViewController { 

    enum Segue: String, Printable, SegueProtocol {
        case ScreenOneSegueButton = "ScreenOneSegueButton"
        case ScreenOneSegue = "ScreenOneSegue"
        case ScreenTwoSegue = "ScreenTwoSegue"
        case SceneOneGestureRecognizerSegue = "SceneOneGestureRecognizerSegue"

        var kind: SegueKind? {
            switch (self) {
            case ScreenOneSegueButton:
                return SegueKind(rawValue: "push")
            case ScreenOneSegue:
                return SegueKind(rawValue: "push")
            case ScreenTwoSegue:
                return SegueKind(rawValue: "push")
            case SceneOneGestureRecognizerSegue:
                return SegueKind(rawValue: "push")
            default:
                preconditionFailure("Invalid value")
                break
            }
        }

        var destination: UIViewController.Type? {
            switch (self) {
            case ScreenOneSegueButton:
                return ScreenOneViewController.self
            case ScreenOneSegue:
                return ScreenOneViewController.self
            case ScreenTwoSegue:
                return ScreenTwoViewController.self
            case SceneOneGestureRecognizerSegue:
                return ScreenOneViewController.self
            default:
                assertionFailure("Unknown destination")
                return nil
            }
        }

        var identifier: String? { return self.description } 
        var description: String { return self.rawValue }
    }

}

//MARK: - ScreenTwoViewController

//MARK: - ScreenOneViewController

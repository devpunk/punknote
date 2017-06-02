import UIKit

protocol DefinitionProtocol
{
    init()
    
    var model:Any { get }
    var view:UIView.Type { get }
}

import UIKit

class VShareImage:UIView
{
    private let kMarginHorizontal:CGFloat = 20
    
    init(modelHomeItem:MHomeItem, noteFrame:DNoteFrame)
    {
        let width:CGFloat = MShare.width
        let height:CGFloat = MShare.height
        let frame:CGRect = CGRect(
            x:0,
            y:0,
            width:width,
            height:height)
        
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.black
        isUserInteractionEnabled = false
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        label.font = modelHomeItem.font()
        label.text = noteFrame.text
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        
        addSubview(label)
        
        NSLayoutConstraint.equalsVertical(
            view:label, toView: <#T##UIView#>)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}

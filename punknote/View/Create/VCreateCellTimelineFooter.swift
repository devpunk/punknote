import UIKit

class VCreateCellTimelineFooter:UICollectionReusableView
{
    private weak var controller:CCreate?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setImage(
            self,
            for:UIControlState.normal)
        button.setImage(
            <#T##image: UIImage?##UIImage?#>,
            for:UIControlState.highlighted)
        button.imageView!.clipsToBounds = true
        button.imageView!.contentMode = UIViewContentMode.center
        button.addTarget(
            self,
            action:#selector(actionAdd(sender:)),
            for:UIControlEvents.touchUpInside)

        addSubview(button)
        
        NSLayoutConstraint.equals(
            view:button,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionAdd(sender button:UIButton)
    {
        controller?.addFrame()
    }
    
    //MARK: public
    
    func config(controller:CCreate)
    {
        self.controller = controller
    }
}

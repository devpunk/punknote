import UIKit

class VCreate:View
{
    private let kBarHeight:CGFloat = 70
    private let kTimelineHeight:CGFloat = 80
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        
        guard
            
            let cCreate:CCreate = controller as? CCreate
        
        else
        {
            return
        }
        
        let viewBar:VCreateBar = VCreateBar(controller:cCreate)
        
        let viewTimeline:VCreateTimeline = VCreateTimeline(controller:cCreate)
        
        addSubview(viewBar)
        addSubview(viewTimeline)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewTimeline,
            toView:viewBar)
        NSLayoutConstraint.height(
            view:viewTimeline,
            constant:kTimelineHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewTimeline,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}

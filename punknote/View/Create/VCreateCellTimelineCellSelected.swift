import UIKit

class VCreateCellTimelineCellSelected:UIView
{
    private let kCircleMargin:CGFloat = 3
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func draw(_ rect:CGRect)
    {
        guard
        
            let context:CGContext = UIGraphicsGetCurrentContext()
        
        else
        {
            return
        }
        
        let width:CGFloat = rect.size.width
        let width_2:CGFloat = width / 2.0
        let width_2_margin:CGFloat = width_2 - kCircleMargin
        let centerPoint:CGPoint = CGPoint(x:width_2, y:width_2)
        
    }
}

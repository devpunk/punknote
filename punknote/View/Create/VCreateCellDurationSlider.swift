import UIKit

class VCreateCellDurationSlider:UIView
{
    private weak var layoutGradientWidth:NSLayoutConstraint!
    private let kCornerRadius:CGFloat = 10
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = kCornerRadius
        
        let colorStart:UIColor = UIColor(white:0, alpha:0.2)
        let colorEnd:UIColor = UIColor(white:0, alpha:0.95)
        
        let viewGradient:VGradient = VGradient.horizontal(
            colorLeft:colorStart,
            colorRight:colorEnd)
        
        addSubview(viewGradient)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}

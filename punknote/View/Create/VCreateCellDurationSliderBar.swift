import UIKit

class VCreateCellDurationSliderBar:UIView
{
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        
        let blur:VBlur = VBlur.light()
        blur.alpha = 1
        
        let colorStart:UIColor = UIColor(white:1, alpha:0.1)
        let colorEnd:UIColor = UIColor.white
        
        let viewGradient:VGradient = VGradient.horizontal(
            colorLeft:colorStart,
            colorRight:colorEnd)
        
        addSubview(viewGradient)
        addSubview(blur)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
            toView:self)
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}

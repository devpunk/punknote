import UIKit

class VCreateCellDurationSlider:UIView
{
    private weak var layoutGradientWidth:NSLayoutConstraint!
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        
        let viewGradient:VGradient = VGradient.diagonal(colorLeftBottom: <#T##UIColor#>, colorTopRight: <#T##UIColor#>)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}

import UIKit

class VCreateCellDuration:VCreateCell
{
    private weak var viewSlider:VCreateCellDurationSlider!
    private let kVerticalMargin:CGFloat = 15
    private let kHorizontalMargin:CGFloat = 10
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let viewSlider:VCreateCellDurationSlider = VCreateCellDurationSlider()
        self.viewSlider = viewSlider
        
        addSubview(viewSlider)
        
        NSLayoutConstraint.equalsVertical(
            view:viewSlider,
            toView:self,
            margin:kVerticalMargin)
        NSLayoutConstraint.equalsHorizontal(
            view:viewSlider,
            toView:self,
            margin:kHorizontalMargin)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(controller: CCreate, model: MCreateContentProtocol)
    {
        
    }
}

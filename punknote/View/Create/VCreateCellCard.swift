import UIKit

class VCreateCellCard:VCreateCell
{
    private weak var viewText:VCreateCellCardText!
    private var viewBar:VCreateCellCardBar!
    private let kBorderHeight:CGFloat = 1
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        backgroundColor = UIColor.punkPurple
        
        let borderTop:VBorder = VBorder(color:UIColor.black)
        let borderBottom:VBorder = VBorder(color:UIColor.black)
        
        let viewBar:VCreateCellCardBar = VCreateCellCardBar()
        self.viewBar = viewBar
        
        let viewText:VCreateCellCardText = VCreateCellCardText()
        viewText.inputAccessoryView = viewBar
        self.viewText = viewText
        
        addSubview(borderTop)
        addSubview(borderBottom)
        addSubview(viewText)
        
        NSLayoutConstraint.topToTop(
            view:borderTop,
            toView:self)
        NSLayoutConstraint.height(
            view:borderTop,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:borderTop,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:borderBottom,
            toView:self)
        NSLayoutConstraint.height(
            view:borderBottom,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:borderBottom,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewText,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(controller:CCreate, model:MCreateContentProtocol)
    {
        super.config(controller:controller, model:model)
        viewText.config(model:controller.model)
    }
}

import UIKit

class VCreateCellFontNameCell:UICollectionViewCell
{
    private weak var viewBorder:VBorder!
    private let colorSelected:UIColor
    private let colorNotSelected:UIColor
    private let kBorderHeight:CGFloat = 20
    
    override init(frame:CGRect)
    {
        colorSelected = UIColor.punkPurple
        colorNotSelected = UIColor(white:0.7, alpha:1)
        
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let viewBorder:VBorder = VBorder(color:colorNotSelected)
        self.viewBorder = viewBorder
        
        addSubview(viewBorder)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewBorder,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBorder,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBorder,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: private
    
    private func hover()
    {
        if isSelected || isHighlighted
        {
            viewBorder.backgroundColor = colorSelected
        }
        else
        {
            viewBorder.backgroundColor = colorNotSelected
        }
    }
    
    //MARK: public
    
    func config(model:MCreateContentFontName)
    {
        hover()
    }
}

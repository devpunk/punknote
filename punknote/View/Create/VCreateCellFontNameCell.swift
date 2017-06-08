import UIKit

class VCreateCellFontNameCell:UICollectionViewCell
{
    private weak var viewBorder:VBorder!
    private weak var labelType:UILabel!
    private weak var labelName:UILabel!
    private weak var model:MCreateFontItem?
    private let colorSelected:UIColor
    private let colorNotSelected:UIColor
    private let kAlphaSelected:CGFloat = 1
    private let kAlphaNotSelected:CGFloat = 0.3
    private let kBorderHeight:CGFloat = 25
    private let kFontSizeType:CGFloat = 50
    private let kBorderWidth:CGFloat = 1
    
    override init(frame:CGRect)
    {
        colorSelected = UIColor.punkPurple
        colorNotSelected = UIColor(white:0.8, alpha:1)
        
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        layer.borderWidth = kBorderWidth
        
        let viewBorder:VBorder = VBorder(color:colorNotSelected)
        self.viewBorder = viewBorder
        
        let labelType:UILabel = UILabel()
        labelType.translatesAutoresizingMaskIntoConstraints = false
        labelType.backgroundColor = UIColor.clear
        labelType.isUserInteractionEnabled = false
        labelType.textColor = UIColor.black
        labelType.textAlignment = NSTextAlignment.center
        labelType.text = NSLocalizedString("VCreateCellFontNameCell_labelType", comment:"")
        self.labelType = labelType
        
        let labelName
        
        addSubview(labelType)
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
        
        NSLayoutConstraint.equals(
            view:labelType,
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
            layer.borderColor = UIColor(white:0, alpha:1).cgColor
            labelType.alpha = kAlphaSelected
        }
        else
        {
            viewBorder.backgroundColor = colorNotSelected
            layer.borderColor = UIColor(white:0, alpha:0.2).cgColor
            labelType.alpha = kAlphaNotSelected
        }
    }
    
    //MARK: public
    
    func config(model:MCreateFontItem)
    {
        self.model = model
        labelType.font = model.font(size:kFontSizeType)
        hover()
    }
}

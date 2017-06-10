import UIKit

class VShareCellScaleCell:UICollectionViewCell
{
    private weak var labelTitle:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.font = UIFont.regular(size:20)
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.backgroundColor = UIColor.clear
        self.labelTitle = labelTitle
        
        addSubview(labelTitle)
        
        NSLayoutConstraint.equals(
            view:labelTitle,
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
            labelTitle.textColor = UIColor.white
        }
        else
        {
            labelTitle.textColor = UIColor(white:0.5, alpha:1)
        }
    }
    
    //MARK: public
    
    func config(scale:CGFloat)
    {
        let scaleNumber:NSNumber = scale as NSNumber
        let stringTitle:String = String(
            format:NSLocalizedString("VShareCellScaleCell_labelTitle", comment:""),
            scaleNumber)
        labelTitle.text = stringTitle
        
        hover()
    }
}

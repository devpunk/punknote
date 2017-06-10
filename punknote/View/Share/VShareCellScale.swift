import UIKit

class VShareCellScale:VShareCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var collectionView:VCollection!
    private let kMarginVertical:CGFloat = 15
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}

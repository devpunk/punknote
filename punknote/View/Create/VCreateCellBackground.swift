import UIKit

class VCreateCellBackground:VCreateCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var collectionView:VCollection!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let collectionView:VCollection = VCollection()
        collectionView.alwaysBounceHorizontal = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VCreateCellBackgroundCell.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
        }
        
        addSubview(collectionView)
        
        NSLayoutConstraint.equals(
            view:collectionView,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    
}

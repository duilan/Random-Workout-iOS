//
//  ExercisesVC.swift
//  RandomWorkout-iOS
//
//  Created by Duilan on 23/05/21.
//

import UIKit

final class ExercisesVC: UIViewController {
    
    private enum Section { case main }
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Exercise>!
    private var exercises: [Exercise] = []
    
    private let exerciseModel = ExerciseModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        configureColecctionView()
        configureDataSource()
        getExercises()
    }
    
    private func configureColecctionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFLowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ExerciseCell.self, forCellWithReuseIdentifier: ExerciseCell.reuseID)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Exercise>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, exercise) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseCell.reuseID, for: indexPath) as! ExerciseCell
            cell.set(with: exercise)
            return cell
        })
    }
    
    private func updateData() {
        var snapshop = NSDiffableDataSourceSnapshot<Section, Exercise>()
        snapshop.appendSections([.main])
        snapshop.appendItems(exercises)
        DispatchQueue.main.async { self.dataSource.apply(snapshop, animatingDifferences: true) }                
    }
    
    private func getExercises() {
        exercises = exerciseModel.getAllExercises()
        updateData()
    }
    
    private func createThreeColumnFLowLayout() ->UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let avaiableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = avaiableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
}

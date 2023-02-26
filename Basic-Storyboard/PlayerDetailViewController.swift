//
//  PlayerDetailViewController.swift
//  Basic-Storyboard
//
//  Created by Sahna Melly Marselina on 22/02/23.
//

import UIKit

extension UIImageView {
    func roundedImage() {
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }
}

class PlayerDetailViewController: UIViewController {
    var data: Player?

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var teamImageView: UIImageView!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let model = data {
            imageView.image = UIImage(named: model.imageName)
            imageView.roundedImage()
            imageView.backgroundColor = .systemGray6

            nameLabel.text = model.name

            teamImageView.image = UIImage(named: model.team.imageName)
            if model.name == "Guard" {
                guard model.age != 0 else {
//                    fatalError("age is null")
                    return
                }
                ageLabel.text = String(model.age)

                guard model.height != "" else {
                    fatalError("height is null")
                }
                heightLabel.text = model.height

                guard model.weight != 0 else {
                    fatalError("weight is null")
                }
                weightLabel.text = String(model.weight)
            } else {
                ageLabel.text = String(model.age)
                heightLabel.text = model.height
                weightLabel.text = String(model.weight)
            }
        }

        setupCollectionView()
    }

    private func setupCollectionView() {
        debugPrint("setupCollectionView")
        collectionView.dataSource = self
        collectionView.delegate = self
        registerCollectionViewCells()
    }

    private func registerCollectionViewCells() {
        let nib = UINib(nibName: "PlayerCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "collectioncell")
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if let vc = segue.destination as? WelcomeViewController {
            vc.unwindValue = "Hellow from detail"
        } else if let vc = segue.destination as? PlayerCollectionViewDetailController, let imgName = sender as? String {
            vc.imgName = imgName
        }
    }
}

extension PlayerDetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("collection selected at index \(indexPath.item)")
        performSegue(withIdentifier: "gotocollectiondetail", sender: data?.imageName)
    }
}

extension PlayerDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! PlayerCollectionViewCell

        if let model = data {
            cell.imgPlayer.image = UIImage(named: model.imageName)
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionView.elementKindSectionHeader:

                let headerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: "playerreusable",
                    for: indexPath)

                guard let typedHeaderView = headerView as? PlayerCollectionReusableView
                else { return headerView }

                typedHeaderView.titleLabel.text = "Gallery"
                typedHeaderView.backgroundColor = data?.team.color
                return typedHeaderView
            default:
                assertionFailure("Invalid element type")
                return UICollectionReusableView()
        }
    }
}

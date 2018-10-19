import UIKit
import SnapKit

postfix operator ⭐

extension Int {
    postfix static func ⭐(this: Int) -> String {
        return "⭐️" * this
    }
}

extension String {
    static func *(input: String, times: Int) -> String {
        var result = ""
        for _ in 0..<times {
            result += input
        }
        return result
    }
}

class RatingFieldCell: UITableViewCell, UIPickerViewDataSource {

    var ratings: [Int]!

    init(data: [Int], rating: Int, delegate: UIPickerViewDelegate) {
        super.init(style: .default, reuseIdentifier: "RatingCell")
        ratings = data

        if let label = textLabel {
            label.text = "Rating"

            let picker = UIPickerView()
            picker.delegate = delegate
            picker.dataSource = self

            let currentSelection = ratings.firstIndex(of: rating) ?? 0
            picker.selectRow(currentSelection, inComponent: 0, animated: false)

            addSubview(picker)

            picker.snp.makeConstraints { (make) -> Void in
                make.leading.equalToSuperview().offset(150)
                make.trailing.equalToSuperview().offset(-8)
                make.height.equalToSuperview()
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ratings.count
    }
}

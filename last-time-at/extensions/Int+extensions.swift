postfix operator ⭐

extension Int {
    postfix static func ⭐(this: Int) -> String {
        return "⭐️" * this
    }
}

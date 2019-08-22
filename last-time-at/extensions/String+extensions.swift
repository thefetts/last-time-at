extension String {
    static func *(input: String, times: Int) -> String {
        var result = ""
        for _ in 0..<times {
            result += input
        }
        return result
    }
}

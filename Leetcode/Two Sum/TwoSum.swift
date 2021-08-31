class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numsDictionary: [Int: Int] = [:]

        for i in 0...nums.count - 1 {
            let minus = target - nums[i]
            if let firstIndex = numsDictionary[minus] {
                return [firstIndex, i]
            } else {
                numsDictionary[nums[i]] = i
            }
        }

        return []
    }
}

let solution = Solution().twoSum([2, 5, 5, 11], 10)
print(solution)

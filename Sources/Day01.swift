
import Algorithms

struct Day01: AdventDay {
	// Save your data in a corresponding text file in the `Data` directory.
	var data: String
	
	// Splits input data into its component parts and convert from string.
	var entities: [String] {
		data.split(separator: "\n").map {
			String($0)
		}
	}
	
	// Replace this with your solution for the first part of the day's challenge.
	func part1() -> Any {
		var sum = 0
		for str in entities {
			var num = ""
			for char in str {
				if char.isWholeNumber {
					num = String(char)
					break
				}
			}
			for char in str.reversed() {
				if char.isWholeNumber {
					num += String(char)
					break
				}
			}
			sum += Int(num) ?? 0
		}
		return sum
	}
	
	// Replace this with your solution for the second part of the day's challenge.
	func part2() -> Any {
		print("didnt try")
	}
}

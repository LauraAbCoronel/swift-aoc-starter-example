import Algorithms

struct Day03: AdventDay {
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
		// Calculate the sum of the first set of input data
		return 1
	}


  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
	// Sum the maximum entries in each set of data
	  print("Hello")
  }
}

extension StringProtocol {
	subscript(_ offset: Int)                     -> Element     { self[index(startIndex, offsetBy: offset)] }
	subscript(_ range: Range<Int>)               -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
	subscript(_ range: ClosedRange<Int>)         -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
	subscript(_ range: PartialRangeThrough<Int>) -> SubSequence { prefix(range.upperBound.advanced(by: 1)) }
	subscript(_ range: PartialRangeUpTo<Int>)    -> SubSequence { prefix(range.upperBound) }
	subscript(_ range: PartialRangeFrom<Int>)    -> SubSequence { suffix(Swift.max(0, count-range.lowerBound)) }
}

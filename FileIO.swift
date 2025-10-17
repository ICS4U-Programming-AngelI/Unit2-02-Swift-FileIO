import Foundation // Import the Foundation

let inputFile = "input.txt"    // Name of the input file
let outputFile = "output.txt"  // Name of the output file

do {
    // Try to read the contents of the input file (defaults to UTF-8)
    let content = try String(contentsOfFile: inputFile)

    // Split the content into lines based on newline characters
    let lines = content.components(separatedBy: .newlines)

    var outputText = "" // String to store all output lines

    // Loop through each line from the input file
    for line in lines {
        
        // Check if the line is empty or contains only spaces
        if line.trimmingCharacters(in: .whitespaces).isEmpty {
            // Treat blank or whitespace-only lines as invalid input
            outputText += "Error: Invalid input in line -> \(line)\n"
            continue // Skip to the next line
        }

        // Split the line into components using spaces
        let arr = line.split(separator: " ")

        var sum = 0 // Sum of the numbers in this line
        var hasError = false // Flag to detect invalid input (non-integer)

        // Loop through each element in the line
        for element in arr {
            // Try converting the element to an integer
            if let number = Int(element) {
                sum += number // Add valid integer to the sum
            } else {
                hasError = true // Found invalid input
                break // Stop processing this line
            }
        }

        // Add the result or error message to the output
        if hasError {
            outputText += "Error: Invalid input in line -> \(line)\n"
        } else {
            outputText += "Sum: \(sum)\n"
        }
    }

    // Write the output text to the output file using UTF-8 encoding used for reading
    try outputText.write(toFile: outputFile, atomically: true, encoding: .utf8)

    // Print success message
    print("Processing complete. Check \(outputFile).")

} catch {
    // Handle any file reading/writing errors
    print("Error reading or writing file: \(error)")
}

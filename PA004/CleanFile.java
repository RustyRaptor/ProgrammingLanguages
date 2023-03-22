import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

/**
 * Ziad Arafat
 * 03/22/2023
 * 
 * This program will clean a corrupted file based on a specific pattern of 
 * Corrupted data
 */

public class CleanFile {
        // Regex pattern to match the corruption in the input text
        private static final String CORRUPTION_REGEX = "\\x03(?:\\x03|(?:(?![\\x0A\\x02]).)*\\x0A)*?(?:(?![\\x0A\\x02]).)*\\x02";

        public static void main(String[] args) {

                // Check the number of arguments provided
                if (args.length < 1) {
                        System.out.println("Usage: CleanFile <input_file_path> [<output_file_path>]");
                        return;
                }

                // Store input and output file paths
                String inputFilePath = args[0];
                String outputFilePath = args.length > 1 ? args[1] : null;

                String dirtyText;
                // Read the content of the input file
                try {
                        dirtyText = new String(
                                Files.readAllBytes(Paths.get(inputFilePath))
                        );
                } catch (IOException e) {
                        System.out.println("Error reading input file: " 
                                + e.getMessage()
                        );
                        return;
                }

                // Clean the input text
                String sanitizedText = sanitizedString(dirtyText);

                // Write the cleaned text to the output file if provided, otherwise print it
                if (outputFilePath != null) {
                        try {
                                Files.write(Paths.get(outputFilePath),
                                        sanitizedText.getBytes());
                        } catch (IOException e) {
                                System.out.println("Error writing output file: " 
                                        + e.getMessage()
                                );
                        }
                } else {
                        System.out.print(sanitizedText);
                }
        }

        /**
         * Remove the corrupted parts from the input text based on the
         * CORRUPTION_REGEX pattern.
         *
         * @param dirtyString The input text containing the corrupted parts.
         * @return The cleaned text with the corrupted parts removed.
         */
        private static String sanitizedString(String dirtyString) {
                Pattern pattern = Pattern.compile(CORRUPTION_REGEX,
                        Pattern.DOTALL
                );
                Matcher matcher = pattern.matcher(dirtyString);
                return matcher.replaceAll("");
        }
}

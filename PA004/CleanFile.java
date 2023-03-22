import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class CleanFile {
    private static final String CORRUPTION_REGEX = "\\x03(?:\\x03|(?:(?![\\x0A\\x02]).)*\\x0A)*?(?:(?![\\x0A\\x02]).)*\\x02";

    public static void main(String[] args) {
        if (args.length < 1) {
            System.out.println("Usage: CleanFile <input_file_path> [<output_file_path>]");
            return;
        }

        String inputFilePath = args[0];
        String outputFilePath = args.length > 1 ? args[1] : null;

        String dirtyText;
        try {
            dirtyText = new String(Files.readAllBytes(Paths.get(inputFilePath)));
        } catch (IOException e) {
            System.out.println("Error reading input file: " + e.getMessage());
            return;
        }

        String sanitizedText = sanitizedString(dirtyText);

        if (outputFilePath != null) {
            try {
                Files.write(Paths.get(outputFilePath), sanitizedText.getBytes());
            } catch (IOException e) {
                System.out.println("Error writing output file: " + e.getMessage());
            }
        } else {
            System.out.print(sanitizedText);
        }
    }

    private static String sanitizedString(String dirtyString) {
        Pattern pattern = Pattern.compile(CORRUPTION_REGEX, Pattern.DOTALL);
        Matcher matcher = pattern.matcher(dirtyString);
        return matcher.replaceAll("");
    }
}

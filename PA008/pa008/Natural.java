/**
 * Ziad Arafat
 * 04/26/2023
 */

package pa008;


/**
 * Class to store natural numbers and throw exceptions equivalent to Adas 
 * Contraint errors that natural types can throw. 
 */
public class Natural {
        private int value;

        public Natural(int value) {
                if (value < 0) {
                        throw new IllegalArgumentException(
                                        "Value must be non-negative.");
                }
                this.value = value;
        }

        public int getValue() {
                return value;
        }

        public void setValue(int value) {
                if (value < 0) {
                        throw new IllegalArgumentException(
                                        "Value must be non-negative.");
                }
                this.value = value;
        }
}

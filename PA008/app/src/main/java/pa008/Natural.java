package pa008;

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

package com.pa008;
import java.util.Scanner;

/**
 * Exception handling loop example translated from Ada.
 */
public class App {
        public static void GradeDistribution()
        {
                int[] Freq = new int[10]; // Array of integers initialized to 0
                Natural NewGrade = new Natural(0); // Natural number to store the grade

                int Index, Limit_1, Limit_2;

                // keep asking for a number until the user enters a negative. 
                while (true) {

                        // Try to set the value to what the user entered.
                        // If it's not a natural number break the loop.
                        try (Scanner GradeScanner = new Scanner(System.in)) {
                                NewGrade.setValue(
                                        GradeScanner.nextInt());

                        } catch (IllegalArgumentException e) {
                                break;
                        }
                        
                        // Set the index to the grade value over 10
                        Index = NewGrade.getValue()/10;

                        // Try to append the grade value.
                        // If it is out of bounds then either error or append
                        // it as the 100 grade
                        try {
                                Freq[Index] = Freq[Index] + 1;
                        } catch (ArrayIndexOutOfBoundsException e) {
                                if (NewGrade.getValue() == 100) {
                                        Freq[9] = Freq[9] + 1;
                                } else {
                                        System.out.print(
                                                "Error -- new grade: ");
                                        System.out.print(NewGrade);
                                        System.out.println(" is out of range");
                                }
                        }
                }

                System.out.println("Limits\tFrequency");
                for (int i = 0; i < 8; i++) {
                        Limit_1 = 10 * i;
                        Limit_2 = Limit_1 + 9;
                        if (i == 9) {
                                Limit_2 = 100;
                        }

                        System.out.print(Limit_1);
                        System.out.print(Limit_2);
                        System.out.println(Freq[i]);

                }
        }
        public static void main(String[] args) 
        {
                GradeDistribution();
        }
}
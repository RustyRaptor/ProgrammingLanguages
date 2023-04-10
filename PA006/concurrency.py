import random
import concurrent.futures
import time
import argparse


def generate_matrix(n):
        """Generate an NxN matrix with random integers between 0 and 2^20

        Args:
            n (int): Size of the square matrix NxN

        Returns:
            New matrix: The generated nxn matrix.
        """
        return [[random.randint(0, 2 ** 20) \
                for _ in range(n)] for _ in range(n)]

def find_stats(matrix):
        """Return the min, max, and average of the values in the given matrix.

        Args:
            matrix (iterable): 2D Iterable of integers

        Returns:
            tuple: Tuple in the format of (max, min, average)
        """
        min_val = float("inf")
        max_val = float("-inf")
        total = 0
        count = 0

        for row in matrix:
                for val in row:
                        min_val = min(min_val, val)
                        max_val = max(max_val, val)
                        total += val
                        count += 1

                avg = total / count
        return max_val, min_val, avg

def find_stats_thread(matrix, row):
        """Return the mix, max, and average of the values in the matrix but to
        be used in concurrent threads and operates per row.

        Args:
            matrix (iterable): 2D Iterable of integers
            row (iterable): One row of the matrix. Just a list of integers. 

        Returns:
            tuple: Tuple in the format of (max, min, average)
        """
        min_val = float("inf")
        max_val = float("-inf")
        total = 0

        for val in matrix[row]:
                min_val = min(min_val, val)
                max_val = max(max_val, val)
                total += val

        avg = total / len(matrix[row])
        return max_val, min_val, avg

def main():
        # Read the input integer from the command line. 
        parser = argparse.ArgumentParser(
                description='Process an integer argument.')
        parser.add_argument('integer', type=int, help='An integer value')

        args = parser.parse_args()
        n = args.integer
        
        # Task 1 
        matrix = generate_matrix(n)

        # Task 2 (without threads)
        start_time1 = time.perf_counter()
        max_val, min_val, avg = find_stats(matrix)
        end_time1 = time.perf_counter()
        time_taken1 = end_time1 - start_time1
        print("Task 2:")
        print(f"Max value: {max_val}")
        print(f"Min value: {min_val}")
        print(f"Average value: {avg}")
        print(f"Time taken to compute max, min, and average: {time_taken1*1000} milliseconds")

        # Task 3 (with threads)
        start_time2 = time.perf_counter()

        # ThreadPoolExecutor will get the results from the threaded function 
        # calls and store it in results. 
        with concurrent.futures.ThreadPoolExecutor() as executor:
                results = list(executor.map(
                        find_stats_thread, [matrix] * n, range(n)))

        # Get the max, min, and avg values from the results which are a 
        # collection of results for each row the matrix. 
        max_val = max(result[0] for result in results)
        min_val = min(result[1] for result in results)
        avg = sum(result[2] for result in results) / n
        end_time2 = time.perf_counter()
        time_taken2 = end_time2 - start_time2

        print("Task 3:")
        print(f"Max value: {max_val}")
        print(f"Min value: {min_val}")
        print(f"Average value: {avg}")
        print(f"Time taken to compute max, min, and average: {time_taken2*1000} milliseconds")

if __name__ == "__main__":
        main()

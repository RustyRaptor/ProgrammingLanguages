from binascii import hexlify


name = "John Wick" # The string you wanna print

"""
Converts an input string to it's respective hex in Little endian as a string
"""
def str_to_hex(i_string):
        return hexlify(i_string.encode()).decode()     


"""
prints out all the array assignment lines for a given string.
"""
def string_to_hexes(i_string):
        commands = []
        # i_string = i_string[::-1]
        print(i_string)

        array_idx = 0  # index on the array

        # loop through the input string and print out the line every 4 letters
        for key, val in enumerate(i_string):
                if key % 4 == 0:
                        commands.append("A["+str(array_idx)+"] = 0x" +
                                        str_to_hex(i_string[key:key+4][::-1]))
                        array_idx += 1

        # print out the null character at the end
        commands.append("A[" + str(array_idx)+"] = 0")
        print(commands)
        
        for i in commands:
                print(i + ";")


string_to_hexes(name)
def ordered_set(in_str):
    cache = {}
    size = len(in_str)
    out_arr = []
    # if size == len(in_str):
    #     return [[x for x in in_str]]
    # for i in range(2,int('1'*size, 2)+1):
    #     next_iter = []
    #     for key, bit in enumerate(list("{0:b}".format(i))):
    #         if bit == "1":
    #             print(key, i, size, "{0:b}".format(i),list("{0:b}".format(i)))
    #             next_iter.append(in_str[key])
    #     out_arr.append(next_iter)
    #     print("appended", next_iter)
    for length_seq in range(1, size):
        for i in range(1,int('1'*size, 2)+1):
            next_seq = "{0:b}".format(i)
            next_seq = "0"*(size-len(next_seq)) + next_seq
            next_iter = []
            if list(next_seq).count('1') == length_seq:
                for key, bit in enumerate(list(next_seq)):
                    if bit == "1":
                        print(key, i, size, next_seq,list(next_seq))
                        next_iter.append(in_str[key])
                out_arr.append(next_iter)
                
    return out_arr

[print(x) for x in ordered_set("abcd")]
# ordered_set("abcdef")


"""
1
# 10
11
100
101
# 110
111


"""
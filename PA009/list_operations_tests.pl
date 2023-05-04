:- use_module(library(plunit)).

:- consult(custom_report). % include the custom report hook

:- begin_tests(hw5_arafat_ziad).

:- consult(hw5_arafat_ziad).

test(list_len_empty) :-
    listLen(0, []).

test(list_len_single) :-
    listLen(1, [1]).

test(list_len_multiple) :-
    listLen(5, [1, 2, 3, 4, 5]).

test(drop_k_first) :-
    dropK([2, 3, 4, 5], [1, 2, 3, 4, 5], 1).

test(drop_k_middle) :-
    dropK([1, 3, 4, 5], [1, 2, 3, 4, 5], 2).

test(drop_k_last) :-
    dropK([1, 2, 3, 4], [1, 2, 3, 4, 5], 5).

test(split_list_empty) :-
    split_list([], [], [], 0).

test(split_list_first) :-
    split_list([1], [2, 3, 4, 5], [1, 2, 3, 4, 5], 1).

test(split_list_middle) :-
    split_list([1, 2, 3], [4, 5], [1, 2, 3, 4, 5], 3).

test(split_list_last) :-
    split_list([1, 2, 3, 4], [5], [1, 2, 3, 4, 5], 4).

test(split_list_after_last) :-
    split_list([1, 2, 3, 4, 5], [], [1, 2, 3, 4, 5], 5).

:- end_tests(hw5_arafat_ziad).
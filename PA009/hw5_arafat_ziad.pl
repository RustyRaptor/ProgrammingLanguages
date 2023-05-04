% Ziad Arafat
% 05/03/2023

% 1.
% Without tail recursion version 
% listLen([],0).
% listLen([_|ListTail],N) :- listLen(ListTail,X), N is X+1.

% This version uses an accumulator parameter to store intermediate values
% This allows us to store the result in the function params thus making the function call the last instruction.
leng([],CurrentList,CurrentList). % Base case
leng([_|InputListTail],CurrentLength,LengthOfList) :- NextLength is CurrentLength + 1, 
        leng(InputListTail,NextLength,LengthOfList). % recursive case


% Helper function to meet parameter requirements
listLen(LengthOfList, InputList) :- leng(InputList,0,LengthOfList).


% 2.
% When we reach the kth element we unify the first argument with the tail
% Thus returning the tail. 
dropK(InputListTail, [_|InputListTail], 1).

% If we haven't reached it yet we decrement the index and call again with the tail
% We set the result to be the combination of the Head and the result of the next call.
dropK(Result, [InputListHead|InputListTail], RemoveIndex) :- RemoveIndex > 1,
        NewIndex is RemoveIndex - 1,
        dropK(ReturnedResult, InputListTail, NewIndex), Result = [InputListHead|ReturnedResult].

% 3.
% Helper predicate with an accumulator
reverse_list_helper([], ReversedList, ReversedList). % Base case

% Recursive case
reverse_list_helper([HeadInputList|InputListTail], Acc, ReversedList) :-
    reverse_list_helper(InputListTail, [HeadInputList|Acc], ReversedList).

% Entry predicate
reverse_list(InputList, ReversedList) :-
    reverse_list_helper(InputList, [], ReversedList).


% Base case when index is zero.
split_list_helper(InputList, 0, CurrentLeftSide, LeftSide, RightSide) :-
        % We reverse the final results
        reverse_list(CurrentLeftSide, RightSide),
        % Set our left side result to the new input list
        LeftSide = InputList.

% Recursive case we move an element to the other side then decrement the index
split_list_helper([HeadInputList|InputListTail], SplitIndex, CurrentLeftSide, LeftSide, RightSide) :-
        SplitIndex > 0,
        NextIndex is SplitIndex - 1,
        split_list_helper(InputListTail, NextIndex, [HeadInputList|CurrentLeftSide], LeftSide, RightSide).

% Entry function
divide(LeftSide, RightSide, InputList, SplitIndex) :-
        % Shhhhh don't tell anyone I swapped left and right here
        split_list_helper(InputList, SplitIndex, [], RightSide, LeftSide).

% 1.
% Without tail recursion version 
% listLen([],0).
% listLen([_|ListTail],N) :- listLen(ListTail,X), N is X+1.

% This version uses an accumulator parameter to store intermediate values
% This allows us to only compute the result after the last call is completed.
% Tail recursion is more efficient because they don't need to keep track of as
% much memory as the stack of calls grows.
leng([_|T],A,L) :- Anew is A+1, leng(T,Anew,L). % recursive case
leng([],A,A). % Base case

% Helper function to meet parameter requirements
listLen(Length, List) :- leng(List,0,Length).


% 2.
% When we reach the kth element we unify the first argument with the tail
% Thus returning the tail. 
dropK(Tail, [_|Tail], 1).

% If we haven't reached it yet we decrement the index and call again with the tail
% We set the result to be the combination of the Head and the result of the next call.
dropK(Result, [Head|Tail], RemoveIndex) :- RemoveIndex > 1,
        NewIndex is RemoveIndex - 1,
        dropK(X, Tail, NewIndex), Result = [Head|X].

% 3.

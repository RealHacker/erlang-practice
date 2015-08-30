-module(change).
-export([getchange/2]).

getchange(Cost, Money) when Money>Cost->
	calchange(Money-Cost, {0,0,0,0});
getchange(Cost, Money) when Money=:=Cost->{0, 0, 0, 0};
getchange(Cost, Money) -> err.


calchange(Amount, {A, B, C, D}) -> 
io:format("~p~n", [Amount]),
if
	Amount =< 0 -> {A, B, C, D};
	Amount >= 0.25 -> calchange(Amount-0.25, {A+1, B, C, D});
	Amount >= 0.1 -> calchange(Amount-0.1, {A, B+1, C, D});
	Amount >= 0.05 -> calchange(Amount-0.05, {A, B, C+1, D});
	true -> calchange(Amount-0.01, {A, B, C, D+1})
end.
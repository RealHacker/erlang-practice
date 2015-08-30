-module(factor).
-export([factor/1]).

factor(N) when N>1,is_integer(N) -> {ok, factor(N, 2)};
factor(N) -> {err, N}.

factor(N, M) when M > N -> [];
factor(N, M) -> case N rem M of
	0 -> [M|factor(N div M, M)];
	_ -> factor(N, M+1)
	end.

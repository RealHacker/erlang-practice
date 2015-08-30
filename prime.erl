-module(prime).
-export([getprime/1]).

isprime(N, M) when N rem M =:= 0 -> false;
isprime(N, M) when M*M > N -> true;
isprime(N, M) -> isprime(N, M+1).

isprime(N) -> isprime(N, 2).



getprime(2) -> [2];
getprime(X) -> case isprime(X) of
	true -> [X|getprime(X-1)];
	false -> getprime(X-1)
	end.
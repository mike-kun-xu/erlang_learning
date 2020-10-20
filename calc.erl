-module(calc).
-export([fiNum/1]).

fiNum(N) when N == 0 -> 0;
fiNum(N) when N < 2 -> 1;
fiNum(N) when N >= 2 -> fiNum(N - 1) + fiNum(N - 2).

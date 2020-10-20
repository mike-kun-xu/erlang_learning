-module(fiNum).
-export([fi/1]).
fi(N) when is_integer(N), N>=0 -> fi(N, 0, 0, 0);
fi(N) -> throw("Not calculatable").

fi(N, N, _, Output) -> Output; % End clause return output
fi(N, 0, _, _) -> fi(N, 1, 0, 1); % Check if N = 0
fi(N, 1, _, _) -> fi(N, 2, 1, 1); % Check if N = 1 
fi(N, Current, Last_Result, Current_result) -> fi(N, Current + 1, Current_result, Last_Result + Current_result). 
% In the return value, X + Y is the result for current number
% Y become the fi(N - 1)
% In the next calculation, Y become fi(N - 2), X + Y become fi(N - 1)
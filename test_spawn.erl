-module(test_spawn).

-export([start/2, a/2, b/0, c/0]).

a(0, Thread_need) ->
    if
        Thread_need == 1 ->
            b ! finished;
        Thread_need == 2 ->
            b ! finished,
            c ! finished
    end,
    io:format("Main thread ended~n", []); % end the process

a(N, Thread_need) ->
    if
        Thread_need == 1 ->
            b ! {a_ping, self()};
        Thread_need == 2 ->
            b ! {a_ping, self()},
            c ! {a_ping, self()}
    end,
    receive
        b_ping ->
            io:format("Thread A: Ping received from thread B~n", []);
        c_ping ->
            io:format("Thread A: Ping received from thread C~n", [])
    end,
    
    a(N - 1, Thread_need).

b() ->
    receive
        finished ->
            io:format("Thread B ended~n", []);
        registered ->
            io:format("Thread B registered~n"),
            b();            
        {a_ping, A_PID} ->
            io:format("Thread B: Ping received from A~n", []),
            A_PID ! b_ping,
            b()
    end.

c() ->
    receive
        finished ->
            io:format("Thread C ended~n", []);
        registered ->
            io:format("Thread C registered~n"),
            c();
        {a_ping, A_PID} ->
            io:format("Thread C: Ping received from A~n", []),
            A_PID ! c_ping,
            c()
    end.

start(N, Thread_need) ->
    A_PID = spawn(test_spawn, a, [N, Thread_need]),
    if
        Thread_need == 1 ->
            register(b, spawn(test_spawn, b, [])),
            b ! registered;
        Thread_need == 2 ->
            register(b, spawn(test_spawn, b, [])),
            register(c, spawn(test_spawn, c, [])),
            b ! registered,
            c ! registered
    end.
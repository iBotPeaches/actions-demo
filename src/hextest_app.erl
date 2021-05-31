%%%-------------------------------------------------------------------
%% @doc hextest public API
%% @end
%%%-------------------------------------------------------------------

-module(hextest_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    hextest_sup:start_link().

stop(_State) ->
    ok.

%% internal functions

:- initialization (main).
:- set_prolog_flag(verbose, silent).

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_cors)).

:- use_module(fredag).

:- http_handler(root(.), fredag_handler, []).

:- set_setting(http:cors, [*]).

server(Port) :-
  http_server(http_dispatch, [port(Port)]).

fredag_handler(Req) :-
  option(method(options), Req), !,
  cors_enable(Req, [ methods([get]) ]),
  format('~n').

fredag_handler(Req) :-
  option(method(get), Req), !,
  cors_enable,
  format('Content-type: text/plain~n~n'),
  (fredag -> format('true.') ; format('false.')).

fredag_handler(_) :- throw(http_reply(server_error('Method not supported. Only GET.'))).

main :-
  server(5000).

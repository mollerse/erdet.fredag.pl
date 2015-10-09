:- initialization main.
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(fredag).

:- http_handler(/, fredag_handler, []).

server(Port) :-
  http_server(http_dispatch, [port(Port)]).

fredag_handler(_Request) :-
  format('Content-type: text/plain~n~n'),
  (fredag -> format('true.') ; format('false.')).

main :-
  server(5000).

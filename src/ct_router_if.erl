-module(ct_router_if).

-export([
         handle_hello/2,
         handle_authenticate/2,
         handle_established/3,
         handle_session_closed/2
        ]).


-include_lib("ct_msg/include/ct_msg_types.hrl").

-callback handle_hello_message(Hello, PeerAtGate)
-> ok
       when Hello :: ct_msg_hello(),
            PeerAtGate :: pid().

-callback handle_authenticate_message(Authenticate, PeerAtGate)
-> ok
       when Authenticate :: ct_msg_authenticate(),
            PeerAtGate :: pid().

-callback handle_established_message(Type, Message, SessionData, PeerAtGate)
-> ok
       when Type :: ct_msg_type(),
            Message :: ct_msg_established(),
            SessionData :: any(),
            PeerAtGate :: pid().

-callback handle_session_closed_message(SessionData, PeerAtGate)
-> ok
       when SessionData :: any(),
            PeerAtGate :: pid().


handle_hello(Hello, RouterIf) ->
    RouterIf:handle_hello_message(Hello, self()).

handle_authenticate(Authenticate, RouterIf) ->
    RouterIf:handle_authenticate_message(Authenticate, self()).

handle_established(Message, SessionData, RouterIf) ->
    Type = ct_msg:get_type(Message),
    RouterIf:handle_established_message(Type, Message, SessionData, self()).

handle_session_closed(SessionData, RouterIf) ->
    RouterIf:handle_session_closed(SessionData, self()).

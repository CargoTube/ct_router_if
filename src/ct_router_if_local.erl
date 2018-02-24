-module(ct_router_if_local).

-behaviour(ct_router_if).


-export([
         handle_hello_message/2,
         handle_authenticate_message/2,
         handle_established_message/4,
         handle_session_closed/2
        ]).

handle_hello_message(Hello, PeerAtGate) ->
    ct_router:handle_hello(Hello, PeerAtGate).

handle_authenticate_message(Authenticate, PeerAtGate) ->
    ct_router:handle_authenticate(Authenticate, PeerAtGate).

handle_established_message(Type, Message, SessionId, PeerAtGate) ->
    ct_router:handle_established(Type, Message, SessionId, PeerAtGate).

handle_session_closed(SessionId, PeerAtGate) ->
    ct_router:handle_session_closed(SessionId, PeerAtGate).

-module(ct_router_if_local).

-behaviour(ct_router_if).


-export([
         handle_hello_message/2,
         handle_authenticate_message/2,
         handle_established_message/4,
         handle_session_closed_message/2
        ]).

handle_hello_message(Hello, PeerAtGate) ->
    ct_router:handle_hello(Hello, PeerAtGate).

handle_authenticate_message(Authenticate, PeerAtGate) ->
    ct_router:handle_authenticate(Authenticate, PeerAtGate).

handle_established_message(Type, Message, Session, PeerAtGate) ->
    ct_router:handle_established(Type, Message, Session, PeerAtGate).

handle_session_closed_message(Session, PeerAtGate) ->
    ct_router:handle_session_closed(Session, PeerAtGate).
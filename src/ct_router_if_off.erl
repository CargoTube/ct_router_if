-module(ct_router_if_off).

-behaviour(ct_router_if).

-include_lib("ct_msg/include/ct_msg.hrl").

-export([
         handle_hello_message/3,
         handle_authenticate_message/2,
         handle_established_message/4,
         handle_session_closed/2
        ]).

handle_hello_message(_Hello, PeerAtGate, _Transport) ->
    PeerAtGate ! {to_peer, ?ABORT(#{}, no_such_realm)},
    ok.

handle_authenticate_message(_Authenticate, _PeerAtGate) ->
    ok.

handle_established_message(_Type, _Message, _Session, _PeerAtGate) ->
    ok.

handle_session_closed(_Session, _PeerAtGate) ->
    ok.

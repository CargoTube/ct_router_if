-module(ct_router_if).

-export([
         handle_hello/2,
         handle_established/3,
         handle_session_closed/2
        ]).


-include_lib("ct_msg/include/ct_msg_types.hrl").

-callback handle_hello_message(Hello, Gate)
-> ok
       when Hello :: ct_msg_hello(),
            Gate :: pid().

-callback handle_established_message(Type, Message, Session, Gate)
-> ok
       when Type :: ct_msg_type(),
            Message :: ct_msg_established(),
            Session :: any(),
            Gate :: pid().

-callback handle_session_closed_message(Session, Gate)
-> ok
       when Session :: any(),
            Gate :: pid().

handle_hello(Hello, RouterIf) ->
    RouterIf:handle_hello_message(Hello, self()).

handle_established(Message, Session, RouterIf) ->
    Type = ct_msg:get_type(Message),
    RouterIf:handle_established_message(Type, Message, Session, self()).

handle_session_closed(Session, RouterIf) ->
    RouterIf:handle_session_closed(Session, self()).

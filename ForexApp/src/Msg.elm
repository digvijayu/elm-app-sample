module Msg exposing (..)

import Navigation exposing (Location)

import Global.Msg
import Confirm.Msg
import Router.Router

type Msg
    = MsgForGlobal Global.Msg.Msg
    | RouterMessage Router.Router.Msg
    | InitalRouteMsg Location

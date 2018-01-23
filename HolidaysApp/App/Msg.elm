module HolidaysApp.App.Msg exposing (..)
import ForexApp.App.Msg

type Msg = AppMessage
  | ForexAppMsg ForexApp.App.Msg.Msg

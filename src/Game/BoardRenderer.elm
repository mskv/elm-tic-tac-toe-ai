module Game.BoardRenderer exposing (..)

import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes exposing (..)

import Game.Board exposing (Board)

type Msg
  = NoOp

render : Board -> Html Msg
render board =
  Svg.rect [ width "50", height "100" ] []

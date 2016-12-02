module Game.BoardRenderer exposing (..)

import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes exposing (..)

import Game.Board as Board
import Game.Board exposing (Board)
import Game.Board exposing (Field(..))

type Msg
  = NoOp

render : Board -> Html Msg
render board =
  --Svg.g [] (Board.map drawField board)
  Svg.g [] []

drawField : Int -> Int -> Field -> Html Msg
drawField rowIndex colIndex field =
  Svg.rect [ x (toString colIndex), y (toString rowIndex), width "50", height "100" ] []

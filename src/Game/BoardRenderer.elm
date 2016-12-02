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
  Svg.g [] (drawFields board)

drawFields : Board -> List (Html Msg)
drawFields board =
  (Board.reduce drawRowIntoGroup [] board)

drawRowIntoGroup : Int -> Int -> Field -> List (Html Msg) -> List (Html Msg)
drawRowIntoGroup rowIndex colIndex field acc =
  [Svg.rect [ x (toString colIndex), y (toString rowIndex), width "50", height "100" ] []]

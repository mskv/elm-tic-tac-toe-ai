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

-- private

drawFields : Board -> List (Html Msg)
drawFields board =
  (Board.reduce appendRect [] board)

appendRect : Int -> Int -> Field -> List (Html Msg) -> List (Html Msg)
appendRect rowIndex colIndex field acc =
  List.append acc [ drawField rowIndex colIndex field ]

drawField : Int -> Int -> Field -> Html Msg
drawField rowIndex colIndex field =
  Svg.svg
    [ x (toString (colIndex * 200))
    , y (toString (rowIndex * 200))
    ]
    [ fieldBorder
    , fieldInsides field
    ]

fieldBorder : Html Msg
fieldBorder =
  Svg.rect
    [ width "200"
    , height "200"
    , fill "white"
    , stroke "black"
    ] []

fieldInsides : Field -> Html Msg
fieldInsides field =
  case field of
    Empty -> Svg.g [] []
    Cross -> cross
    Circle -> circle

circle : Html Msg
circle =
  Svg.circle [ cx "100", cy "100", r "90", fill "white", stroke "black" ] []

cross : Html Msg
cross =
  Svg.g []
  [ Svg.line [ x1 "10", y1 "10", x2 "190", y2 "190", stroke "black" ] []
  , Svg.line [ x1 "10", y1 "190", x2 "190", y2 "10", stroke "black" ] []
  ]

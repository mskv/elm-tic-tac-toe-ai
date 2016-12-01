module Game.Board exposing (..)

import Game.Player exposing (Team(..))

import Array exposing (Array)

type Field
  = Empty
  | Cross
  | Circle

type alias Board =
  Array (Array Field)

initFiveByFive : Board
initFiveByFive =
  Array.fromList
    [ Array.fromList [ Empty, Empty, Empty, Empty, Empty ]
    , Array.fromList [ Empty, Empty, Empty, Empty, Empty ]
    , Array.fromList [ Empty, Empty, Empty, Empty, Empty ]
    , Array.fromList [ Empty, Empty, Empty, Empty, Empty ]
    , Array.fromList [ Empty, Empty, Empty, Empty, Empty ]
    ]

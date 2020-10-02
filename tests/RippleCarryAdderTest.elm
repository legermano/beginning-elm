module RippleCarryAdderTest exposing
    ( andGateTests
    , fullAdderTests
    , halftAdderTests
    , inverterTests
    , orGateTests
    , rippleCarryAdderTests
    )

import Expect exposing (Expectation)
import RippleCarryAdder exposing (andGate, fullAdder, halfAdder, inverter, orGate, rippleCarryAdder)
import Test exposing (..)


inverterTests : Test
inverterTests =
    describe "Inverter"
        [ test "Output is 0 when the input is 1" <|
            \_ ->
                inverter 0
                    |> Expect.equal 1
        , test "Output is 1 when the input is 0" <|
            \_ ->
                inverter 1
                    |> Expect.equal 0
        ]


andGateTests : Test
andGateTests =
    describe "AND gate"
        [ test "Output is 0 when both inputs are 0" <|
            \_ ->
                andGate 0 0
                    |> Expect.equal 0
        , test "Output is 0 when the first input is 0" <|
            \_ ->
                andGate 0 1
                    |> Expect.equal 0
        , test "Output is 0 when the second input is 0" <|
            \_ ->
                andGate 1 0
                    |> Expect.equal 0
        , test "Output is 1 when both inputs are 1" <|
            \_ ->
                andGate 1 1
                    |> Expect.equal 1
        ]


orGateTests : Test
orGateTests =
    describe "OR gate"
        [ test "Output is 0 when both inputs are 0" <|
            \_ ->
                orGate 0 0
                    |> Expect.equal 0
        , test "Output is 1 when the first input is 0 and the second 1" <|
            \_ ->
                orGate 0 1
                    |> Expect.equal 1
        , test "Output is 1 when the firts input is 1 and the second is 0" <|
            \_ ->
                orGate 1 0
                    |> Expect.equal 1
        , test "Output is 1 when both inputs are 1" <|
            \_ ->
                orGate 1 1
                    |> Expect.equal 1
        ]


halftAdderTests : Test
halftAdderTests =
    describe "Half Adder"
        [ test "Sum and carry-out are 0 when both inputs are 0" <|
            \_ ->
                halfAdder 0 0
                    |> Expect.equal { carry = 0, sum = 0 }
        , test "Sum is 1 and carry-out is 0 when the first input is 0 and second input is 1" <|
            \_ ->
                halfAdder 0 1
                    |> Expect.equal { carry = 0, sum = 1 }
        , test "Sum is 1 and carry-out is 0 when the first input is 1 and the second input is 0" <|
            \_ ->
                halfAdder 1 0
                    |> Expect.equal { carry = 0, sum = 1 }
        , test "Sum is 0 and carry-out is 1 when both inputs are 1" <|
            \_ ->
                halfAdder 1 1
                    |> Expect.equal { carry = 1, sum = 0 }
        ]


fullAdderTests : Test
fullAdderTests =
    describe "Full Adder"
        [ describe "When both inputs are 0"
            [ test "and carry-in is 0 too, then both sum and carry-out are 0" <|
                \_ ->
                    fullAdder 0 0 0
                        |> Expect.equal { carry = 0, sum = 0 }
            , test "but carry-in is 1, then sum is 1 and carry-out is 0" <|
                \_ ->
                    fullAdder 0 0 1
                        |> Expect.equal { carry = 0, sum = 1 }
            ]
        , describe "When the first input is 0, and the second input is 1"
            [ test "and carry-in is 0, then sum is 1 and carry-out is 0" <|
                \_ ->
                    fullAdder 0 1 0
                        |> Expect.equal { carry = 0, sum = 1 }
            , test "and carry-in is 1, then sum is 0 and carry-out is 1" <|
                \_ ->
                    fullAdder 0 1 1
                        |> Expect.equal { carry = 1, sum = 0 }
            ]
        , describe "When the first input is 1, and the second input is 0"
            [ test "and carry-in is 0, then sum is 1 and carry-out is 0" <|
                \_ ->
                    fullAdder 1 0 0
                        |> Expect.equal { carry = 0, sum = 1 }
            , test "and carry-in is 1, then sum is 0 and carry-out is 1" <|
                \_ ->
                    fullAdder 1 0 1
                        |> Expect.equal { carry = 1, sum = 0 }
            ]
        , describe "When the first input is 1, and the second input is 1"
            [ test "and carry-in is 0, then sum is 0 and carry-out is 1" <|
                \_ ->
                    fullAdder 1 1 0
                        |> Expect.equal { carry = 1, sum = 0 }
            , test "and carry-in is 1, then sum is 1 and carry-out is 1" <|
                \_ ->
                    fullAdder 1 1 1
                        |> Expect.equal { carry = 1, sum = 1 }
            ]
        ]


rippleCarryAdderTests : Test
rippleCarryAdderTests =
    describe "4-bit ripple carry adder"
        [ describe "Given two binary numbers nad a carry-in digit"
            [ test "Returns the sum of those numbers and a carry-out digit" <|
                \_ ->
                    rippleCarryAdder 1001 1101 1
                        |> Expect.equal 10111
            ]
        , describe "When the first input is 1111, and the second input is 1111"
            [ test "and carry-in is 0, the output is 11110" <|
                \_ ->
                    rippleCarryAdder 1111 1111 0
                        |> Expect.equal 11110
            , test "and carry-in is 1, the output is 11111" <|
                \_ ->
                    rippleCarryAdder 1111 1111 1
                        |> Expect.equal 11111
            ]
        , describe "When the first input is 0000, and the second input is 0000"
            [ test "And carry-in is 0, the output is 0000" <|
                \_ ->
                    rippleCarryAdder 0 0 0
                        |> Expect.equal 0
            , test "and carry-in is 1, the output is 0001" <|
                \_ ->
                    rippleCarryAdder 0 0 1
                        |> Expect.equal 1
            ]
        ]

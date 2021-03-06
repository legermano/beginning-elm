module Playground exposing
    ( Greeting(..)
    , add
    , computeSpeed
    , computeTime
    , descending
    , divide
    , doubleScores
    , escapeEarth
    , hashTag
    , highestScores
    , isLessThan320
    , list1
    , list2
    , main
    , multiply
    , multiplyByFive
    , revelation
    , sayHello
    , scoresLessThan320
    , signUp
    , validateEmail
    )

import Html exposing (Html, text)
import MyList exposing (MyList(..), isEmpty)
import Regex


type Greeting
    = Howdy
    | Hola
    | Namaste String
    | NumericalHi Int Int


main : Html msg
main =
    -- computeTime 2 3
    --     |> computeSpeed 7.5
    --     |> escapeEarth 11 "full"
    --     |> Html.text
    -- [ 316, 320, 312, 370, 337, 318, 314 ]
    --     |> List.sortWith descending
    --     |> Debug.toString
    --     |> Html.text
    -- validateEmail "thedude@rubix.com"
    --     |> Debug.toString
    --     |> Html.text
    -- multiplyByFive 3
    --     |> Debug.toString
    --     |> Html.text
    isEmpty list2
        |> Debug.toString
        |> text


escapeEarth : Float -> String -> Float -> String
escapeEarth myVelocity fuelStatus mySpeed =
    let
        escapeVelocityInKmPerSec =
            11.186

        orbitalSpeedInKmPerSec =
            7.67

        whereToLand =
            if fuelStatus == "low" then
                "Land on droneship"

            else
                "Land on launchpad"
    in
    if myVelocity > escapeVelocityInKmPerSec then
        "Godspeed"

    else if mySpeed == orbitalSpeedInKmPerSec then
        "Stay in orbit"

    else
        whereToLand


computeSpeed : Float -> Float -> Float
computeSpeed distance time =
    distance / time


computeTime : number -> number -> number
computeTime startTime endTime =
    endTime - startTime


add : number -> number -> number
add a b =
    a + b


multiply : number -> number -> number
multiply c d =
    c * d


divide : Float -> Float -> Float
divide e f =
    e / f


weekday : Int -> String
weekday dayInNumber =
    case dayInNumber of
        0 ->
            "Sunday"

        1 ->
            "Monday"

        2 ->
            "Tuesday"

        3 ->
            "Wednesday"

        4 ->
            "Thursday"

        5 ->
            "Friday"

        6 ->
            "Saturday"

        _ ->
            "Unknom day"


hashTag : Int -> String
hashTag dayInNumber =
    case weekday dayInNumber of
        "Sunday" ->
            "#SinDay"

        "Monday" ->
            "#MondayBlues"

        "Tuesday" ->
            "#TakeMeBackTuesday"

        "Wednsday" ->
            "#HumpDay"

        "Thursday" ->
            "#ThrowbackThursday"

        "Friday" ->
            "#FlashbackFriday"

        "Saturday" ->
            "#Caturday"

        _ ->
            "#Whatever"


revelation : String
revelation =
    """
    It became very clear to me sitting out there today
    that every decision I've made in my entire life has
    been wrong. My life is the complete "opposite" of
    everything I want it to be. Every instinct I have,
    in every aspect of life, be it something to wear,
    something to eat - it's all been wrong.
    """


descending : comparable -> comparable -> Order
descending a b =
    case compare a b of
        LT ->
            GT

        GT ->
            LT

        EQ ->
            EQ


validateEmail : String -> ( String, String )
validateEmail email =
    let
        emailPattern =
            "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\\b"

        regex =
            Maybe.withDefault Regex.never <|
                Regex.fromString emailPattern

        isValid =
            Regex.contains regex email
    in
    if isValid then
        ( "Valid email", "green" )

    else
        ( "Invalid email", "red" )


multiplyByFive : number -> number
multiplyByFive number =
    let
        multiplier =
            5
    in
    number * multiplier


scoreMultiplier : Int
scoreMultiplier =
    2


highestScores : List number
highestScores =
    [ 316, 320, 312, 370, 337, 318, 314 ]


doubleScores : List Int -> List Int
doubleScores scores =
    List.map (\x -> x * scoreMultiplier) scores


scoresLessThan320 : List number -> List number
scoresLessThan320 scores =
    List.filter isLessThan320 scores


isLessThan320 : number -> Bool
isLessThan320 score =
    score < 320


sayHello : Greeting -> String
sayHello greeting =
    case greeting of
        Howdy ->
            "Howdt y'all doin'?"

        Hola ->
            "Hola amigo!"

        Namaste message ->
            message

        NumericalHi value1 value2 ->
            value1 + value2 |> String.fromInt


signUp : String -> String -> Result String String
signUp email ageStr =
    case String.toInt ageStr of
        Nothing ->
            Err "Age must be an integer."

        Just age ->
            let
                emailPattern =
                    "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\\b"

                regex =
                    Maybe.withDefault Regex.never <|
                        Regex.fromString emailPattern

                isValidEmail =
                    Regex.contains regex email
            in
            if age < 13 then
                Err "You need to be at leas 13 years old to sign up."

            else if isValidEmail then
                Ok "Your account has been created successfully!"

            else
                Err "You entered an invalid email"


list1 : MyList a
list1 =
    Empty


list2 : MyList number
list2 =
    Node 9 Empty

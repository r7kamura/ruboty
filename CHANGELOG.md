## 0.2.4
* Reveal message prefix pattern as a class method

## 0.2.3
* Help message is formatted if adapter supported

## 0.2.2
* Now `Ellen::Robot#say(message)` can use `message[:original]`

## 0.2.1
* Store shell history in ~/.ellen_history

## 0.2.0
* Change adapter & message interface

## 0.1.3
* Change Ellen::Message interface

## 0.1.2
* Make Handler validatable

## 0.1.1
* Improve Brain interface

## 0.1.0
* Deprecate --adapter option

## 0.0.9
* Adapt mention name to `@<name>: <text>` format

## 0.0.8
* Mount Brain
* Change handler interface

## 0.0.7
* Add PING handler

## 0.0.6
* `ellen help` to show actions list

## 0.0.5
* Now Action can access to MatchData object via Message
* ENV["ROBOT_NAME"] or "ellen" is default name
* Robot only responds to mention unless :all option specified

## 0.0.4
* Add --dotenv option to load .env before running

## 0.0.3
* Add env DSL to define adapter

## 0.0.2
* Add Handler DSL Syntax
* Add --load option to load a ruby file before running

## 0.0.1
* 1st release

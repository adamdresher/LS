#### Problem
Goal: Create a program that manages robot factory settings.  New robots must be given new names that don't already exist.
Input: -
Output/Return: String (unique among all of it's class)
Rules:
- names must consist of 5 characters
  - 2 uppercase letters
  - 3 digits
- names are unique
- names are random
- program remembers all the existing names
- robots can reset their names
- `Robot` class
  - `#name`
    - sets the robot with a random name
    - name is not already assigned to a robot
  - `#reset`
    - replaces the robot's name with a random, new name
    - name is not already assigned to a robot
    - if a robot's name is reset, is it's name wiped from the database?

#### Examples
- RX837
- BC811

#### Data Structure
- collection of existing names
  - Hash # the ensures no new robot will use their previous name, nor any other previous name
    - key is the name
    - value is boolean, does the robot exist

#### Algorithm
- `Robot` class
  - `@@name_database`
    - empty array
  
  - `attr_reader :name`

  - #initialize`
    - reset `name`

  - `#reset`
    - loop
      - assign `name=()` to generate name
      - next iteration if name exists in the names database
      - add name to @@name_database
      - break loop
    - return name

  - `private`

  - `attr_writer :name`

  - `#generate_name`
    - randomly select uppercase letter two times
    - randomly select digit, 0..9, 3 times
    - join characters
    - return name

  - `#exists_in_database?
    - name exists in the @@name_database?


class jungle
  - make sound off of all animals
  - contains, meat, fish, bugs, grain
  - perform a random activity -->


class animal
  - methods: make sound, eat food, sleep
    - make sound: reduce energy level by 3
    - eating food: increase energy level by 5
    - sleeping: increase energy by 10
  - has energy level
  - some animals can play?
  - knows how many total animals exist -->

class tiger < animal
  - method: sleeping, eating
    - sleepin: increases by 5
    - eating: cannot eat grain

class Monkey < animal
  - method: eating, making a sound, play
    - eating: increase energy by 2
    - make sound: reduce energy by 4
  - play: if energy say "Oooo Oooo Oooo" and get -8 energy else "Monkey is too tired"

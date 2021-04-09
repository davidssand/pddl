(define (problem problem1)
    
    (:domain robots)
    
    (:objects 
        explorer1 explorer2 explorer3 - robot
        nave - startship
        earth-loc nave-loc L0 L2 L3 L4 L5 L6 L7 L8 - place
        trash - trash
        rock dirt - sample
        earth - base-station
    )

    (:init
        ;Holders positions
        (at explorer1 L5)
        (at explorer2 L0)
        (at explorer3 L7)
        (at nave nave-loc)
        (at earth earth-loc)

        (place-full L5)
        (place-full L0)
        (place-full L7)
        (place-full earth-loc)

        ;Allows trash to hold many robots
        ;Comment out this predicate to see robots comunicating between themselves!
        (holds-many trash)

        ;Neighbor positions
        (next nave-loc earth-loc) (next earth-loc nave-loc)
        (next nave-loc L8) (next L8 nave-loc)
        (next L7 L8) (next L8 L7)
        (next L7 L2) (next L2 L7)
        (next L7 L3) (next L3 L7)
        (next L2 trash) (next trash L2)
        (next L5 L2) (next L2 L5)
        (next L0 L2) (next L2 L0)
        (next L0 L5) (next L5 L0)
        (next L0 L3) (next L3 L0)
        (next L0 L6) (next L6 L0)
        (next L6 L3) (next L3 L6)

        ;Samples in positions
        (has L0 rock) (has L0 dirt)
        (has L7 rock) (has L7 dirt)
        (has L2 rock) (has L2 dirt)
        (has L3 rock) (has L3 dirt)
        (has L4 rock) (has L4 dirt)
        (has L5 rock) (has L5 dirt)
        (has L6 rock) (has L6 dirt)

        ;Allowed
        (move-allowed explorer1 L5 L0) (move-allowed explorer1 L0 L5)
        (move-allowed explorer1 L0 L2) (move-allowed explorer1 L2 L0)
        (move-allowed explorer1 L0 L3) (move-allowed explorer1 L3 L0)
        (move-allowed explorer1 L3 L6) (move-allowed explorer1 L6 L3)
        (move-allowed explorer1 L2 trash) (move-allowed explorer1 trash L2)
        (pick-allowed explorer1 dirt)

        (move-allowed explorer2 L3 L0) (move-allowed explorer2 L0 L3)
        (move-allowed explorer2 L0 L2) (move-allowed explorer2 L2 L0)
        (move-allowed explorer2 L2 trash) (move-allowed explorer2 trash L2)
        (pick-allowed explorer2 rock)

        (move-allowed explorer3 L7 L8) (move-allowed explorer3 L8 L7)
)
    
    (:goal
        (and
            (in-memory earth rock L0)
            (in-memory earth rock L3)
            (in-memory earth dirt L5)
            (in-memory earth dirt L6)
         )
    )
)

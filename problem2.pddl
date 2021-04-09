(define (problem problem1)
    
    (:domain robots)
    
    (:objects 
        explorer1 explorer2 - robot
        nave - startship
        earth-loc L0 nave-loc L2 L3 L5 L6 - place
        tr - trash
        rock dirt - sample
        earth - base-station
    )

    (:init
        ;Holders positions
        (at explorer1 L5)
        (at explorer2 L0)
        (at nave nave-loc)
        (at earth earth-loc)

        (location-full L5)
        (location-full L0)
        (location-full nave-loc)
        (location-full earth-loc)

        ;Allows tr to hold many robots
        ;Comment out this predicate to see robots comunicating between themselves!
        (holds-many tr)

        ;Neighbor positions
        (next nave-loc earth-loc) (next earth-loc nave-loc)
        (next nave-loc L2) (next L2 nave-loc)
        (next nave-loc L3) (next L3 nave-loc)
        (next L2 tr) (next tr L2)
        (next L5 L2) (next L2 L5)
        (next L0 L2) (next L2 L0)
        (next L0 L5) (next L5 L0)
        (next L0 L3) (next L3 L0)
        (next L0 L6) (next L6 L0)
        (next L6 L3) (next L3 L6)

        ;Samples in positions
        (has L0 rock) (has L0 dirt)
        (has L2 rock) (has L2 dirt)
        (has L3 rock) (has L3 dirt)
        (has L5 rock) (has L5 dirt)
        (has L6 rock) (has L6 dirt)

        ;Allowed
        (move-allowed explorer1 L5 L0) (move-allowed explorer1 L0 L5)
        (move-allowed explorer1 L0 L2) (move-allowed explorer1 L2 L0)
        (move-allowed explorer1 L0 L3) (move-allowed explorer1 L3 L0)
        (move-allowed explorer1 L3 L6) (move-allowed explorer1 L6 L3)
        (move-allowed explorer1 L2 tr) (move-allowed explorer1 tr L2)
        (pick-allowed explorer1 dirt)

        (move-allowed explorer2 L3 L0) (move-allowed explorer2 L0 L3)
        (move-allowed explorer2 L0 L2) (move-allowed explorer2 L2 L0)
        (move-allowed explorer2 L2 tr) (move-allowed explorer2 tr L2)
        (pick-allowed explorer2 rock)
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

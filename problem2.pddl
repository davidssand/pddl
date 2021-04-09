(define (problem problem1)
    
    (:domain robots)
    
    (:objects 
        explorer1 - robot
        ;explorer2 - robot
        stsh - startship
        earth-loc L0 stsh-loc L2 L3 L4 L5 L6 - place
        trash - trash
        rock dirt - sample
        earth - earth
    )

    (:init
        ;Holder positions
        (at explorer1 L5)
        (place-full L5)
       ; (at explorer2 L0)
        (at stsh stsh-loc)
        (place-full stsh-loc)
        (at earth earth-loc)
        (place-full earth-loc)

        ;Neighbor positions
        (next stsh-loc earth-loc) (next earth-loc stsh-loc)
        (next stsh-loc L2) (next L2 stsh-loc)
        (next stsh-loc L3) (next L3 stsh-loc)
        (next L2 trash) (next trash L2)
        (next L5 L2) (next L2 L5)
        (next L0 L2) (next L2 L0)
        (next L0 L5) (next L5 L0)
        (next L0 L3) (next L3 L0)
        (next L0 L6) (next L6 L0)
        (next L6 L3) (next L3 L6)

        ;Samples in positions
        (has L0 rock) (has L0 dirt)
        (has stsh-loc rock) (has stsh-loc dirt)
        (has L2 rock) (has L2 dirt)
        (has L3 rock) (has L3 dirt)
        (has L4 rock) (has L4 dirt)
        (has L5 rock) (has L5 dirt)
        (has L6 rock) (has L6 dirt)

        ;Moves allowed
        (allowed explorer1 L5 L0) (allowed explorer1 L0 L5)
        (allowed explorer1 L0 L2) (allowed explorer1 L2 L0)
        (allowed explorer1 L0 L3) (allowed explorer1 L3 L0)
        (allowed explorer1 L3 L6) (allowed explorer1 L6 L3)
        (allowed explorer1 L2 trash) (allowed explorer1 trash L2)
)
    
    (:goal
        (and
            (in-memory earth rock L6)
            (in-memory earth dirt L6)
         )
    )
)

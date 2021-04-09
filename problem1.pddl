(define (problem problem1)
    
    (:domain robots)
    
    (:objects 
        explorer1 - robot
        stsh - startship
        earth-loc L0 stsh-loc L2 L3 - place
        trash - trash
        rock dirt - sample
        earth - earth
    )

    (:init
        ;Holder positions
        (at explorer1 L3)
        (place-full L3)
        (at stsh stsh-loc)
        (place-full stsh-loc)
        (at earth earth-loc)
        (place-full earth-loc)

        ;Neighbor positions
        (next stsh-loc earth-loc)
        (next earth-loc stsh-loc)
        (next L3 L0) (next L0 L3)
        (next L0 L2) (next L2 L0)
        (next stsh-loc L2) (next L2 stsh-loc)
        (next stsh-loc L3) (next L3 stsh-loc)
        (next L2 trash) (next trash L2)
        
        ;Moves allowed
        (allowed explorer1 L3 L0)
        (allowed explorer1 L0 L3)
        (allowed explorer1 L0 L2)
        (allowed explorer1 L2 L0)
        (allowed explorer1 L2 trash)
        (allowed explorer1 trash L2)

        
        ;Samples in positions
        (has L0 rock) (has L0 dirt)
        (has stsh-loc rock) (has stsh-loc dirt)
        (has L2 rock) (has L2 dirt)
        (has L3 rock) (has L3 dirt)
    )
    
    (:goal
        (and
            (in-memory earth rock L3)
            (in-memory earth dirt L2)
         )
    )
)
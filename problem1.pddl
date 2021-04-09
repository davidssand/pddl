(define (problem problem1)
    
    (:domain robots)
    
    (:objects 
        explorer1 - robot
        startship - startship
        earth-loc L0 startship-loc L2 L3 - place
        trash - trash
        rock dirt - sample
        earth - earth
    )

    (:init
        ;Holder positions
        (at explorer1 L3)
        (place-full L3)
        (at startship startship-loc)
        (place-full startship-loc)
        (at earth earth-loc)
        (place-full earth-loc)

        ;Neighbor positions
        (next startship-loc earth-loc)
        (next earth-loc startship-loc)
        (next L3 L0) (next L0 L3)
        (next L0 L2) (next L2 L0)
        (next startship-loc L2) (next L2 startship-loc)
        (next startship-loc L3) (next L3 startship-loc)
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
        (has startship-loc rock) (has startship-loc dirt)
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
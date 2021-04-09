(define (problem problem1)
    
    (:domain robots)
    
    (:objects 
        explorer1 - robot
        ;explorer2 - robot
        startship - startship
        earth-loc L0 startship-loc L2 L3 L4 L5 L6 - place
        trash - trash
        rock dirt - sample
        earth - earth
    )

    (:init
        ;Holder positions
        (at explorer1 L5)
       ; (at explorer2 L0)
        (place-full L3)
        (at startship startship-loc)
        (place-full startship-loc)
        (at earth earth-loc)
        (place-full earth-loc)

        ;Neighbor positions
        (next startship-loc earth-loc) (next earth-loc startship-loc)
        (next startship-loc L2) (next L2 startship-loc)
        (next startship-loc L3) (next L3 startship-loc)
        (next L2 trash) (next trash L2)
        (next L5 L2) (next L2 L5)
        (next L0 L2) (next L2 L0)
        (next L0 L5) (next L5 L0)
        (next L0 L3) (next L3 L0)
        (next L0 L6) (next L6 L0)
        (next L6 L3) (next L3 L6)

        ;Samples in positions
        (has L0 rock) (has L0 dirt)
        (has startship-loc rock) (has startship-loc dirt)
        (has L2 rock) (has L2 dirt)
        (has L3 rock) (has L3 dirt)
        (has L4 rock) (has L4 dirt)
        (has L5 rock) (has L5 dirt)
        (has L6 rock) (has L6 dirt)
)
    
    (:goal
        (and
            (in-memory earth rock L6)
            (in-memory earth dirt L6)
         )
    )
)

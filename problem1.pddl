(define (problem problem1)
    
    (:domain robots)
    
    (:objects 
        explorer1 - robot
        startship - startship
        earth-location L0 L1 L2 L3 - place
        trash - trash
        rock dirt - sample
        earth - earth
    )

    (:init
        ;Holder positions
        (at explorer1 L3)
        (place-full L3)
        (at startship L1)
        (place-full L1)
        (at earth earth-location)
        (place-full earth-location)

        ;Neighbor positions
        (next L1 earth-location)
        (next earth-location L1)
        (next L3 L0) (next L0 L3)
        (next L0 L2) (next L2 L0)
        (next L1 L2) (next L2 L1)
        (next L1 L3) (next L3 L1)
        (next L2 trash) (next trash L2)
        
        ;Samples in positions
        (has L0 rock) (has L0 dirt)
        (has L1 rock) (has L1 dirt)
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
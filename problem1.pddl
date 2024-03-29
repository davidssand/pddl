(define (problem problem1)
    
    (:domain robots)
    
    (:objects 
        explorer1 - robot
        nave - startship
        earth-loc L0 nave-loc L2 L3 - place
        tr - trash
        rock dirt - sample
        earth - base-station
    )

    (:init
        ;Holder positions
        (at explorer1 L3)
        (location-full L3)
        (at nave nave-loc)
        (location-full nave-loc)
        (at earth earth-loc)
        (location-full earth-loc)

        (holds-many tr)

        ;Neighbor positions
        (next nave-loc earth-loc)
        (next earth-loc nave-loc)
        (next L3 L0) (next L0 L3)
        (next L0 L2) (next L2 L0)
        (next nave-loc L2) (next L2 nave-loc)
        (next nave-loc L3) (next L3 nave-loc)
        (next L2 tr) (next tr L2)
        
        ;Allowed
        (move-allowed explorer1 L3 L0)
        (move-allowed explorer1 L0 L3)
        (move-allowed explorer1 L0 L2)
        (move-allowed explorer1 L2 L0)
        (move-allowed explorer1 L2 tr)
        (move-allowed explorer1 tr L2)
        (pick-allowed explorer1 dirt)
        (pick-allowed explorer1 rock)

        ;Samples in positions
        (has L0 rock) (has L0 dirt)
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
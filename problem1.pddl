(define (problem problem1)
    
    (:domain robots)
    
    (:objects 
        explorer1 - robot
        startship - startship
        L0 L1 L2 L3 - location
        trash - trash
        rock dirt - sample
    )
    
    (:init
        (at explorer1 L3)
        (at startship L1)
        
        (next L3 L0)
        (next L0 L3)
        
        (next L0 L2)
        (next L2 L0)
        
        (next L1 L2)
        (next L2 L1)
        
        (next L1 L3)
        (next L3 L1)
        
        (next L2 trash)
        (next trash L2)
        
        (has L3 dirt)
        (has L2 rock)
    )
    
    (:goal
        (and
            (memorize explorer1 rock L2)
            (memorize explorer1 dirt L3)
         )
    )
)
(define (domain robots)

    (:requirements
        :strips
        :typing
    )
    
    (:types
        trash - location
        place robot startship - holder
        sample
    )
    
    (:predicates
        (at ?r - robot ?l - location)
        (next ?l1 ?l2 - location)
        (has ?h - holder ?s - sample)
        (origin ?s - sample ?l - location)
        (is-full ?r - robot)
        
        (analysed ?r - robot ?s - sample ?l - location)
    )
    
    (:action move
        :parameters (?r - robot ?l1 ?l2 - location)
        :precondition (and
            (at ?r ?l1)
            (next ?l1 ?l2)
        )
        :effect (and (at ?r ?l2) (not (at ?r ?l1)))
    )
    
    (:action pick
        :parameters (?r - robot ?l - location ?s - sample)
        :precondition (and
            (at ?r ?l)
            (has ?l ?s)
            (not (is-full ?r))
        )
        :effect (and (has ?r ?s) (is-full ?r))
    )
    
    (:action drop
        :parameters (?r - robot ?t - trash ?s - sample)
        :precondition (and
            (at ?r ?t)
            (has ?r ?s)
        )
        :effect (and
            (not (has ?r ?s))
            (not (is-full ?r))
        )
    )

    (:action communicate
        :parameters (?r - robot ?rl - location ?st - startship ?sl - location)
        :precondition (and (next ?rl ?sl) (has ?r ?s))
        :effect (and (has ?r ?s) (is-full ?r))
    )
)
    
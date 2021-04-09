(define (domain robots)

    (:requirements
        :strips
        :typing
    )
    
    (:types
        place trash - location
        place robot startship earth - holder
        sample
    )
    
    (:predicates
        (at ?r - robot ?l - location)
        (next ?l1 ?l2 - location)
        (has ?h - holder ?s - sample)
        (buffer-full ?r - robot)
        (in-memory ?h - holder ?s - sample ?l - location)
        (place-full ?p - place)
    )
    
    (:action move
        :parameters (?r - robot ?l1 - location ?l2 - location)
        :precondition (and
            (at ?r ?l1)
            (next ?l1 ?l2)
            (not (place-full ?l2))
        )
        :effect (and
            (at ?r ?l2)
            (not (at ?r ?l1))
            (not (place-full ?l1))
            (place-full ?l2)
        )
    )
    
    (:action pick
        :parameters (?r - robot ?l - location ?s - sample)
        :precondition (and
            (at ?r ?l)
            (has ?l ?s)
            (not (buffer-full ?r))
        )
        :effect (and
            (has ?r ?s)
            (in-memory ?r ?s ?l)
            (buffer-full ?r)
        )
    )

    (:action drop
        :parameters (?r - robot ?t - trash ?s - sample)
        :precondition (and
            (at ?r ?t)
            (has ?r ?s)
        )
        :effect (and
            (not (has ?r ?s))
            (not (buffer-full ?r))
        )
    )

    (:action communicate
        :parameters 
           (?sender - holder
            ?senderl - location
            ?receiver - holder
            ?receiverl - location
            ?s - sample
            ?sl - location)
        :precondition (and
            (at ?sender ?senderl)
            (at ?receiver ?receiverl)
            (next ?senderl ?receiverl)
            (in-memory ?sender ?s ?sl)
        )
        :effect (and
            (in-memory ?receiver ?s ?sl)
        )
    )
)
    
(define (domain robots)

    (:requirements
        :strips
        :typing
        :negative-preconditions
    )
    
    (:types
        place trash - location
        place robot startship earth - holder
        robot startship earth - obj
        sample
    )
    
    (:predicates
        (at ?o - obj ?l - location)
        (next ?l1 ?l2 - location)
        (has ?h - holder ?s - sample)
        (buffer-full ?r - robot)
        (in-memory ?h - holder ?s - sample ?l - location)
        (place-full ?l - location)
        (move-allowed ?r - robot ?l1 - location ?l2 - location)
        (pick-allowed ?r - robot ?s - sample)
    )
    
    (:action move
        :parameters (?r - robot ?l1 - location ?l2 - location)
        :precondition (and
            (at ?r ?l1)
            (next ?l1 ?l2)
            (not (place-full ?l2))
            (move-allowed ?r ?l1 ?l2)
        )
        :effect (and
            (at ?r ?l2)
            (not (at ?r ?l1))
            (not (place-full ?l1))
            (place-full ?l2)
        )
    )
    
    (:action pick
        :parameters (?r - robot ?p - place ?s - sample)
        :precondition (and
            (at ?r ?p)
            (has ?p ?s)
            (not (buffer-full ?r))
            (pick-allowed ?r ?s)
        )
        :effect (and
            (has ?r ?s)
            (in-memory ?r ?s ?p)
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
           (?sender - obj
            ?senderl - location
            ?receiver - obj
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
    
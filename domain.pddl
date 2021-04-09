(define (domain robots)

    (:requirements
        :strips
        :typing
        :negative-preconditions
    )
    
    (:types
        place trash - location
        place robot startship base-station - holder
        robot startship base-station - obj
        sample
    )
    
    (:predicates
        (at ?o - obj ?l - location)
        (next ?l1 ?l2 - location)
        (has ?h - holder ?s - sample)
        (buffer-full ?r - robot)
        (in-memory ?h - holder ?s - sample ?l - location)
        (location-full ?l - location)
        (move-allowed ?r - robot ?l1 - location ?l2 - location)
        (pick-allowed ?r - robot ?s - sample)
        (holds-many ?l - location)
    )
    
    (:action move
        :parameters (?r - robot ?l1 - location ?l2 - location)
        :precondition (and
            (at ?r ?l1)
            (next ?l1 ?l2)
            (or
                (not (location-full ?l2))
                (holds-many ?l2)
            )
            (move-allowed ?r ?l1 ?l2)
        )
        :effect (and
            (at ?r ?l2)
            (not (at ?r ?l1))
            (not (location-full ?l1))
            (location-full ?l2)
        )
    )
    
    (:action pick
        :parameters (?r - robot ?s - sample ?p - place)
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
        :parameters (?r - robot ?s - sample ?t - trash)
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
    
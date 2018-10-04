
;; This is a plain STRIPS formulation of the standard Logistics domain.

;; In this domain, there are six different types of objects: "object"
;; (the packages to be transported), "truck", "airplane" and their
;; common supertype "vehicle", "location" and the subtype "airport",
;; and finally "city". Types are defined by static (in the sense that
;; there are no operators that change their truth value) unary predicates.
;; The types of objects in a problem instance must be defined by including
;; the appropriate typing predicates in the initial state.

;; A binary static predicate called "loc" describes the topology of the
;; problem instance: "(loc ?l ?c)" is true iff the location ?l is in city
;; ?c.

(define (domain rescue)
  (:requirements :strips)
  (:predicates

   ;; Static predicates:
   (crate ?c) (helicopter ?h)
   (location ?l) 

   ;; Non-static predicates:
   (at ?x ?l) ;; ?x (package or vehicle) is at location ?l
   (in ?c ?h) ;; package ?p is in vehicle ?v
   (empty ?h)
   )

  ;; Actions for loading and unloading crates.
  ;; By declaring all trucks and airplanes to be also "vehicle", we
  ;; can use the same load/unload operator for both (otherwise we
  ;; would need one for each subtype of vehicle).
  (:action load
    :parameters (?c ?h ?l)
    :precondition (and (crate ?c) (helicopter ?h) (location ?l) (empty ?h)
		       (at ?h ?l) (at ?c ?l))
    :effect (and (in ?c ?h) (not (at ?c ?l)) (not (empty ?h))))

  (:action unload
    :parameters (?c ?h ?l)
    :precondition (and (crate ?c) (helicopter ?h) (location ?l)
		       (at ?h ?l) (in ?c ?h))
    :effect (and (at ?c ?l) (not (in ?c ?h)) (empty ?h)))

    ;; Fly a helicopter between two locations.
    (:action fly
      :parameters (?h ?l1 ?l2)
      :precondition (and (helicopter ?h) (location ?l1) (location ?l2)
             (at ?h ?l1))
      :effect (and (at ?h ?l2) (not (at ?h ?l1))))
    )

  ;; Drive a truck between two locations in the same city.
  ;; By declaring all locations, including airports, to be of type
  ;; "location", we can use only one driving operator (otherwise,
  ;; we would again need one for each case, i.e. one for from-location-
  ;; to-airport, one for from-location-to-location, etc. Very
  ;; unnecessay).

  ;;(:action drive
  ;;  :parameters (?t ?l1 ?l2 ?c)
  ;;  :precondition (and (truck ?t) (location ?l1) (location ?l2) (city ?c)
	;;	       (at ?t ?l1) (loc ?l1 ?c) (loc ?l2 ?c))
  ;;  :effect (and (at ?t ?l2) (not (at ?t ?l1))))

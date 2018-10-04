
;; This is a small problem instance for the standard Logistics domain,
;; as defined in "logistic.pddl".

(define (problem you_have)
  (:domain rescue)
  (:objects
   person1 person2 person3
   helicopter1 helicopter2
   depot1
   food1
   water1
   medicine1
   )
  (:init
   ;; Type declarations:
   (crate food1) (crate water1) (crate medicine1)

   ;; likewise, airports must be declared both as "location" and as
   ;; the subtype "airport",
   (location person1) (location person2) (location person3)
   (location depot1)
   (helicopter helicopter1) (helicopter helicopter2)

   ;; The actual initial state of the problem, which specifies the
   ;; initial locations of all packages and all vehicles:
   (at food1 depot1)
   (at water1 depot1)
   (at medicine1 depot1)
   (at helicopter1 depot1)
   (at helicopter2 depot1)
   (empty helicopter1)
   (empty helicopter2)
   )

  ;; The goal is to have both packages delivered to their destinations:
  (:goal (and (at food1 person1) (at water1 person2)))
  )

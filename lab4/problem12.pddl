
;; This is a small problem instance for the standard Logistics domain,
;; as defined in "logistic.pddl".

(define (problem you_have)
  (:domain rescue)
  (:objects
   person1 person2 person3
   helicopter1 helicopter2
   depot1
   food1 food2 ;;food3
   water1 water2 ;;water3
   medicine1 medicine2 ;;medicine3
   )
  (:init
   ;; Type declarations:
   (food food1) (water water1) (medicine medicine1)
   (food food2) (water water2) (medicine medicine2)
   ;;(food food2) (water water3) (medicine medicine3)
   (crate food1) (crate water1) (crate medicine1)
   (crate food2) (crate water2) (crate medicine2)
   ;;(crate food3) (crate water3) (crate medicine3)
   (food_crate food1) (water_crate water1) (medicine_crate medicine1)
   (food_crate food2) (water_crate water2) (medicine_crate medicine2)

   ;; likewise, airports must be declared both as "location" and as
   ;; the subtype "airport",
   (location person1) (location person2) (location person3)
   (location depot1)
   (helicopter helicopter1) (helicopter helicopter2)

   ;; The actual initial state of the problem, which specifies the
   ;; initial locations of all packages and all vehicles:
   (at food1 depot1)
   (at food2 depot1)
   ;;(at food3 depot1)
   (at water1 depot1)
   (at water2 depot1)
   ;;(at water3 depot1)
   (at medicine1 depot1)
   (at medicine2 depot1)
  ;; (at medicine3 depot1)
   (at helicopter1 depot1)
   (at helicopter2 depot1)
   (empty helicopter1)
   (empty helicopter2)
   )

  ;; The goal is to have both packages delivered to their destinations:
  (:goal (and (foo person1) (wat person2) (foo person3) (wat person3)
  (medi person3) (medi person1)))
  )


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
   ;; Food water and medicine declared bots as crate_type and crate
   (food_crate food1) (water_crate water1) (medicine_crate medicine1)
   (food_crate food2) (water_crate water2) (medicine_crate medicine2)
   (crate food1) (crate water1) (crate medicine1)
   (crate food2) (crate water2) (crate medicine2)

   (location person1) (location person2) (location person3)
   (location depot1)
   (helicopter helicopter1) (helicopter helicopter2)

   ;; The actual initial state of the problem, which specifies the
   ;; initial locations of all crates and all helicopters:
   (at food1 depot1)
   (at food2 depot1)
   (at water1 depot1)
   (at water2 depot1)
   (at medicine1 depot1)
   (at medicine2 depot1)
   (at helicopter1 depot1)
   (at helicopter2 depot1)
   (empty helicopter1)
   (empty helicopter2)
   )

  ;; The goal is to have every person get what they need:
  (:goal (and (got_food person1) (got_medicine person1)
  (got_food person2) (got_water person2)
  (got_food person3) (got_water person3) (got_medicine person3) ))
  )

;; Alternative 4: Emergency Services Logistics

(define (domain rescue)
  (:requirements :strips)
  (:predicates

   ;; Static predicates:
   (crate ?c) (helicopter ?h)
   (location ?l)
   (water_crate ?c)
   (food_crate ?c)
   (medicine_crate ?c)

   ;; Non-static predicates:
   (at ?x ?l) ;; ?x (package or helicopter) is at location ?l
   (in ?c ?h) ;; package ?p is in vehicle ?v
   (empty ?h)
   (got_water ?l)
   (got_medicine ?l)
   (got_food ?l)
   )

  ;; Actions for loading and unloading crates.
  ;; By declaring all the different types of crates to be a crate, we
  ;; can use the same load/unload operator for every type.
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


    ;; Open a crate and get some of its contents
    (:action get_water
      :parameters (?c ?l)
      :precondition (and (crate ?c) (location ?l)
             (at ?c ?l) (water_crate ?c))
      :effect (got_water ?l))
      ;; get medicine
      (:action get_medicine
        :parameters (?c ?l)
        :precondition (and (crate ?c) (location ?l)
               (at ?c ?l) (medicine_crate ?c))
        :effect (got_medicine ?l))

        ;; get medicine
        (:action get_food
          :parameters (?c ?l)
          :precondition (and (crate ?c) (location ?l)
                 (at ?c ?l) (food_crate ?c))
          :effect (got_food ?l))


    )

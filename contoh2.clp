(deftemplate person
  (slot name(type SYMBOL))
  (slot mother (type SYMBOL))
  (slot father (type SYMBOL))
)

(deffacts family
  (person (name John) (mother Mary) (father Bob))
  (person (name Alice) (mother Aisa) (father Bob))
  (person (name Ricardo) (mother Aisa) (father Bob))
) 

(defrule siblings
  (person (name ?name1) (mother ?mother1) (father ?father1))
  (person (name ?name2) (mother ?mother2) (father ?father2))
  (test (and (neq ?name1 ?name2)
             (eq ?mother1 ?mother2)
             (eq ?father1 ?father2)))
  =>
  (printout t ?name1 " and " ?name2 " are siblings." crlf)
)

(defrule stepsiblings
  (person (name ?name1) (mother ?mother1) (father ?father1))
  (person (name ?name2) (mother ?mother2) (father ?father2))
  (test (or (and (neq ?name1 ?name2)
                 (eq ?mother1 ?mother2)
                 (neq ?father1 ?father2))
            (and (neq ?name1 ?name2)
                 (neq ?mother1 ?mother2)
                 (eq ?father1 ?father2))))
  =>
  (printout t ?name1 " and " ?name2 " are step-siblings." crlf)
)
(deftemplate genre
    (slot name)
    (slot min-bpm)
    (slot max-bpm))

; startup vs deffacts
(defrule startup ""
    =>
    (assert (genre (name house) (min-bpm 118) (max-bpm 135)))
    (assert (genre (name disco) (min-bpm 90) (max-bpm 115)))
    )

(defrule print-possibilities
    ?g <- (genre {min-bpm <= 125 && max-bpm >= 125})
    =>
    (printout t "genre is " ?g.name crlf))
;-----------------------------------------------------------------------------
; Templates
;-----------------------------------------------------------------------------

(deftemplate attributes
    (multislot feel 			(type STRING) (allowed-values soulful funky warm ambient cold uplifting dystopian hypnotic aggressive angry happy sad calming abrasive pleasant cheesy danceable not-danceable))
    (multislot percussion 		(type STRING) (allowed-values four-on-the-floor breakbeat none sampled-breaks drum-machine live-drummer))
    (multislot arrangement 		(type STRING) (allowed-values verse-chorus buildup-breakdown repetitive minimalist))
    (multislot rhythm-meter 	(type STRING) (allowed-values four-four non-four-four heavily-syncopated unsyncopated intricate-rhythms simple-rhythms groovy-feel straight-feel))
    (multislot tonality 		(type STRING) (allowed-values major minor mixed))
    (multislot instrumentation 	(type STRING) (allowed-values band electronic lush sparse turntablism-present))
    (multislot timbre 			(type STRING) (allowed-values digital organic thin wide highly-produced weakly-produced))
    (multislot vocals 			(type STRING) (allowed-values present absent sampled studio-recording male female heavily-effected lightly-effected dry autotuned not-autotuned breathy diva-style rap-style soulful melodic unpitched english non-english harmonies))
)

(deftemplate genre
    extends attributes
    (slot name (type STRING) (allowed-values house trance techno hardcore breakbeat jungle downtempo))
    (slot min-bpm (type INTEGER))
    (slot max-bpm (type INTEGER))
)

(deftemplate subgenre
    extends genre
    (slot subgenre-name 	(type STRING))
    (slot subgenre-min-bpm 	(type INTEGER))
    (slot subgenre-max-bpm 	(type INTEGER))
)

(deftemplate working-memory
    extends subgenre
    (slot obvious-tempo (allowed-values TRUE FALSE) (default FALSE))
    (slot bpm (type INTEGER) (default 0))
)

;-----------------------------------------------------------------------------
; Facts
;-----------------------------------------------------------------------------
(deffacts knowledge-base
    (subgenre (name house) (subgenre-name disco) (subgenre-min-bpm 98) (subgenre-max-bpm 135) (feel soulful funky warm danceable) (percussion four-on-the-floor live-drummer) (arrangement verse-chorus) (rhythm-meter four-four heavily-syncopated groovy-feel) (tonality mixed) (instrumentation band lush) (timbre organic wide highly-produced) (vocals male female present studio-recording lightly-effected not-autotuned melodic english harmonies))
    (subgenre (name house) (subgenre-name italo) (subgenre-min-bpm 120) (subgenre-max-bpm 132) (feel happy cheesy danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter four-four simple-rhythms straight-feel) (tonality mixed) (instrumentation electronic) (timbre digital thin) (vocals present male female studio-recording heavily-effected not-autotuned melodic english harmonies))
	(subgenre (name house) (subgenre-name synthpop) (subgenre-min-bpm 118) (subgenre-max-bpm 166) (feel warm happy danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter four-four straight-feel) (tonality mixed) (instrumentation electronic lush) (timbre digital wide highly-produced) (vocals present male female studio-recording heavily-effected not-autotuned melodic english harmonies))
    
    )

;-----------------------------------------------------------------------------
; Questions
;-----------------------------------------------------------------------------
(deftemplate question
    (slot name (type STRING))
    (slot type (type STRING) (allowed-values boolean multiple-choice user-input-integer))
    (slot question-text (type STRING))
    (slot explanation (type STRING))
    (multislot choices (type STRING))
    )



;-----------------------------------------------------------------------------
; Rules
;-----------------------------------------------------------------------------
; startup vs deffacts
(defrule startup 
    "Takes care of necessary initializations."
    =>
    (reset)
	(printout t "Is there an obvious tempo?  (Can you tap your hand to the beat?) Y or N)" crlf)
    (bind ?obvious-tempo (read))
    (if (str-compare ?obvious-tempo "Y") then
    	(assert (working-memory (obvious-tempo TRUE)))
     else
        (assert (working-memory (obvious-tempo FALSE)))
    )
)

(defrule obvious-tempo-rule
	?wm <- (working-memory {obvious-tempo == TRUE && bpm == 0})
    =>
    (printout t "What is the bpm?")
    (bind ?bpm (integer (read)))
    (printout t ?bpm crlf)
    (facts)
    (modify ?wm (bpm ?bpm))
    )


(defrule bpm-input
    (working-memory (bpm ?bpm))
    (subgenre (subgenre-min-bpm ?smin) (subgenre-max-bpm ?smax) (name ?name))
    (test (and (neq nil ?bpm) (neq nil ?smin) (neq nil ?smax)))
    (test (and (> ?bpm 0)(<= ?smin ?bpm) (<= ?smax ?bpm)))
    =>
    (printout t ?bpm " " ?smin " " ?smax crlf)
    (printout t ?bpm crlf)
    (printout t "One possible subgenre is " ?name " at " ?bpm "bpm."crlf))
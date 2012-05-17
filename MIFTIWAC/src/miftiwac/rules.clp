;-----------------------------------------------------------------------------
; Templates
;-----------------------------------------------------------------------------

(deftemplate attributes
    (multislot feel 			(type STRING) (allowed-values soulful funky jazzy warm ambient cold uplifting dystopian hypnotic aggressive angry happy sad calming abrasive pleasant cheesy danceable not-danceable))    
    (multislot percussion 		(type STRING) (allowed-values four-on-the-floor breakbeat none sampled-breaks drum-machine live-drummer))
    (multislot arrangement 		(type STRING) (allowed-values verse-chorus buildup-breakdown repetitive minimalist))
    (multislot rhythm-meter 	(type STRING) (allowed-values four-four non-four-four heavily-syncopated unsyncopated intricate-rhythms simple-rhythms groovy-feel straight-feel))
    (multislot instrumentation 	(type STRING) (allowed-values band electronic lush sparse turntablism-present 303-present))
    (multislot timbre 			(type STRING) (allowed-values digital organic thin wide highly-produced weakly-produced melodic-harmonic rhythmic))
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
    (slot current-step (type STRING) (allowed-values obvious-tempo bpm vocals))
    (slot question (allowed-values TRUE FALSE))
)

;-----------------------------------------------------------------------------
; Facts
;-----------------------------------------------------------------------------
(deffacts knowledge-base
    (subgenre (name house) (subgenre-name disco) (subgenre-min-bpm 98) (subgenre-max-bpm 135) (feel soulful funky warm danceable) (percussion four-on-the-floor live-drummer) (arrangement verse-chorus) (rhythm-meter four-four heavily-syncopated groovy-feel) (instrumentation band lush) (timbre organic wide highly-produced melodic-harmonic) (vocals male female present studio-recording lightly-effected not-autotuned melodic english harmonies))
    (subgenre (name house) (subgenre-name italo) (subgenre-min-bpm 120) (subgenre-max-bpm 132) (feel happy cheesy danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter four-four simple-rhythms straight-feel) (instrumentation electronic) (timbre digital thin melodic-harmonic) (vocals present male female studio-recording heavily-effected not-autotuned melodic english harmonies))
	(subgenre (name house) (subgenre-name synthpop) (subgenre-min-bpm 118) (subgenre-max-bpm 166) (feel warm happy danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter four-four straight-feel) (instrumentation electronic lush) (timbre digital wide highly-produced melodic-harmonic) (vocals present male female studio-recording heavily-effected not-autotuned melodic english harmonies))
    (subgenre (name house) (subgenre-name classic) (subgenre-min-bpm 120) (subgenre-max-bpm 126) (feel soulful warm jazzy danceable) (percussion four-on-the-floor drum-machine) (arrangement repetitive) (rhythm-meter four-four heavily-syncopated simple-rhythms groovy-feel) (instrumentation electronic sparse) (timbre digital thin weakly-produced melodic-harmonic) (vocals studio-recording dry not-autotuned soulful english))
    (subgenre (name house) (subgenre-name garage) (subgenre-min-bpm 110) (subgenre-max-bpm 124) (feel soulful funky jazzy warm danceable) (percussion four-on-the-floor drum-machine) (rhythm-meter four-four heavily-syncopated simple-rhythms groovy-feel) (instrumentation electronic sparse) (timbre digital melodic-harmonic) (vocals present studio-recording dry autotuned soulful melodic english))
    (subgenre (name house) (subgenre-name acid) (subgenre-min-bpm 118) (subgenre-max-bpm 124) (feel cold dystopian abrasive danceable) (percussion four-on-the-floor drum-machine) (rhythm-meter four-four unsyncopated simple-rhythms straight-feel) (instrumentation electronic sparse 303-present) (timbre digital thin weakly-produced rhythmic))
    (subgenre (name house) (subgenre-name progressive) (subgenre-min-bpm 124) (subgenre-max-bpm 132) (feel warm hypnotic pleasant danceable) (percussion four-on-the-floor drum-machine) (arrangement buildup-breakdown) (rhythm-meter four-four heavily-syncopated groovy-feel) (instrumentation electronic lush) (timbre digital wide highly-produced melodic-harmonic) (vocals studio-recording heavily-effected autotuned melodic english))
    (subgenre (name house) (subgenre-name eurodance) (subgenre-min-bpm 132) (subgenre-max-bpm 144) (feel soulful uplifting happy cheesy danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter four-four unsyncopated simple-rhythms straight-feel) (instrumentation electronic) (timbre digital melodic-harmonic) (vocals present studio-recording female lightly-effected not-autotuned melodic english diva-style))
    (subgenre (name house) (subgenre-name vocal) (subgenre-min-bpm 118) (subgenre-max-bpm 134) (feel soulful funky warm uplifting danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter four-four heavily-syncopated simple-rhythms groovy-feel) (instrumentation electronic) (timbre digital wide highly-produced melodic-harmonic) (vocals present studio-recording female lightly-effected not-autotuned diva-style soulful melodic english))
    (subgenre (name house) (subgenre-name anthem) (subgenre-min-bpm 120) (subgenre-max-bpm 136) (feel cold danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter four-four heavily-syncopated simple-rhythms groovy-feel) (instrumentation electronic) (timbre digital wide highly-produced melodic-harmonic) (vocals sampled male))
    (subgenre (name house) (subgenre-name jpop) (subgenre-min-bpm 140) (subgenre-max-bpm 160) (feel happy cheesy danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter four-four unsyncopated simple-rhythms straight-feel) (instrumentation electronic lush ) (timbre digital wide highly-produced melodic-harmonic) (vocals present studio-recording female heavily-effected melodic non-english))
    (subgenre (name house) (subgenre-name eurobeat) (subgenre-min-bpm 140) (subgenre-max-bpm 160) (feel happy cheesy danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter four-four unsyncopated simple-rhythms straight-feel) (instrumentation electronic lush) (timbre digital wide highly-produced melodic-harmonic) (vocals present studio-recording female heavily-effected melodic english))
    (subgenre (name house) (subgenre-name deep) (subgenre-min-bpm 120) (subgenre-max-bpm 132) (feel jazzy danceable) (percussion four-on-the-floor drum-machine) (rhythm-meter four-four heavily-syncopated groovy-feel) (instrumentation electronic) (timbre organic wide highly-produced melodic-harmonic) (vocals sampled studio-recording melodic english))
    (subgenre (name house) (subgenre-name funk) (subgenre-min-bpm 122) (subgenre-max-bpm 132) (feel funky warm uplifting pleasant danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter four-four heavily-syncopated intricate-rhythms groovy-feel) (instrumentation electronic lush) (timbre organic wide highly-produced melodic-harmonic))
    (subgenre (name house) (subgenre-name micro) (subgenre-min-bpm 120) (subgenre-max-bpm 134) (feel cold dystopian danceable) (percussion four-on-the-floor drum-machine) (arrangement minimalist) (rhythm-meter four-four) (instrumentation electronic sparse) (timbre organic thin rhythmic) (vocals absent))
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
    (slot current-step (type STRING) (allowed-values obvious-tempo bpm vocals))
    )

;-----------------------------------------------------------------------------
; Rules
;-----------------------------------------------------------------------------
; startup vs deffacts
(defrule startup 
    "Takes care of necessary initializations."
    =>
    (reset)
	(assert (working-memory (current-step obvious-tempo)))
)

(deffunction streq (?a ?b) (= (str-compare ?a ?b) 0))

; first step
(defrule obvious-tempo-question
    ?wm <- (working-memory (current-step ?step) (question ?question))
    (test (streq ?step "obvious-tempo"))
    (test (= ?question TRUE))
    =>
    (printout t "Is there an obvious tempo?  (Can you tap your hand to the beat?) Y or N)" crlf)
    (bind ?obvious-tempo (streq (read) "Y"))
    (modify ?wm (obvious-tempo ?obvious-tempo)
        		(current-step (if ?obvious-tempo then bpm else vocals)))
)

/*(defrule obvious-tempo-filter
    ?wm <- (working-memory (current-step ?step) (question ?question) (obvious-tempo ?wm-obvious))
    (test (streq ?step "obvious-tempo"))
    (test (= ?question FALSE))
    ?subgenre <- (subgenre (obvious-tempo ?subgenre-obvious))
    (test (neq ?wm-obvious ?subgenre-obvious))
    =>
    (retract ?subgenre)
)*/

; second step
(defrule bpm-question
    ?wm <- (working-memory (current-step ?step) (obvious-tempo TRUE) (question ?question))
    (test (streq ?step "bpm"))
    (test (= ?question TRUE))
    =>
    (printout t "What is the bpm?" crlf)
    (bind ?bpm (integer (read)))
    (modify ?wm (bpm ?bpm) (question FALSE))
)

(defrule bpm-filter
    ?wm <- (working-memory (current-step ?step) (obvious-tempo TRUE) (question ?question) (bpm ?bpm))
    (test (streq ?step "bpm"))
    (test (= ?question FALSE))
    ?subgenre <- (subgenre (subgenre-min-bpm ?smin) (subgenre-max-bpm ?smax) (subgenre-name ?name))
    (test (or (< ?bpm ?smin) (> ?bpm ?smax)))
    =>
    (retract ?subgenre)
    (modify ?wm (current-step vocals) (question TRUE))
)

; third step
; TODO a song could easily fit multiple categories
(defrule vocals-question
    ?wm <- (working-memory (current-step ?step) (question ?question))
    (test (streq ?step "vocals"))
    (test (= ?question TRUE))
    =>
    (printout t "What type of vocals does the song have? (present absent sampled studio-recording male female heavily-effected lightly-effected dry autotuned not-autotuned breathy diva-style rap-style soulful melodic unpitched english non-english harmonies)" crlf)
    (bind ?vocals (read))
    (modify ?wm (vocals ?vocals) (question FALSE))
)

(defrule vocals-filter
    ?wm <- (working-memory (current-step ?step) (question ?question) (vocals ?wm-vocals))
    (test (streq ?step "vocals"))
    (test (= ?question FALSE))
    ?subgenre <- (subgenre (vocals ?subgenre-vocals))
    (not (streq ?wm-vocals ?subgenre-vocals))
    =>
    (modify ?wm (vocals ?vocals) (question FALSE))
)

/*(defrule question (declare (salience 100))
	?wm <- (working-memory (current-step ?step) (question TRUE)) ;TODO(joel) maybe fix this
    ?q <- (question (current-step ?step))
    =>
    (printout t ?q.question-text crlf)
    (bind ?input (read))
    (modify ?wm (question FALSE))
    (if (str-compare ?q.type "boolean") then
        (boolean-answer ?input)
     elif (str-compare ?q.type "multiple-choice") then
        (multiple-choice ?input)
     else (user-input-integer ?input))
    )*/
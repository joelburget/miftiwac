

;-----------------------------------------------------------------------------
; Templates
;-----------------------------------------------------------------------------
/*
(deftemplate attributes
    (multislot feel (type STRING) (allowed-values soulful funky jazzy warm ambient cold uplifting dystopian hypnotic aggressive angry happy sad calming abrasive pleasant cheesy danceable))
    (multislot percussion (type STRING) (allowed-values four-on-the-floor breakbeat none sampled-breaks drum-machine live-drummer))
    (multislot arrangement (type STRING) (allowed-values verse-chorus buildup-breakdown repetitive minimalist))
    (multislot rhythm-meter (type STRING) (allowed-values obvious-tempo four-four non-four-four heavily-syncopated unsyncopated intricate-rhythms simple-rhythms groovy-feel straight-feel))
    (multislot instrumentation (type STRING) (allowed-values band electronic lush sparse turntablism-present 303-present))
    (multislot timbre (type STRING) (allowed-values digital organic thin wide highly-produced weakly-produced melodic-harmonic rhythmic))
    (multislot vocals (type STRING) (allowed-values present absent sampled studio-recording male female heavily-effected lightly-effected dry autotuned not-autotuned breathy diva-style rap-style soulful melodic unpitched english non-english harmonies))
)
*/
/*
(deftemplate attributes
    (slot soulful (allowed-values true false unknown) (default unknown))
    (slot funky (allowed-values true false unknown)(default unknown))
    (slot jazzy (allowed-values true false unknown)(default unknown))
    (slot warm (allowed-values true false unknown)(default unknown))
    (slot ambient (allowed-values true false unknown)(default unknown))
    (slot cold (allowed-values true false unknown)(default unknown))
    (slot uplifting (allowed-values true false unknown)(default unknown))
    (slot dystopian (allowed-values true false unknown)(default unknown))
    (slot hypnotic (allowed-values true false unknown)(default unknown))
    (slot aggressive (allowed-values true false unknown)(default unknown))
    (slot angry (allowed-values true false unknown)(default unknown))
    (slot happy (allowed-values true false unknown)(default unknown))
    (slot sad (allowed-values true false unknown)(default unknown))
    (slot abrasive (allowed-values true false unknown)(default unknown))
    (slot pleasant (allowed-values true false unknown)(default unknown))
    (slot cheesy (allowed-values true false unknown)(default unknown))
    (slot danceable (allowed-values true false unknown)(default unknown))
    (slot four-on-the-floor (allowed-values true false unknown)(default unknown))
    (slot breakbeat (allowed-values true false unknown)(default unknown))
    (slot percussion-none (allowed-values true false unknown)(default unknown))
    (slot sampled-breaks (allowed-values true false unknown)(default unknown))
    (slot drum-machine (allowed-values true false unknown)(default unknown))
    (slot live-drummer (allowed-values true false unknown)(default unknown))
    (slot verse-chorus (allowed-values true false unknown)(default unknown))
    (slot buildup-breakdown (allowed-values true false unknown)(default unknown))
    (slot repetitive (allowed-values true false unknown)(default unknown))
    (slot minimalist (allowed-values true false unknown)(default unknown))
    (slot obvious-tempo (allowed-values true false unknown)(default unknown))
    (slot syncopated (allowed-values true false unknown)(default unknown))
    (slot intricate-rhythms (allowed-values true false unknown)(default unknown))
    (slot groovy-feel (allowed-values true false unknown)(default unknown))
    (slot band (allowed-values true false unknown)(default unknown))
    (slot electronic (allowed-values true false unknown)(default unknown))
    (slot lush-instrumentation (allowed-values true false unknown)(default unknown))
    (slot turntablism (allowed-values true false unknown)(default unknown))
    (slot three-oh-three (allowed-values true false unknown)(default unknown))
    (slot digital (allowed-values true false unknown)(default unknown))
    (slot thin (allowed-values true false unknown)(default unknown))
    (slot highly-produced (allowed-values true false unknown)(default unknown))
    (slot melodic-harmonic-timbre (allowed-values true false unknown)(default unknown))
    (slot vocals-present (allowed-values true false unknown)(default unknown))
    (slot vocals-studio-recorded (allowed-values true false unknown)(default unknown))
    (slot vocals-sampled (allowed-values true false unknown)(default unknown))
    (slot vocals-male (allowed-values true false unknown)(default unknown))
    (slot vocals-female (allowed-values true false unknown)(default unknown))
    (slot vocals-heavily-effected (allowed-values true false unknown)(default unknown))
    (slot vocals-autotuned (allowed-values true false unknown)(default unknown))
    (slot vocals-breathy (allowed-values true false unknown)(default unknown))
    (slot vocals-diva (allowed-values true false unknown)(default unknown))
    (slot vocals-rap-style (allowed-values true false unknown)(default unknown))
    (slot vocals-melodic (allowed-values true false unknown)(default unknown))
    (slot vocals-unpitched (allowed-values true false unknown)(default unknown))
    (slot vocals-english (allowed-values true false unknown)(default unknown))
)
*/

(deftemplate attributes
(multislot true (allowed-values 	soulful funky jazzy warm ambient cold uplifting 
            						dystopian hypnotic aggressive angry happy sad abrasive cheesy danceable 
            						four-on-the-floor breakbeat percussion-none sampled-breaks drum-machine live-drummer 
            						verse-chorus buildup-breakdown repetetive minimalist 
            						obvious-tempo syncopated intricate-rhythms groovy-feel 
            						band-not-electronic sparse-instrumentation turntablism three-oh-three 
            						digital thin rhythmic-timbre 
            						vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
            						vocals-heavily-effected vocals-autotuned vocals-breathy vocals-diva 
            						vocals-rap-style vocals-melodic vocals-unpitched vocals-english))

(multislot false (allowed-values 	soulful funky jazzy warm ambient cold uplifting 
            						dystopian hypnotic aggressive angry happy sad abrasive cheesy danceable 
            						four-on-the-floor breakbeat percussion-none sampled-breaks drum-machine live-drummer 
            						verse-chorus buildup-breakdown repetetive minimalist 
            						obvious-tempo syncopated intricate-rhythms groovy-feel 
            						band-not-electronic sparse-instrumentation turntablism three-oh-three 
            						digital thin rhythmic-timbre 
            						vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
            						vocals-heavily-effected vocals-autotuned vocals-breathy vocals-diva 
            						vocals-rap-style vocals-melodic vocals-unpitched vocals-english))

(multislot unknown (allowed-values 	soulful funky jazzy warm ambient cold uplifting 
            						dystopian hypnotic aggressive angry happy sad abrasive cheesy danceable 
            						four-on-the-floor breakbeat percussion-none sampled-breaks drum-machine live-drummer 
            						verse-chorus buildup-breakdown repetetive minimalist 
            						obvious-tempo syncopated intricate-rhythms groovy-feel 
            						band-not-electronic sparse-instrumentation turntablism three-oh-three 
            						digital thin rhythmic-timbre 
            						vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
            						vocals-heavily-effected vocals-autotuned vocals-breathy vocals-diva 
            						vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
        
        		   (default 		soulful funky jazzy warm ambient cold uplifting 
            						dystopian hypnotic aggressive angry happy sad abrasive cheesy danceable 
            						four-on-the-floor breakbeat percussion-none sampled-breaks drum-machine live-drummer 
            						verse-chorus buildup-breakdown repetetive minimalist 
            						obvious-tempo syncopated intricate-rhythms groovy-feel 
            						band-not-electronic sparse-instrumentation turntablism three-oh-three 
            						digital thin rhythmic-timbre 
            						vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
            						vocals-heavily-effected vocals-autotuned vocals-breathy vocals-diva 
            						vocals-rap-style vocals-melodic vocals-unpitched vocals-english))
)


(deftemplate genre
    extends attributes
    (slot name (type STRING) (allowed-values house trance techno hardcore breakbeat jungle downtempo))
)

(deftemplate subgenre
    extends genre
    (slot subgenre-name (type STRING) (default no-ad))
    (slot subgenre-min-bpm (type INTEGER) (default -1))
    (slot subgenre-max-bpm (type INTEGER) (default -1))
    (slot membership-value (type INTEGER) (default 0))
)

(deftemplate working-memory
    extends subgenre
    (slot bpm (type INTEGER) (default 0))
    (slot toggle (allowed-values true false) (default false))
    (slot threshold (type INTEGER) (default 20))
)

(deftemplate question-template
    (slot reference-attribute    (allowed-values soulful funky jazzy warm ambient cold uplifting 
            						dystopian hypnotic aggressive angry happy sad abrasive cheesy danceable 
            						four-on-the-floor breakbeat percussion-none sampled-breaks drum-machine live-drummer 
            						verse-chorus buildup-breakdown repetetive minimalist 
            						obvious-tempo syncopated intricate-rhythms groovy-feel 
            						band-not-electronic sparse-instrumentation turntablism three-oh-three 
            						digital thin rhythmic-timbre 
            						vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
            						vocals-heavily-effected vocals-autotuned vocals-breathy vocals-diva 
            						vocals-rap-style vocals-melodic vocals-unpitched vocals-english))
    (slot membership-value (type INTEGER))
    (slot question-text (type STRING))
    (slot explanation-text (type STRING))
    (slot question-type (type INTEGER) (allowed-values 0 1 2 3))
    (multislot answers (type STRING))
)

;-----------------------------------------------------------------------------
; Facts
;-----------------------------------------------------------------------------
/*
(deffacts knowledge-base
    (subgenre (name house) (subgenre-name disco) (subgenre-min-bpm 98) (subgenre-max-bpm 135) (feel soulful funky warm danceable) (percussion four-on-the-floor live-drummer) (arrangement verse-chorus) (rhythm-meter obvious-tempo four-four heavily-syncopated groovy-feel) (instrumentation band lush) (timbre organic wide highly-produced melodic-harmonic) (vocals male female present studio-recording lightly-effected not-autotuned melodic english harmonies))
    (subgenre (name house) (subgenre-name italo) (subgenre-min-bpm 120) (subgenre-max-bpm 132) (feel happy cheesy danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter obvious-tempo four-four simple-rhythms straight-feel) (instrumentation electronic) (timbre digital thin melodic-harmonic) (vocals present male female studio-recording heavily-effected not-autotuned melodic english harmonies))
	(subgenre (name house) (subgenre-name synthpop) (subgenre-min-bpm 118) (subgenre-max-bpm 166) (feel warm happy danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter obvious-tempo four-four straight-feel) (instrumentation electronic lush) (timbre digital wide highly-produced melodic-harmonic) (vocals present male female studio-recording heavily-effected not-autotuned melodic english harmonies))
    (subgenre (name house) (subgenre-name classic) (subgenre-min-bpm 120) (subgenre-max-bpm 126) (feel soulful warm jazzy danceable) (percussion four-on-the-floor drum-machine) (arrangement repetitive) (rhythm-meter obvious-tempo four-four heavily-syncopated simple-rhythms groovy-feel) (instrumentation electronic sparse) (timbre digital thin weakly-produced melodic-harmonic) (vocals studio-recording dry not-autotuned soulful english))
    (subgenre (name house) (subgenre-name garage) (subgenre-min-bpm 110) (subgenre-max-bpm 124) (feel soulful funky jazzy warm danceable) (percussion four-on-the-floor drum-machine) (rhythm-meter obvious-tempo four-four heavily-syncopated simple-rhythms groovy-feel) (instrumentation electronic sparse) (timbre digital melodic-harmonic) (vocals present studio-recording dry soulful melodic english))
	(subgenre (name house) (subgenre-name acid) (subgenre-min-bpm 118) (subgenre-max-bpm 124) (feel cold dystopian abrasive danceable) (percussion four-on-the-floor drum-machine) (rhythm-meter obvious-tempo four-four unsyncopated simple-rhythms straight-feel) (instrumentation electronic sparse 303-present) (timbre digital thin weakly-produced rhythmic)) 
	(subgenre (name house) (subgenre-name progressive) (subgenre-min-bpm 124) (subgenre-max-bpm 132) (feel warm hypnotic pleasant danceable) (percussion four-on-the-floor drum-machine) (arrangement buildup-breakdown) (rhythm-meter obvious-tempo four-four heavily-syncopated groovy-feel) (instrumentation electronic lush) (timbre digital wide highly-produced melodic-harmonic) (vocals studio-recording heavily-effected autotuned melodic english))
    
(subgenre (name house) (subgenre-name eurodance) (subgenre-min-bpm 132) (subgenre-max-bpm 144) (feel soulful uplifting happy cheesy danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter obvious-tempo four-four unsyncopated simple-rhythms straight-feel) (instrumentation electronic) (timbre digital melodic-harmonic) (vocals present studio-recording female lightly-effected not-autotuned melodic english diva-style))
    (subgenre (name house) (subgenre-name vocal) (subgenre-min-bpm 118) (subgenre-max-bpm 134) (feel soulful funky warm uplifting danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter obvious-tempo four-four heavily-syncopated simple-rhythms groovy-feel) (instrumentation electronic) (timbre digital wide highly-produced melodic-harmonic) (vocals present studio-recording female lightly-effected not-autotuned diva-style soulful melodic english))
    (subgenre (name house) (subgenre-name anthem) (subgenre-min-bpm 120) (subgenre-max-bpm 136) (feel cold danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter obvious-tempo four-four heavily-syncopated simple-rhythms groovy-feel) (instrumentation electronic) (timbre digital wide highly-produced melodic-harmonic) (vocals sampled male))
    (subgenre (name house) (subgenre-name jpop) (subgenre-min-bpm 140) (subgenre-max-bpm 160) (feel happy cheesy danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter obvious-tempo four-four unsyncopated simple-rhythms straight-feel) (instrumentation electronic lush ) (timbre digital wide highly-produced melodic-harmonic) (vocals present studio-recording female heavily-effected melodic non-english))
    (subgenre (name house) (subgenre-name eurobeat) (subgenre-min-bpm 140) (subgenre-max-bpm 160) (feel happy cheesy danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter obvious-tempo four-four unsyncopated simple-rhythms straight-feel) (instrumentation electronic lush) (timbre digital wide highly-produced melodic-harmonic) (vocals present studio-recording female heavily-effected melodic english))
    (subgenre (name house) (subgenre-name deep) (subgenre-min-bpm 120) (subgenre-max-bpm 132) (feel jazzy danceable) (percussion four-on-the-floor drum-machine) (rhythm-meter obvious-tempo four-four heavily-syncopated groovy-feel) (instrumentation electronic) (timbre organic wide highly-produced melodic-harmonic) (vocals sampled studio-recording melodic english))
    (subgenre (name house) (subgenre-name funk) (subgenre-min-bpm 122) (subgenre-max-bpm 132) (feel funky warm uplifting pleasant danceable) (percussion four-on-the-floor drum-machine) (arrangement verse-chorus) (rhythm-meter obvious-tempo four-four heavily-syncopated intricate-rhythms groovy-feel) (instrumentation electronic lush) (timbre organic wide highly-produced melodic-harmonic))
    (subgenre (name house) (subgenre-name micro) (subgenre-min-bpm 120) (subgenre-max-bpm 134) (feel cold dystopian danceable) (percussion four-on-the-floor drum-machine) (arrangement minimalist) (rhythm-meter obvious-tempo four-four) (instrumentation electronic sparse) (timbre organic thin rhythmic) (vocals absent))
)
*/

(deffacts knowledge-base
    
    ;-------------------- disco --------------------
    (subgenre (name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)
    (true 
            obvious-tempo soulful funky warm danceable four-on-the-floor live-drummer verse-chorus syncopated groovy-feel 
          	vocals-present vocals-male vocals-female vocals-studio-recorded band-not-electronic
          	vocals-melodic vocals-english)
    (false 
            jazzy ambient uplifting dystopian hypnotic aggressive angry happy sad abrasive cheesy 
            breakbeat percussion-none sampled-breaks drum-machine buildup-breakdown repetetive minimalist 
            intricate-rhythms rhythmic-timbre groovy-feel turntablism three-oh-three digital thin sparse-instrumentation 
            vocals-sampled vocals-heavily-effected vocals-autotuned vocals-breathy vocals-diva vocals-rap-style vocals-unpitched)
    (unknown))

    ;-------------------- italo --------------------
    (subgenre (name house)(subgenre-name italo)(subgenre-min-bpm 120)(subgenre-max-bpm 132)
    (true 
            obvious-tempo happy cheesy danceable four-on-the-floor drum-machine verse-chorus digital thin
            vocals-present vocals-studio-recorded vocals-male vocals-female vocals-heavily-effected vocals-melodic vocals-english)
    (false 
            soulful funky jazzy warm ambient cold uplifting dystopian hypnotic aggressive angry sad 
            abrasive rhythmic-timbre breakbeat percussion-none sampled-breaks  live-drummer 
           	buildup-breakdown repetetive minimalist syncopated intricate-rhythms groovy-feel 
           	band-not-electronic  sparse-instrumentation turntablism three-oh-three vocals-sampled 
           	vocals-autotuned vocals-breathy vocals-diva vocals-rap-style vocals-unpitched )
    (unknown))
    
    ;-------------------- synthpop --------------------
    (subgenre (name house)(subgenre-name synthpop)(subgenre-min-bpm 118)(subgenre-max-bpm 166)
    (true 
			obvious-tempo warm happy danceable four-on-the-floor drum-machine verse-chorus digital
            vocals-present vocals-studio-recorded vocals-male vocals-female vocals-heavily-effected vocals-melodic vocals-english)
    (false 
			soulful funky jazzy ambient cold uplifting dystopian hypnotic aggressive angry sad 
            abrasive cheesy breakbeat percussion-none sampled-breaks live-drummer 
           	buildup-breakdown repetetive minimalist syncopated intricate-rhythms groovy-feel 
           	turntablism three-oh-three thin vocals-sampled rhythmic-timbre sparse-instrumentation
           	vocals-autotuned vocals-breathy vocals-diva vocals-rap-style vocals-unpitched band-not-electronic)
    (unknown))
    
    ;-------------------- classic --------------------
    (subgenre (name house)(subgenre-name classic)(subgenre-min-bpm 120)(subgenre-max-bpm 126)
    (true 
			obvious-tempo soulful jazzy warm danceable four-on-the-floor drum-machine repetetive syncopated groovy-feel )
    (false 
			funky ambient cold uplifting dystopian hypnotic aggressive angry happy sad abrasive cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	verse-chorus buildup-breakdown minimalist intricate-rhythms 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three digital thin rhythmic-timbre
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected vocals-autotuned vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- garage --------------------
    (subgenre (name house)(subgenre-name garage)(subgenre-min-bpm 110)(subgenre-max-bpm 124)
    (true 
			obvious-tempo soulful funky jazzy warm danceable four-on-the-floor drum-machine syncopated groovy-feel 
            digital  vocals-present vocals-studio-recorded vocals-male vocals-female vocals-melodic vocals-english)
    (false 
			ambient cold uplifting 
           	dystopian hypnotic aggressive angry happy sad abrasive cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	verse-chorus band-not-electronic buildup-breakdown repetetive minimalist 
           	intricate-rhythms sparse-instrumentation turntablism three-oh-three 
           	thin vocals-sampled rhythmic-timbre
           	vocals-heavily-effected vocals-breathy vocals-diva vocals-autotuned
           	vocals-rap-style vocals-unpitched)
    (unknown))
    
        ;-------------------- acid --------------------
    (subgenre (name house)(subgenre-name acid)(subgenre-min-bpm 118)(subgenre-max-bpm 124)
    (true 
			obvious-tempo cold dystopian abrasive danceable four-on-the-floor drum-machine three-oh-three rhythmic-timbre sparse-instrumentation digital thin )
    (false 
			soulful funky jazzy warm ambient uplifting hypnotic aggressive angry happy sad cheesy  
           	breakbeat percussion-none sampled-breaks live-drummer verse-chorus buildup-breakdown repetetive minimalist 
           	syncopated intricate-rhythms groovy-feel band-not-electronic turntablism 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected vocals-autotuned vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
        ;-------------------- progressive --------------------
    (subgenre (name house)(subgenre-name progressive)(subgenre-min-bpm 124)(subgenre-max-bpm 132)
    (true 
			obvious-tempo warm hypnotic danceable four-on-the-floor drum-machine buildup-breakdown syncopated groovy-feel digital )
    (false 
			soulful funky jazzy ambient cold uplifting 
           	dystopian aggressive angry happy sad abrasive cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	verse-chorus repetetive minimalist 
           	intricate-rhythms 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	thin rhythmic-timbre 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected vocals-autotuned vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
)
/*
    
    ;-------------------- disco --------------------
    (subgenre (name house)(subgenre-name italo)(subgenre-min-bpm 120)(subgenre-max-bpm 132)
    (true 
			obvious-tempo )
    (false 
			soulful funky jazzy warm ambient cold uplifting 
           	dystopian hypnotic aggressive angry happy sad abrasive pleasant cheesy danceable 
           	four-on-the-floor breakbeat percussion-none sampled-breaks drum-machine live-drummer 
           	verse-chorus buildup-breakdown repetetive minimalist 
           	syncopated intricate-rhythms groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	digital thin rhythmic-timbre 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected vocals-autotuned vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
*/

(deffacts question-base
    (question-template (reference-attribute soulful)
        (membership-value 5)
        (question-text "Does the song have a soulful feel?")
        (explanation-text "Soulful refers to a feeling that arose from the African-American rhythm and blues style.")
        (question-type 0)
     )
    
    (question-template (reference-attribute vocals-english)
        (membership-value 5)
    	(question-text "Are the vocals present in the song sung in the English language?")
        (explanation-text "The language of the lyrics is an important differentiator of different genres.")
        (question-type 0)    
    )
    
    (question-template (reference-attribute verse-chorus)
        (membership-value 5)
        (question-text "Does the song have a verse chorus type structure?")
        (explanation-text "Songs that follow verse-chorus structure have an A and B section that repeat throughout.")
        (question-type 0)
     )
    
)

;-----------------------------------------------------------------------------
; Questions
;-----------------------------------------------------------------------------
(reset)

;creates question object and binds it for easy reference by ?q
(defclass question Question)
(bind ?q (definstance question (new Question)))
(call Miftiwac prepQuestion ?q.OBJECT)

/*
; (modify ?q (slotname value1 value2 value3 ...))
(call Miftiwac questionReady)
(update ?q.OBJECT)
; continue
*/

;-----------------------------------------------------------------------------
; Queries
;-----------------------------------------------------------------------------
(defquery true-set-from-slot
    (declare (variables ?slot))
    ?subgenre <- (subgenre (true $?a ?slot $?b))
)

(defquery false-set-from-slot
    (declare (variables ?slot))
    ?subgenre <- (subgenre (false $?a ?slot $?b))
)

(defquery get-subgenres
    ?subgenre <- (subgenre)
)

(defquery get-question-from-attr
    (declare (variables ?attr))
	?qt <- (question-template (reference-attribute ?attr))
)

(defquery bpm-inside-search
    (declare (variables ?bpm))
    ?subgenre <- (subgenre {(subgenre-min-bpm > -1 && subgenre-max-bpm > -1) && (subgenre-min-bpm <= ?bpm && subgenre-max-bpm >= ?bpm)}))

(defquery bpm-outside-search
    (declare (variables ?bpm))
    ?subgenre <- (subgenre {(subgenre-min-bpm > -1 && subgenre-max-bpm > -1) && (subgenre-min-bpm > ?bpm || subgenre-max-bpm < ?bpm)}))

(defquery above-threshold
    (declare (variables ?threshold))
    ?subgenre <- (subgenre {subgenre-name != no-ad} {membership-value > ?threshold})
    )

(defquery attribute-question
    (declare (variables ?attribute))
    ?question-template <- (question-template (reference-attribute ?attribute))
	)
;-----------------------------------------------------------------------------
; Functions
;-----------------------------------------------------------------------------
(deffunction int-to-bool (?a) 
    (eq ?a 1)
)

(deffunction update-membership (?slot ?amount)
	(bind ?result (run-query* true-set-from-slot ?slot))
    (while (?result next)
    	(bind ?subg (?result getObject subgenre))
        (modify ?subg (membership-value (+ ?subg.membership-value ?amount)))
    	(printout t ?subg.subgenre-name " had true for slot " ?slot " and we added " ?amount " points." crlf))
    (bind ?result (run-query* false-set-from-slot ?slot))
    (while (?result next)
    	(bind ?subg (?result getObject subgenre))
        (modify ?subg (membership-value (- ?subg.membership-value ?amount)))
    	(printout t ?subg.subgenre-name " had false for slot " ?slot " and we subtracted " ?amount " points." crlf)) 
)

(deffunction update-membership-bpm (?bpm ?amount)
    (bind ?result (run-query* bpm-inside-search ?bpm))
    (while (?result next)
        (bind ?subg (?result getObject subgenre))
        (modify ?subg (membership-value (+ ?subg.membership-value ?amount)))
    	(printout t ?subg.subgenre-name " had bpm " ?bpm " and we added " ?amount " points." crlf))
    (bind ?result (run-query* bpm-outside-search ?bpm))
    (while (?result next)
        (bind ?subg (?result getObject subgenre))
        (modify ?subg (membership-value (- ?subg.membership-value ?amount)))
    	(printout t ?subg.subgenre-name " had bpm " ?bpm " and we subtracted " ?amount " points." crlf))
)

(deffunction ask-question (?attr)
	(bind ?result (run-query* get-question-from-attr ?attr))
    (while (?result next)
	    (bind ?nqt (?result getObject qt))
	    (modify ?q (questionText ?nqt.question-text))
	    (modify ?q (explanation ?nqt.explanation-text))
	    (modify ?q (type ?nqt.question-type))
	    (modify ?q (answerTexts ?nqt.answers))
	    (call Miftiwac questionReady)
	    (update ?q.OBJECT)
	    (if (int-to-bool ?q.answer) then
	        (modify ?wm (true (union$ ?wm.true (create$ ?attr))))
	        (modify ?wm (unknown (complement$ (create$ ?attr) ?wm.unknown)))
	        (update-membership ?attr ?nqt.membership-value)
	     else
	        (modify ?wm (false (union$ ?wm.false (create$ ?attr))))
	        (modify ?wm (unknown (complement$ (create$ ?attr) ?wm.unknown )))
            (update-membership ?attr (div ?nqt.membership-value -2))
	     )
     )
)

(deffunction explanation-system (?sg ?wm)
	(bind $?attr-to-exp (intersection$ ?sg.true ?wm.true))
    (bind ?explanation-string "")
    ;hard-code explanations here
    (foreach ?attr $?attr-to-exp
        (bind ?attr-mem-value 0)
        (bind ?result (run-query* attribute-question ?attr))
        (while (?result next)
            (bind ?qt (?result getObject question-template))
            (bind ?attr-mem-value ?qt.membership-value)
            )
        (printout t "Mem val: " ?attr-mem-value crlf)
        (printout t "Sg mem val: " ?sg.membership-value crlf)
        (bind ?explanation-string (str-cat ?explanation-string "You indicated that the music has the characteristic " ?attr " which contributed " (/ ?attr-mem-value ?sg.membership-value) "%.
")))
    (return ?explanation-string)
)

;-----------------------------------------------------------------------------
; Rules
;-----------------------------------------------------------------------------
(defrule startup
    "Takes care of necessary initializations."
    (declare (salience 1000))
    =>
	(assert (working-memory))
    )

(defrule next-question
    (declare (salience 70))
    ?wm <- (working-memory (unknown $?list))
    =>
    (bind $?counts (create$))
    (foreach ?attr $?list 
		(bind ?result (run-query* get-subgenres))
        (bind ?count 0)
    	(while (?result next)
        	(bind ?sg (?result getObject subgenre))
        	(if (subsetp (create$ ?attr) ?sg.true) then
        	    (++ ?count)
       	 	else (if (subsetp (create$ ?attr) ?sg.false) then
       	    	(-- ?count)))
        	)
		(bind $?counts (create$ $?counts (abs ?count)))
	)
    
    ;(printout t $?list crlf)
    ;(printout t $?counts crlf)
    
    (bind ?min 1000)
    (bind ?min_index 0)
    (bind ?pos 1)
    (foreach ?count $?counts
		(if (< ?count ?min) then
           	(bind ?min_index ?pos)
           	(bind ?min ?count)
        )
        (++ ?pos)
    )
    ;(printout t ?min_index crlf)
    
    (bind ?refAttr (nth$ ?min_index $?list))
    ;(printout t (nth$ ?min_index $?list) crlf)
    (ask-question ?refAttr)
    
    ; Ghetto hack toggle. :(
    (if (eq ?wm.toggle true) then (modify ?wm (toggle false))
        else (modify ?wm (toggle true))
    )
)

(defrule membership-threshold
    (declare (salience 100))
    ?wm <- (working-memory (threshold ?thresh))
    ?sg <- (subgenre (subgenre-name ?sgname){membership-value > ?thresh})
    (test (not (eq ?sgname no-ad)))
    =>
    (bind ?resnum (count-query-results above-threshold ?thresh))
    (printout t "Resnum: " ?resnum crlf)
    (if (> ?resnum 1) then
        (modify ?wm (threshold (+ ?wm.threshold 5)))
        (printout t "New threshold: " ?wm.threshold crlf)
    else
        (printout t "Finished! You're listening to subgenre " ?sg.subgenre-name " with membership value " ?sg.membership-value crlf)
        (facts)
        (modify ?q (type 3))
        (modify ?q (answerTexts ?sg.name ?sg.subgenre-name (explanation-system ?sg ?wm)))
        (printout t ?q.answerTexts crlf)
        (call Miftiwac questionReady)
        (halt)
	)
)

(defrule penalty-membership-threshold
    (declare (salience 98))
    ?sg <- (subgenre (subgenre-name ?sgname)(membership-value ?membership))
    (test (< ?membership -50))
    (test (not(eq ?sgname no-ad)))
    =>
    (printout t "Eliminated subgenre " ?sgname " with membership value " ?membership crlf)
    (retract ?sg)
)

;----------------- Hard-coded Questions -----------------

(defrule obvious-tempo-question
    (declare (salience 90))
    ?wm <- (working-memory (true $?t) (false $?f)(unknown $?ua obvious-tempo $?ub))
    =>
    (modify ?q (type 0))
    (modify ?q (questionText "Is there an obvious tempo?"))
    (modify ?q (explanation "If you can tap your hand to the beat, then there is an obvious tempo."))
    (call Miftiwac questionReady)
    (update ?q.OBJECT)
	(if (int-to-bool ?q.answer) then
        (modify ?wm (true $?t obvious-tempo))
        (modify ?wm (unknown $?ua $?ub))
        (update-membership obvious-tempo 15)
     else
        (modify ?wm (false $?f obvious-tempo))
        (modify ?wm (unknown $?ua $?ub))
        (update-membership obvious-tempo (/ -15 2))
     )
)

(defrule get-bpm-question
    (declare (salience 88))
    ?wm <- (working-memory (true $? obvious-tempo $?) (bpm ?bpm))
    (test (eq ?bpm 0))
	=>
    (modify ?q (type 1))
    (modify ?q (questionText "What is the BPM (Beats Per Minute)?"))
    (modify ?q (explanation "This is essentially how many times you would tap your hand to the beat per minute."))
    (call Miftiwac questionReady)
    (update ?q.OBJECT)
    (modify ?wm (bpm ?q.answer))
    (update-membership-bpm ?wm.bpm 20)
)
/*
(defrule break-vs-four-on-the-floor
    (declare (salience 86))
    ?wm <- (working-memory (bpm ?bpm))
    (test (not (eq ?bpm 0)))
    
    )
*/
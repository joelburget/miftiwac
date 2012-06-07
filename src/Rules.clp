;-----------------------------------------------------------------------------
; Global Variables
;-----------------------------------------------------------------------------
; Set TRUE to execute with GUI, set FALSE to execute with text-based UI
(defglobal ?*gui* = TRUE)
(defglobal ?*nqt* = TRUE)
;-----------------------------------------------------------------------------
; Templates
;-----------------------------------------------------------------------------
(deftemplate qa-toggle
    (slot mode (allowed-values question answer) (default question))
    (slot attr)
    (slot nqt)
    )

(deftemplate attributes
	(multislot true (allowed-values 	soulful funky jazzy warm ambient cold uplifting 
	            						dystopian hypnotic aggressive  happy sad abrasive cheesy danceable 
	            						four-on-the-floor breakbeat percussion-none sampled-breaks drum-machine live-drummer 
	            						verse-chorus buildup-breakdown repetitive minimalist 
	            						obvious-tempo syncopated intricate-rhythms groovy-feel 
	            						band-not-electronic sparse-instrumentation turntablism three-oh-three 
	            						digital thin rhythmic-timbre 
	            						vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
	            						vocals-heavily-effected  vocals-breathy vocals-diva 
	            						vocals-rap-style vocals-melodic vocals-unpitched vocals-english))
	
	(multislot false (allowed-values 	soulful funky jazzy warm ambient cold uplifting 
	            						dystopian hypnotic aggressive  happy sad abrasive cheesy danceable 
	            						four-on-the-floor breakbeat percussion-none sampled-breaks drum-machine live-drummer 
	            						verse-chorus buildup-breakdown repetitive minimalist 
	            						obvious-tempo syncopated intricate-rhythms groovy-feel 
	            						band-not-electronic sparse-instrumentation turntablism three-oh-three 
	            						digital thin rhythmic-timbre 
	            						vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
	            						vocals-heavily-effected  vocals-breathy vocals-diva 
	            						vocals-rap-style vocals-melodic vocals-unpitched vocals-english))
	
	(multislot unknown (allowed-values 	soulful funky jazzy warm ambient cold uplifting 
	            						dystopian hypnotic aggressive  happy sad abrasive cheesy danceable 
	            						four-on-the-floor breakbeat percussion-none sampled-breaks drum-machine live-drummer 
	            						verse-chorus buildup-breakdown repetitive minimalist 
	            						obvious-tempo syncopated intricate-rhythms groovy-feel 
	            						band-not-electronic sparse-instrumentation turntablism three-oh-three 
	            						digital thin rhythmic-timbre 
	            						vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
	            						vocals-heavily-effected  vocals-breathy vocals-diva 
	            						vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
	        
	        		   (default 		soulful funky jazzy warm ambient cold uplifting 
	            						dystopian hypnotic aggressive  happy sad abrasive cheesy danceable 
	            						four-on-the-floor breakbeat percussion-none sampled-breaks drum-machine live-drummer 
	            						verse-chorus buildup-breakdown repetitive minimalist 
	            						obvious-tempo syncopated intricate-rhythms groovy-feel 
	            						band-not-electronic sparse-instrumentation turntablism three-oh-three 
	            						digital thin rhythmic-timbre 
	            						vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
	            						vocals-heavily-effected  vocals-breathy vocals-diva 
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
    (slot bpm-points (type INTEGER) (default 15))
    (slot threshold (type INTEGER) (default 50))
    (slot neg-threshold (type INTEGER) (default 25))
)

(deftemplate question-template
    (slot reference-attribute    (allowed-values soulful funky jazzy warm ambient cold uplifting 
            						dystopian hypnotic aggressive  happy sad abrasive cheesy danceable 
            						four-on-the-floor breakbeat percussion-none sampled-breaks drum-machine live-drummer 
            						verse-chorus buildup-breakdown repetitive minimalist 
            						obvious-tempo syncopated intricate-rhythms groovy-feel 
            						band-not-electronic sparse-instrumentation turntablism three-oh-three 
            						digital thin rhythmic-timbre 
            						vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
            						vocals-heavily-effected  vocals-breathy vocals-diva 
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
(deffacts toggler
    (qa-toggle (mode question)))

(deffacts knowledge-base
    
    ;-------------------- disco --------------------
    (subgenre (name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)
    (true 
            obvious-tempo soulful funky warm danceable four-on-the-floor live-drummer verse-chorus syncopated groovy-feel 
          	vocals-present vocals-male vocals-female vocals-studio-recorded band-not-electronic
          	vocals-melodic vocals-english)
    (false 
            cold jazzy ambient uplifting dystopian hypnotic aggressive  happy sad abrasive cheesy 
            breakbeat percussion-none sampled-breaks drum-machine buildup-breakdown repetitive minimalist 
            intricate-rhythms rhythmic-timbre turntablism three-oh-three digital thin sparse-instrumentation 
            vocals-sampled vocals-heavily-effected  vocals-breathy vocals-diva vocals-rap-style vocals-unpitched)
    (unknown))

    ;-------------------- italo --------------------
    (subgenre (name house)(subgenre-name italo)(subgenre-min-bpm 110)(subgenre-max-bpm 132)
    (true 
            obvious-tempo happy cheesy danceable four-on-the-floor drum-machine verse-chorus digital thin
            vocals-present vocals-studio-recorded vocals-male vocals-female vocals-heavily-effected vocals-melodic vocals-english)
    (false 
            soulful funky jazzy warm ambient cold uplifting dystopian hypnotic aggressive  sad 
            abrasive rhythmic-timbre breakbeat percussion-none sampled-breaks  live-drummer 
           	buildup-breakdown repetitive minimalist syncopated intricate-rhythms groovy-feel 
           	band-not-electronic  sparse-instrumentation turntablism three-oh-three vocals-sampled 
           	 vocals-breathy vocals-diva vocals-rap-style vocals-unpitched )
    (unknown))
    
    ;-------------------- synthpop --------------------
    (subgenre (name house)(subgenre-name synthpop)(subgenre-min-bpm 118)(subgenre-max-bpm 166)
    (true 
			obvious-tempo warm happy danceable four-on-the-floor drum-machine verse-chorus digital
            vocals-present vocals-studio-recorded vocals-male vocals-female vocals-heavily-effected vocals-melodic vocals-english)
    (false 
			soulful funky jazzy ambient cold uplifting dystopian hypnotic aggressive  sad 
            abrasive cheesy breakbeat percussion-none sampled-breaks live-drummer 
           	buildup-breakdown repetitive minimalist syncopated intricate-rhythms groovy-feel 
           	turntablism three-oh-three thin vocals-sampled rhythmic-timbre sparse-instrumentation
           	 vocals-breathy vocals-diva vocals-rap-style vocals-unpitched band-not-electronic)
    (unknown))
    
    ;-------------------- chicago --------------------
    (subgenre (name house)(subgenre-name chicago)(subgenre-min-bpm 120)(subgenre-max-bpm 126)
    (true 
			obvious-tempo soulful jazzy warm danceable four-on-the-floor drum-machine repetitive syncopated groovy-feel )
    (false 
			funky ambient cold uplifting dystopian hypnotic aggressive  happy sad abrasive cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	verse-chorus buildup-breakdown minimalist intricate-rhythms 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three digital thin rhythmic-timbre
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- new-york --------------------
    (subgenre (name house)(subgenre-name new-york)(subgenre-min-bpm 110)(subgenre-max-bpm 124)
    (true 
			obvious-tempo soulful funky jazzy warm danceable four-on-the-floor drum-machine syncopated groovy-feel 
            digital  vocals-present vocals-studio-recorded vocals-male vocals-female vocals-melodic vocals-english)
    (false 
			ambient cold uplifting 
           	dystopian hypnotic aggressive  happy sad abrasive cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	verse-chorus band-not-electronic buildup-breakdown repetitive minimalist 
           	intricate-rhythms sparse-instrumentation turntablism three-oh-three 
           	thin vocals-sampled rhythmic-timbre
           	vocals-heavily-effected vocals-breathy vocals-diva 
           	vocals-rap-style vocals-unpitched)
    (unknown))
    
    ;-------------------- acid --------------------
    (subgenre (name house)(subgenre-name acid)(subgenre-min-bpm 118)(subgenre-max-bpm 124)
    (true 
			obvious-tempo cold dystopian abrasive danceable four-on-the-floor drum-machine three-oh-three rhythmic-timbre sparse-instrumentation digital thin )
    (false 
			soulful funky jazzy warm ambient uplifting hypnotic aggressive  happy sad cheesy  
           	breakbeat percussion-none sampled-breaks live-drummer verse-chorus buildup-breakdown repetitive minimalist 
           	syncopated intricate-rhythms groovy-feel band-not-electronic turntablism 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- progressive --------------------
    (subgenre (name house)(subgenre-name progressive)(subgenre-min-bpm 124)(subgenre-max-bpm 132)
    (true 
			obvious-tempo warm hypnotic danceable four-on-the-floor drum-machine buildup-breakdown syncopated groovy-feel digital )
    (false 
			soulful funky jazzy ambient cold uplifting 
           	dystopian aggressive  happy sad abrasive cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	verse-chorus repetitive minimalist 
           	intricate-rhythms 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	thin rhythmic-timbre 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- eurodance --------------------
    (subgenre (name house)(subgenre-name eurodance)(subgenre-min-bpm 132)(subgenre-max-bpm 144)
    (true 
			obvious-tempo uplifting happy cheesy danceable four-on-the-floor drum-machine 
            verse-chorus digital vocals-present vocals-studio-recorded vocals-female vocals-diva vocals-melodic vocals-english)
    (false 
			soulful funky jazzy warm ambient cold 
           	dystopian hypnotic aggressive  sad abrasive
           	breakbeat percussion-none sampled-breaks live-drummer 
           	buildup-breakdown repetitive minimalist 
           	syncopated intricate-rhythms groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	thin rhythmic-timbre 
           	vocals-sampled vocals-male 
           	vocals-heavily-effected  vocals-breathy 
           	vocals-rap-style vocals-unpitched)
    (unknown))

    ;-------------------- vocal --------------------
    (subgenre (name house)(subgenre-name vocal)(subgenre-min-bpm 118)(subgenre-max-bpm 134)
    (true 
			obvious-tempo soulful funky warm uplifting danceable four-on-the-floor drum-machine verse-chorus 
            syncopated groovy-feel digital vocals-present vocals-studio-recorded vocals-female vocals-diva vocals-melodic vocals-english)
    (false 
			jazzy ambient cold  
           	dystopian hypnotic aggressive  happy sad abrasive cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	buildup-breakdown repetitive minimalist 
           	intricate-rhythms 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	thin rhythmic-timbre 
           	 vocals-sampled vocals-male 
           	vocals-heavily-effected  vocals-breathy 
           	vocals-rap-style vocals-unpitched )
    (unknown))

    ;-------------------- anthem --------------------
    (subgenre (name house)(subgenre-name anthem)(subgenre-min-bpm 120)(subgenre-max-bpm 136)
    (true 
			obvious-tempo cold danceable four-on-the-floor drum-machine verse-chorus 
            syncopated groovy-feel digital vocals-sampled vocals-present vocals-male)
    (false 
			soulful funky jazzy warm ambient uplifting 
           	dystopian hypnotic aggressive  happy sad abrasive cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	 buildup-breakdown repetitive minimalist 
           	intricate-rhythms 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	thin rhythmic-timbre 
           	vocals-studio-recorded vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- jpop --------------------
    (subgenre (name house)(subgenre-name jpop)(subgenre-min-bpm 140)(subgenre-max-bpm 160)
    (true 
			obvious-tempo happy cheesy danceable four-on-the-floor drum-machine verse-chorus digital 
            vocals-present vocals-studio-recorded vocals-female vocals-heavily-effected vocals-melodic )
    (false 
			soulful funky jazzy warm ambient cold uplifting 
           	dystopian hypnotic aggressive  sad abrasive 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	buildup-breakdown repetitive minimalist 
           	syncopated intricate-rhythms groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	thin rhythmic-timbre 
           	vocals-sampled vocals-male 
           	 vocals-breathy vocals-diva 
           	vocals-rap-style vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- eurobeat --------------------
    (subgenre (name house)(subgenre-name eurobeat)(subgenre-min-bpm 140)(subgenre-max-bpm 160)
    (true 
			obvious-tempo happy cheesy danceable four-on-the-floor drum-machine verse-chorus
            digital vocals-present vocals-studio-recorded vocals-female vocals-melodic vocals-heavily-effected vocals-english)
    (false 
			soulful funky jazzy warm ambient cold uplifting 
           	dystopian hypnotic aggressive  sad abrasive 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	buildup-breakdown repetitive minimalist 
           	syncopated intricate-rhythms groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	thin rhythmic-timbre 
           	vocals-sampled vocals-male 
           	 vocals-breathy vocals-diva 
           	vocals-rap-style vocals-unpitched )
    (unknown))
    
    ;-------------------- deep --------------------
    (subgenre (name house)(subgenre-name deep)(subgenre-min-bpm 120)(subgenre-max-bpm 132)
    (true 
			obvious-tempo jazzy danceable four-on-the-floor drum-machine syncopated groovy-feel )
    (false 
			soulful funky warm ambient cold uplifting 
           	dystopian hypnotic aggressive  happy sad abrasive cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	verse-chorus buildup-breakdown repetitive minimalist 
           	intricate-rhythms 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	digital thin rhythmic-timbre 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))

    ;-------------------- funk --------------------
    (subgenre (name house)(subgenre-name funk)(subgenre-min-bpm 122)(subgenre-max-bpm 132)
    (true 
			obvious-tempo funky warm uplifting danceable four-on-the-floor 
            drum-machine verse-chorus syncopated intricate-rhythms groovy-feel )
    (false 
			soulful jazzy ambient cold 
           	dystopian hypnotic aggressive  happy sad abrasive cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	buildup-breakdown repetitive minimalist
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	digital thin rhythmic-timbre 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- micro --------------------
    (subgenre (name house)(subgenre-name micro)(subgenre-min-bpm 120)(subgenre-max-bpm 134)
    (true 
			obvious-tempo cold dystopian danceable four-on-the-floor 
            drum-machine minimalist sparse-instrumentation thin rhythmic-timbre )
    (false 
			soulful funky jazzy warm ambient uplifting 
           	hypnotic aggressive  happy sad abrasive cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	verse-chorus buildup-breakdown repetitive 
           	syncopated intricate-rhythms groovy-feel 
           	band-not-electronic turntablism three-oh-three digital 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))


    ;-------------------- acid --------------------
    (subgenre (name trance)(subgenre-name acid-trance)(subgenre-min-bpm 124)(subgenre-max-bpm 150)
    (true 
			obvious-tempo cold dystopian hypnotic digital rhythmic-timbre three-oh-three repetitive thin intricate-rhythms )
    (false 
			soulful funky jazzy warm ambient uplifting 
           	aggressive  happy sad abrasive cheesy danceable 
           	four-on-the-floor breakbeat percussion-none sampled-breaks drum-machine live-drummer 
           	verse-chorus buildup-breakdown minimalist 
           	syncopated groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- dream --------------------
    (subgenre (name trance)(subgenre-name dream)(subgenre-min-bpm 134)(subgenre-max-bpm 150)
    (true 
			obvious-tempo cheesy uplifting danceable four-on-the-floor drum-machine digital buildup-breakdown )
    (false 
			soulful funky jazzy warm ambient cold 
           	dystopian hypnotic aggressive  happy sad abrasive 
           	breakbeat percussion-none sampled-breaks  live-drummer 
           	verse-chorus repetitive minimalist 
           	syncopated intricate-rhythms groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	thin rhythmic-timbre 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- anthem --------------------
    (subgenre (name trance)(subgenre-name anthem)(subgenre-min-bpm 136)(subgenre-max-bpm 144)
    (true 
			obvious-tempo uplifting danceable four-on-the-floor drum-machine digital buildup-breakdown )
    (false 
			soulful funky jazzy warm ambient cold 
           	dystopian hypnotic aggressive  happy sad abrasive cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	verse-chorus repetitive minimalist 
           	syncopated intricate-rhythms groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	thin rhythmic-timbre 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- futurepop --------------------
    (subgenre (name trance)(subgenre-name futurepop)(subgenre-min-bpm 110)(subgenre-max-bpm 144)
    (true 
			obvious-tempo cold dystopian sad danceable four-on-the-floor drum-machine digital verse-chorus vocals-present 
            vocals-studio-recorded vocals-male vocals-melodic vocals-heavily-effected vocals-english)
    (false 
			soulful funky jazzy warm ambient uplifting 
           	hypnotic aggressive  happy abrasive cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	buildup-breakdown repetitive minimalist 
           	syncopated intricate-rhythms groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	thin rhythmic-timbre 
           	vocals-sampled vocals-female 
           	 vocals-breathy vocals-diva 
           	vocals-rap-style vocals-unpitched )
    (unknown))

    ;-------------------- epic --------------------
    (subgenre (name trance)(subgenre-name epic)(subgenre-min-bpm 136)(subgenre-max-bpm 144)
    (true 
			obvious-tempo cold uplifting danceable four-on-the-floor drum-machine digital vocals-present 
            buildup-breakdown vocals-studio-recorded vocals-female vocals-heavily-effected vocals-melodic vocals-english)
    (false 
			soulful funky jazzy warm ambient 
           	dystopian hypnotic aggressive  happy sad abrasive cheesy 
            breakbeat percussion-none sampled-breaks live-drummer 
           	verse-chorus  repetitive minimalist 
           	syncopated intricate-rhythms groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	thin rhythmic-timbre 
           	vocals-sampled vocals-male 
           	 vocals-breathy vocals-diva 
           	vocals-rap-style vocals-unpitched)
    (unknown))
    
    ;-------------------- psychedelic --------------------
    (subgenre (name trance)(subgenre-name psychedelic)(subgenre-min-bpm 142)(subgenre-max-bpm 150)
    (true 
			obvious-tempo cold dystopian hypnotic danceable four-on-the-floor drum-machine digital rhythmic-timbre intricate-rhythms minimalist )
    (false 
			soulful funky jazzy warm ambient uplifting 
           	aggressive  happy sad abrasive cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	verse-chorus buildup-breakdown repetitive syncopated groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three thin 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- ragga --------------------
    (subgenre (name jungle)(subgenre-name ragga)(subgenre-min-bpm 160)(subgenre-max-bpm 180)
    (true 
			obvious-tempo aggressive breakbeat danceable sampled-breaks syncopated intricate-rhythms groovy-feel verse-chorus vocals-present vocals-studio-recorded vocals-male vocals-heavily-effected vocals-english vocals-melodic vocals-unpitched)
    (false 
			soulful funky jazzy warm ambient cold uplifting 
           	dystopian hypnotic  happy sad abrasive cheesy 
           	four-on-the-floor percussion-none drum-machine live-drummer 
           	buildup-breakdown repetitive minimalist 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	digital thin rhythmic-timbre 
           	vocals-sampled vocals-female 
           	 vocals-breathy vocals-diva 
           	vocals-rap-style)
    (unknown))
    
    ;-------------------- drum n' bass --------------------
    (subgenre (name jungle)(subgenre-name drum-n-bass)(subgenre-min-bpm 168)(subgenre-max-bpm 180)
    (true 
			obvious-tempo cold dystopian aggressive abrasive danceable breakbeat drum-machine syncopated intricate-rhythms groovy-feel sparse-instrumentation repetitive rhythmic-timbre )
    (false 
			soulful funky jazzy warm ambient uplifting 
           	hypnotic  happy sad cheesy sampled-breaks 
           	four-on-the-floor percussion-none live-drummer 
           	verse-chorus buildup-breakdown minimalist 
           	band-not-electronic turntablism three-oh-three digital thin 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
        ;-------------------- jazzstep --------------------
    (subgenre (name jungle)(subgenre-name jazzstep)(subgenre-min-bpm 160)(subgenre-max-bpm 172)
    (true 
			obvious-tempo soulful jazzy warm danceable breakbeat sampled-breaks syncopated intricate-rhythms groovy-feel repetitive )
        ;vocals - sometimes present sometimes not
    (false 
			funky ambient cold uplifting 
           	dystopian hypnotic aggressive  happy sad abrasive cheesy 
           	four-on-the-floor percussion-none drum-machine live-drummer 
           	verse-chorus buildup-breakdown minimalist 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three digital thin rhythmic-timbre)
    (unknown
            vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english))
    
    
    ;-------------------- darkstep --------------------
    (subgenre (name jungle)(subgenre-name darkstep)(subgenre-min-bpm 168)(subgenre-max-bpm 180)
    (true 
			obvious-tempo cold dystopian aggressive abrasive danceable breakbeat minimalist sampled-breaks syncopated intricate-rhythms groovy-feel rhythmic-timbre sparse-instrumentation )
    (false 
			soulful funky jazzy warm ambient uplifting 
           	hypnotic happy sad cheesy 
           	four-on-the-floor percussion-none drum-machine live-drummer 
           	verse-chorus buildup-breakdown repetitive 
           	band-not-electronic turntablism three-oh-three digital thin  
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- dubstep --------------------
    (subgenre (name breakbeat)(subgenre-name dubstep)(subgenre-min-bpm 136)(subgenre-max-bpm 144)
    (true 
			obvious-tempo dystopian aggressive abrasive danceable breakbeat verse-chorus syncopated groovy-feel digital )
    (false 
			soulful funky jazzy warm ambient cold uplifting 
           	hypnotic  happy sad cheesy 
           	four-on-the-floor percussion-none sampled-breaks drum-machine live-drummer 
           	buildup-breakdown repetitive minimalist intricate-rhythms 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	thin rhythmic-timbre 
           	)
    (unknown vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english))

    ;-------------------- hip-hop --------------------
    (subgenre (name breakbeat)(subgenre-name hip-hop)(subgenre-min-bpm 84)(subgenre-max-bpm 119)
    (true 
			obvious-tempo breakbeat verse-chorus syncopated vocals-present vocals-studio-recorded danceable 
            vocals-male vocals-rap-style vocals-unpitched vocals-english rhythmic-timbre sampled-breaks drum-machine )
    (false 
			soulful funky jazzy warm ambient cold uplifting 
           	dystopian hypnotic aggressive happy sad abrasive cheesy 
           	four-on-the-floor percussion-none live-drummer 
           	buildup-breakdown repetitive minimalist intricate-rhythms groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	digital thin vocals-sampled vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva vocals-melodic )
    (unknown))

    ;-------------------- dirty-south/miami-bass --------------------
    (subgenre (name breakbeat)(subgenre-name dirty-south/miami-bass)(subgenre-min-bpm 120)(subgenre-max-bpm 160)
    (true 
			obvious-tempo breakbeat verse-chorus danceable drum-machine syncopated rhythmic-timbre 
            sparse-instrumentation vocals-present vocals-studio-recorded vocals-male vocals-rap-style vocals-unpitched vocals-english)
    (false 
			soulful funky jazzy warm ambient cold uplifting 
           	dystopian hypnotic aggressive happy sad abrasive cheesy 
           	four-on-the-floor percussion-none sampled-breaks live-drummer 
           	buildup-breakdown repetitive minimalist intricate-rhythms groovy-feel 
           	band-not-electronic turntablism three-oh-three digital thin vocals-sampled vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva vocals-melodic )
    (unknown))
    
    ;-------------------- turntablism --------------------
    (subgenre (name breakbeat)(subgenre-name turntablism)(subgenre-min-bpm 78)(subgenre-max-bpm 114)
    (true 
			obvious-tempo breakbeat sampled-breaks turntablism syncopated groovy-feel repetitive rhythmic-timbre)
    (false 
			soulful funky jazzy warm ambient cold uplifting 
           	dystopian hypnotic aggressive  happy sad abrasive cheesy danceable 
           	four-on-the-floor percussion-none  drum-machine live-drummer 
           	verse-chorus buildup-breakdown minimalist intricate-rhythms 
           	band-not-electronic sparse-instrumentation three-oh-three digital thin 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))

    ;-------------------- big beat --------------------
    (subgenre (name breakbeat)(subgenre-name big-beat)(subgenre-min-bpm 120)(subgenre-max-bpm 140)
    (true 
			obvious-tempo warm danceable breakbeat sampled-breaks verse-chorus syncopated aggressive 
            intricate-rhythms groovy-feel vocals-present vocals-sampled vocals-english vocals-unpitched)
    (false 
			soulful funky jazzy ambient cold uplifting 
           	dystopian hypnotic happy sad abrasive cheesy  
           	four-on-the-floor percussion-none drum-machine live-drummer 
           	buildup-breakdown repetitive minimalist 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	digital thin rhythmic-timbre vocals-studio-recorded 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic )
    (unknown vocals-male vocals-female))
    
    ;-------------------- garage --------------------
    (subgenre (name breakbeat)(subgenre-name garage)(subgenre-min-bpm 128)(subgenre-max-bpm 140)
    (true 
			obvious-tempo soulful danceable breakbeat drum-machine syncopated intricate-rhythms vocals-english
            groovy-feel vocals-present vocals-studio-recorded vocals-male vocals-female vocals-diva vocals-rap-style verse-chorus  )
    (false 
			funky jazzy warm ambient cold uplifting 
           	dystopian hypnotic aggressive happy sad abrasive cheesy 
           	four-on-the-floor percussion-none sampled-breaks live-drummer 
           	buildup-breakdown repetitive minimalist 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	digital thin rhythmic-timbre vocals-sampled 
           	vocals-heavily-effected  vocals-breathy 
           	vocals-melodic vocals-unpitched )
    (unknown))
    
    ;-------------------- electro --------------------
    (subgenre (name breakbeat)(subgenre-name electro)(subgenre-min-bpm 98)(subgenre-max-bpm 138)
    (true 
			obvious-tempo cheesy danceable cold breakbeat drum-machine verse-chorus digital vocals-present 
            vocals-studio-recorded vocals-heavily-effected vocals-male vocals-english vocals-melodic )
    (false 
			soulful funky jazzy warm ambient uplifting 
           	dystopian hypnotic aggressive  happy sad abrasive 
           	four-on-the-floor percussion-none sampled-breaks live-drummer 
           	buildup-breakdown repetitive minimalist 
           	syncopated intricate-rhythms groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	thin rhythmic-timbre 
           	vocals-sampled vocals-female 
           	 vocals-breathy vocals-diva 
           	vocals-rap-style vocals-unpitched )
    (unknown))
    
    ;-------------------- electro funk --------------------
    (subgenre (name breakbeat)(subgenre-name electro-funk)(subgenre-min-bpm 100)(subgenre-max-bpm 126)
    (true 
			obvious-tempo funky soulful danceable breakbeat drum-machine verse-chorus syncopated groovy-feel 
            vocals-present vocals-studio-recorded vocals-heavily-effected vocals-male vocals-female vocals-melodic vocals-english)
    (false 
			jazzy warm ambient cold uplifting 
           	dystopian hypnotic aggressive happy sad abrasive cheesy  
           	four-on-the-floor percussion-none sampled-breaks live-drummer 
           	buildup-breakdown repetitive minimalist intricate-rhythms 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	digital thin rhythmic-timbre vocals-sampled 
           	 vocals-breathy vocals-diva 
           	vocals-rap-style vocals-unpitched )
    (unknown))
    
    ;-------------------- R&B --------------------
    (subgenre (name breakbeat)(subgenre-name r-and-b)(subgenre-min-bpm 80)(subgenre-max-bpm 104)
    (true 
			obvious-tempo soulful warm danceable breakbeat drum-machine verse-chorus syncopated groovy-feel 
            vocals-present vocals-studio-recorded vocals-female vocals-diva vocals-melodic vocals-english)
    (false 
			funky jazzy ambient cold uplifting 
           	dystopian hypnotic aggressive happy sad abrasive cheesy 
           	four-on-the-floor percussion-none sampled-breaks live-drummer 
           	buildup-breakdown repetitive minimalist 
           	intricate-rhythms 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	digital thin rhythmic-timbre 
           	vocals-sampled vocals-male 
           	vocals-heavily-effected  vocals-breathy 
           	vocals-rap-style vocals-unpitched )
    (unknown))
    
    ;-------------------- detroit --------------------
    (subgenre (name techno)(subgenre-name detroit)(subgenre-min-bpm 122)(subgenre-max-bpm 142)
    (true 
			obvious-tempo cold danceable dystopian four-on-the-floor drum-machine digital repetitive )
    (false 
			soulful funky jazzy warm ambient uplifting 
           	hypnotic aggressive happy sad abrasive cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	verse-chorus buildup-breakdown minimalist 
           	syncopated intricate-rhythms groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three thin rhythmic-timbre 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- acid techno --------------------
    (subgenre (name techno)(subgenre-name acid-techno)(subgenre-min-bpm 130)(subgenre-max-bpm 156)
    (true 
			obvious-tempo cold dystopian abrasive aggressive danceable four-on-the-floor 
            repetitive drum-machine three-oh-three digital rhythmic-timbre intricate-rhythms)
    (false 
			soulful funky jazzy warm ambient uplifting 
           	hypnotic happy sad cheesy  
           	breakbeat percussion-none sampled-breaks live-drummer 
           	verse-chorus buildup-breakdown minimalist 
           	syncopated groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism thin 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- gabba --------------------
    (subgenre (name hardcore)(subgenre-name gabba)(subgenre-min-bpm 186)(subgenre-max-bpm 224)
    (true 
			obvious-tempo cold dystopian aggressive abrasive danceable four-on-the-floor 
            drum-machine repetitive sparse-instrumentation rhythmic-timbre digital)
    (false 
			soulful funky jazzy warm ambient uplifting 
           	hypnotic happy sad cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	verse-chorus buildup-breakdown minimalist 
           	syncopated intricate-rhythms groovy-feel 
           	band-not-electronic turntablism three-oh-three thin 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- speedcore --------------------
    (subgenre (name hardcore)(subgenre-name speedcore)(subgenre-min-bpm 225)(subgenre-max-bpm 10000)
    (true 
			obvious-tempo cold dystopian aggressive abrasive four-on-the-floor 
            drum-machine repetitive sparse-instrumentation rhythmic-timbre digital)
    (false 
			soulful funky jazzy warm ambient uplifting danceable 
           	hypnotic happy sad cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	verse-chorus buildup-breakdown minimalist 
           	syncopated intricate-rhythms groovy-feel 
           	band-not-electronic turntablism three-oh-three thin 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- rave --------------------
    (subgenre (name hardcore)(subgenre-name rave)(subgenre-min-bpm 124)(subgenre-max-bpm 134)
    (true 
			obvious-tempo cold dystopian aggressive repetitive abrasive danceable four-on-the-floor drum-machine syncopated rhythmic-timbre digital )
    (false 
			soulful funky jazzy warm ambient uplifting 
           	hypnotic happy sad cheesy 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	verse-chorus buildup-breakdown minimalist intricate-rhythms groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three thin 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- happy hardcore --------------------
    (subgenre (name hardcore)(subgenre-name happy)(subgenre-min-bpm 174)(subgenre-max-bpm 190)
    (true 
			obvious-tempo happy cheesy danceable four-on-the-floor verse-chorus drum-machine 
            digital vocals-present vocals-studio-recorded vocals-female vocals-melodic vocals-english )
    (false 
			soulful funky jazzy warm ambient cold uplifting 
           	dystopian hypnotic aggressive sad abrasive 
           	breakbeat percussion-none sampled-breaks live-drummer 
           	buildup-breakdown repetitive minimalist syncopated intricate-rhythms groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	thin rhythmic-timbre vocals-sampled vocals-male 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-unpitched)
    (unknown))
    
    ;-------------------- oldskool --------------------
    (subgenre (name jungle)(subgenre-name oldskool)(subgenre-min-bpm 148)(subgenre-max-bpm 168)
    (true 
			obvious-tempo aggressive breakbeat sampled-breaks cheesy danceable syncopated intricate-rhythms 
            repetitive digital vocals-present vocals-studio-recorded vocals-female vocals-heavily-effected vocals-melodic vocals-english)
    (false 
			soulful funky jazzy warm ambient cold uplifting 
           	dystopian hypnotic happy sad abrasive 
           	four-on-the-floor percussion-none drum-machine live-drummer 
           	verse-chorus buildup-breakdown minimalist groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	thin rhythmic-timbre vocals-sampled vocals-male 
           	 vocals-breathy vocals-diva 
           	vocals-rap-style vocals-unpitched)
    (unknown))
    
    ;-------------------- musique concrete/tape music --------------------
    (subgenre (name downtempo)(subgenre-name musique-concrete)(subgenre-min-bpm -10)(subgenre-max-bpm -10)
    (true 
			abrasive percussion-none minimalist sparse-instrumentation rhythmic-timbre )
    (false 
			obvious-tempo soulful funky jazzy warm ambient cold uplifting 
           	dystopian hypnotic aggressive happy sad cheesy danceable 
           	four-on-the-floor breakbeat sampled-breaks drum-machine live-drummer 
           	verse-chorus buildup-breakdown repetitive 
           	syncopated intricate-rhythms groovy-feel 
           	band-not-electronic turntablism three-oh-three digital thin 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- early electronic --------------------
    (subgenre (name downtempo)(subgenre-name early-electronic)(subgenre-min-bpm 82)(subgenre-max-bpm 140)
    (true 
			obvious-tempo warm happy breakbeat live-drummer verse-chorus cheesy syncopated band-not-electronic digital )
    (false 
			soulful funky jazzy ambient cold uplifting 
           	dystopian hypnotic aggressive sad abrasive danceable 
           	four-on-the-floor percussion-none sampled-breaks drum-machine 
           	buildup-breakdown repetitive minimalist 
           	intricate-rhythms groovy-feel 
           	sparse-instrumentation turntablism three-oh-three 
           	thin rhythmic-timbre 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- acid jazz --------------------
    (subgenre (name downtempo)(subgenre-name acid-jazz)(subgenre-min-bpm 72)(subgenre-max-bpm 120)
    (true 
			obvious-tempo jazzy ambient soulful breakbeat sampled-breaks repetitive syncopated groovy-feel )
    (false 
			funky warm cold uplifting 
           	dystopian hypnotic aggressive happy sad abrasive cheesy danceable 
           	four-on-the-floor percussion-none drum-machine live-drummer 
           	verse-chorus buildup-breakdown minimalist intricate-rhythms 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three digital thin rhythmic-timbre 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- trip hop --------------------
    (subgenre (name downtempo)(subgenre-name trip-hop)(subgenre-min-bpm 70)(subgenre-max-bpm 108)
    (true 
			obvious-tempo soulful warm breakbeat sampled-breaks verse-chorus syncopated groovy-feel vocals-present 
            vocals-studio-recorded vocals-female vocals-heavily-effected vocals-breathy vocals-melodic vocals-english)
    (false 
			funky jazzy ambient cold uplifting 
           	dystopian hypnotic aggressive happy sad abrasive cheesy danceable 
           	four-on-the-floor percussion-none drum-machine live-drummer 
           	buildup-breakdown repetitive minimalist intricate-rhythms 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	digital thin rhythmic-timbre 
           	vocals-sampled vocals-male  vocals-diva 
           	vocals-rap-style vocals-unpitched )
    (unknown))
    
    ;-------------------- minimalism --------------------
    (subgenre (name downtempo)(subgenre-name minimalism)(subgenre-min-bpm -10)(subgenre-max-bpm -10)
    (true 
			ambient cold hypnotic percussion-none minimalist band-not-electronic )
    (false 
			obvious-tempo soulful funky jazzy warm uplifting 
           	dystopian aggressive happy sad abrasive cheesy danceable 
           	four-on-the-floor breakbeat sampled-breaks drum-machine live-drummer 
           	verse-chorus buildup-breakdown repetitive 
           	syncopated intricate-rhythms groovy-feel 
           	sparse-instrumentation turntablism three-oh-three 
           	digital thin rhythmic-timbre 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
    
    ;-------------------- ambient --------------------
    (subgenre (name downtempo)(subgenre-name ambient)(subgenre-min-bpm -10)(subgenre-max-bpm -10)
    (true 
			ambient cold hypnotic percussion-none minimalist digital )
    (false 
			obvious-tempo soulful funky jazzy warm uplifting 
           	dystopian aggressive happy sad abrasive cheesy danceable 
           	four-on-the-floor breakbeat sampled-breaks drum-machine live-drummer 
           	verse-chorus buildup-breakdown repetitive  
           	syncopated intricate-rhythms groovy-feel 
           	band-not-electronic sparse-instrumentation turntablism three-oh-three 
           	thin rhythmic-timbre 
           	vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
           	vocals-heavily-effected  vocals-breathy vocals-diva 
           	vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
    (unknown))
)

(deffacts question-base
    ;placeholder for hardcoded questions, this is used in the explanation system
    
     (question-template (reference-attribute verse-chorus)
        (membership-value 10)
        (question-text "verse-chorus")
        (explanation-text "verse-chorus")
        (question-type 0)
     ) 
    
     (question-template (reference-attribute minimalist)
        (membership-value 10)
        (question-text "minimalist")
        (explanation-text "minimalist")
        (question-type 0)
     ) 
    
     (question-template (reference-attribute repetitive)
        (membership-value 10)
        (question-text "repetitive")
        (explanation-text "repetitive")
        (question-type 0)
     ) 
    
     (question-template (reference-attribute buildup-breakdown)
        (membership-value 10)
        (question-text "buildup-breakdown")
        (explanation-text "buildup-breakdown")
        (question-type 0)
     ) 
    
     (question-template (reference-attribute four-on-the-floor)
        (membership-value 15)
        (question-text "four-on-the-floor")
        (explanation-text "four-on-the-floor")
        (question-type 0)
     ) 
    
     (question-template (reference-attribute breakbeat)
        (membership-value 15)
        (question-text "breakbeat")
        (explanation-text "breakbeat")
        (question-type 0)
     ) 
     
     (question-template (reference-attribute percussion-none)
     	(membership-value 15)
     	(question-text "percussion-none")
     	(explanation-text "percussion-none")
     	(question-type 0)
     )
    
    (question-template (reference-attribute obvious-tempo)
        (membership-value 15)
        (question-text "obvious-tempo?")
        (explanation-text "obvious-tempo")
        (question-type 0)
     ) 
    
    ;vocals present is hardcoded to add 5 or subtract 10, so this may not work 
     (question-template (reference-attribute vocals-present)
        (membership-value 5)
        (question-text "vocals-present?")
        (explanation-text "vocals-present.")
        (question-type 0)
     )
    
    ;questions that may be asked by Jess as part of the greedy elimination system
	(question-template (reference-attribute vocals-male)
        (membership-value 5)
        (question-text "Are the vocals present in the song performed by a male?")
        (explanation-text "If this song contains vocals by a male, or if you think the genre that the song belongs to can have vocals sung by a male, answer yes.")
        (question-type 0)
     )
    
     (question-template (reference-attribute vocals-female)
        (membership-value 5)
        (question-text "Are the vocals present in the song performed by a female?")
        (explanation-text "If this song contains vocals by a female, or if you think the genre that the song belongs to can have vocals sung by a female, answer yes.")
        (question-type 0)
     )

    
     (question-template (reference-attribute vocals-diva)
        (membership-value 5)
        (question-text "Are the vocals present in the song sung in a diva style?")
        (explanation-text "Diva style vocals are characterized by virtuosic performance of difficult melodic lines, high register singing and melismatic (singing many notes per syllable) runs.")
        (question-type 0)
     )
     
     (question-template (reference-attribute vocals-breathy)
        (membership-value 5)
        (question-text "Are the vocals present in the song sung in a breathy style?")
        (explanation-text "Breathy style vocals are often smooth, understated and laid-back feeling. They are the result of the vocalist expelling more air than necessary while singing, creating a whispy sound.")
        (question-type 0)
     )
    
     (question-template (reference-attribute vocals-sampled)
        (membership-value 5)
        (question-text "Are the vocals present in the song sampled from a different source?")
        (explanation-text "Sampled vocals are taken from other works and reappropriated for use in the song by the producer.  They will often be short, clipped passages, instead of extended lines.")
        (question-type 0)
     )
    
     (question-template (reference-attribute vocals-studio-recorded)
        (membership-value 5)
        (question-text "Are the vocals present in extended-phrases?")
        (explanation-text "This question intends to distinguish short vocal phrases sampled from other songs with extended-length vocals recorded for the song specifically.")
        (question-type 0)
     )
    
     (question-template (reference-attribute vocals-unpitched)
        (membership-value 5)
        (question-text "Are the vocals unpitched?")
        (explanation-text "If the vocals aren't sung with particular musical notes, then they can be considered to be unpitched.")
        (question-type 0)
     )
    
     (question-template (reference-attribute vocals-melodic)
        (membership-value 5)
        (question-text "Are the vocals melodic in nature?")
        (explanation-text "If the main theme of the song, usually the catchiest part, is sung then the vocals are melodic.")
        (question-type 0)
     )
    
     (question-template (reference-attribute vocals-rap-style)
        (membership-value 5)
        (question-text "Are the vocals performed in a rapping style?")
        (explanation-text "Rap style vocals are rhythmically, not melodically based.  They feature unpitched, rapidly performed, rhythmically interesting lyrics.")
        (question-type 0)
     )
    
     (question-template (reference-attribute happy)
        (membership-value 5)
        (question-text "Does the song go out of its way to inspire feelings of happiness?")
        (explanation-text "Happy music is usually major and upbeat.  The question refers to music that's purposefully and intentionally happy sounding, more so than the average piece of music. ")
        (question-type 0)
     ) 
    
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
    
     (question-template (reference-attribute vocals-heavily-effected)
        (membership-value 5)
        (question-text "Are the vocals heavily effected?  Do they not sound like a natural human voice?")
        (explanation-text "Some genres of electronic music favor electronically modulated vocals to add interest.")
        (question-type 0)
     ) 
    
    (question-template (reference-attribute funky)
        (membership-value 5)
        (question-text "Does the song have a funky feel?")
       (explanation-text "Funky refers to the 60-70's funk sound that features rhythmic filtered guitars and groovy electric bass.")
        (question-type 0)
     )
    
    (question-template (reference-attribute jazzy)
        (membership-value 5)
        (question-text "Does the song have a jazzy feel?")
        (explanation-text "Jazzy refers to a swung rhythmic feel and harmonic content with heavy use of 7th chords. ")
        (question-type 0)
     )
    
    (question-template (reference-attribute warm)
        (membership-value 5)
        (question-text "Does the song have a warm feel?")
        (explanation-text "Warm music is natural, human and comforting sounding.  It may produce feelings of nostalgia.")
        (question-type 0)
     )
    
    (question-template (reference-attribute ambient)
        (membership-value 5)
        (question-text "Does the song have an ambient feeling?")
        (explanation-text "Ambient refers to a highly reverberant, slowly-changing sound that produces a large sense of space.")
        (question-type 0)
     )
    
    (question-template (reference-attribute cold)
        (membership-value 5)
        (question-text "Does the song have a cold feel?")
        (explanation-text "Cold music is unemotional and not comforting.  It will often sound inhuman and machine-made.")
        (question-type 0)
     )
    
    (question-template (reference-attribute uplifting)
        (membership-value 5)
        (question-text "Does this song feel uplifting?")
        (explanation-text "Uplifting music inspires feelings of grandeur and humanity.  Imagine the dance scene in which the humans rally against the machines in The Matrix.  Opposite of dystopian.")
        (question-type 0)
     )
    
    (question-template (reference-attribute dystopian)
        (membership-value 5)
        (question-text "Does the song have a dystopian feel?")
        (explanation-text "Dystopian refers to an extremely cold, unemotional, menacing and machine feeling.  It can evoke images of the self-aware machine apocalypse.  Opposite of uplifting.")
        (question-type 0)
     )
    
    (question-template (reference-attribute hypnotic)
        (membership-value 5)
        (question-text "Does the song have a hypnotic feel?")
        (explanation-text "Hypnotic refers to a feeling of relaxation and loss of focus created by often repeated, slowly changing musical elements.")
        (question-type 0)
     )
    
    (question-template (reference-attribute aggressive)
        (membership-value 5)
        (question-text "Does the song feel aggressive?")
        (explanation-text "Aggressive music is fast and hard-hitting.  It inspires feelings of aggression.")
        (question-type 0)
     )
    
    (question-template (reference-attribute sad)
        (membership-value 5)
        (question-text "Does the song have a sad feel?")
        (explanation-text "Does the song evoke sad feelings when you listen to it?")
        (question-type 0)
     )
    
    (question-template (reference-attribute abrasive)
        (membership-value 5)
        (question-text "Does the song have an abrasive feel?")
        (explanation-text "Abrasive music is highly distorted, and disharmonious sounding.  It is the opposite of pleasant sounding.")
        (question-type 0)
     )
    
    (question-template (reference-attribute cheesy)
        (membership-value 5)
        (question-text "Does the song have a cheesy feeling?")
        (explanation-text "Cheesy refers to a dated sounding digital timbre.  Usually there will be fake sounding synthesized imitations of real music.")
        (question-type 0)
     )
    
    (question-template (reference-attribute danceable)
        (membership-value 5)
        (question-text "Does the song inspire the feeling of wanting to dance?  Is it danceable?")
        (explanation-text "Not all electronic music was created with the intention of having people dance to it.  Some of it is meant to be listened to and contemplated.")
        (question-type 0)
     )
    
    (question-template (reference-attribute sampled-breaks)
        (membership-value 5)
        (question-text "Does the song use any sampled breaks?")
        (explanation-text "Sampled breaks are drum loops that are sampled from the song they originally appeared in and reappropriated for use in a new piece of music.")
        (question-type 0)
     )
    
    (question-template (reference-attribute drum-machine)
        (membership-value 5)
        (question-text "Does the song use a drum machine for its percussion?")
        (explanation-text "The drums should sound artificial and completely consistent if they were produced by a drum machine. ")
        (question-type 0)
     )
    
    (question-template (reference-attribute live-drummer)
        (membership-value 5)
        (question-text "Does the song use a studio recording of a live drummer for the percussion?")
        (explanation-text "This refers to a drummer that recorded in the studio for this track specifically.  This is different than when an electronic music producer samples and repurposes the drums from a different song.")
        (question-type 0)
     )
    
    (question-template (reference-attribute syncopated)
        (membership-value 5)
        (question-text "Does the song have a syncopated feeling?")
        (explanation-text "Syncopation refers to a tendancy to have important notes fall outside the downbeats.")
        (question-type 0)
     )
    
    (question-template (reference-attribute intricate-rhythms)
        (membership-value 5)
        (question-text "Does the song have particularly intricate rhythms?")
        (explanation-text "In this question intricate refers to rhythms that contain a large density of notes and are highly detailed.")
        (question-type 0)
     )
    
    (question-template (reference-attribute groovy-feel)
        (membership-value 5)
        (question-text "Does the song have a swung or shuffled rhythmic feel?")
        (explanation-text "Swinging and shuffling refers to placing notes slightly before and after the beat, and changing their lengths to create a  ")
        (question-type 0)
     )
    
    (question-template (reference-attribute band-not-electronic)
        (membership-value 5)
        (question-text "Is the song played by a live band?")
        (explanation-text "The instrumentation of in a live band is the standard popular electro-acoustic setup: guitars, drums, bass guitar.")
        (question-type 0)
     )
    
    (question-template (reference-attribute sparse-instrumentation)
        (membership-value 5)
        (question-text "Are there only a few instruments that play at the same time?")
        (explanation-text "Some genres prefer a very simple arrangment of only 1-3 instruments playing at the same time.")
        (question-type 0)
     )
    
    (question-template (reference-attribute turntablism)
        (membership-value 5)
        (question-text "Is there an element of turntablism in the song?")
        (explanation-text "Turntablism refers to the practice of using turntables as an instrument, and is instantly recognizable from the vinyl-scratching sounds.")
        (question-type 0)
     )
    
    (question-template (reference-attribute three-oh-three)
        (membership-value 15)
        (question-text "Does this song use the Roland TB-303 synthesizer?")
        (explanation-text "The 303 is a famous synthesizer that is responsible for the acid-style sound featured in many types of acid music.")
        (question-type 0)
     )
    
    (question-template (reference-attribute digital)
        (membership-value 5)
        (question-text "Does the overall sound of this sound feel digital or obviously synthesized?")
        (explanation-text "Songs that have a digital feel rely entirely on synthesizers and drum machines for the sound.  Digital-sounding synthesizers have harmonics extending in a much higher frequency range than real instruments.")
        (question-type 0)
     )
    
    (question-template (reference-attribute thin)
        (membership-value 5)
        (question-text "Is the range of frequency that this song occupies small?  Does it sound monophoinic?  Does it have a closed-down feeling?")
        (explanation-text "Differences in the mixing skills of the producer and the producers intention can result in music that sounds closed-down and thin, as opposed to wide and open feeling.")
        (question-type 0)
     )
    
    (question-template (reference-attribute rhythmic-timbre)
        (membership-value 5)
        (question-text "Does the song heavily favor rhythmic elements over tonal elements?")
        (explanation-text "Some electronic music totally eschews traditional tonal melody and harmony, instead favoring a purely rhythmic focus.")
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
(call MiftiwacM prepQuestion ?q.OBJECT)
(call MIFTIWAC prepQuestion ?q.OBJECT)

;-----------------------------------------------------------------------------
; Queries
;-----------------------------------------------------------------------------
(defquery true-set-from-slot
    (declare (variables ?slot))
    ?subgenre <- (subgenre {subgenre-name != no-ad} (true $?a ?slot $?b))
)

(defquery false-set-from-slot
    (declare (variables ?slot))
    ?subgenre <- (subgenre {subgenre-name != no-ad} (false $?a ?slot $?b))
)

(defquery get-subgenres
    ?subgenre <- (subgenre {subgenre-name != no-ad})
)

(defquery get-question-from-attr
    (declare (variables ?attr))
	?qt <- (question-template (reference-attribute ?attr))
)

(defquery bpm-inside-search
    (declare (variables ?bpm))
    ?subgenre <- (subgenre {subgenre-name != no-ad} {(subgenre-min-bpm > -1 && subgenre-max-bpm > -1) && (subgenre-min-bpm <= ?bpm && subgenre-max-bpm >= ?bpm)}))

(defquery bpm-outside-search
    (declare (variables ?bpm))
    ?subgenre <- (subgenre {subgenre-name != no-ad} {(subgenre-min-bpm > -1 && subgenre-max-bpm > -1) && (subgenre-min-bpm > ?bpm || subgenre-max-bpm < ?bpm)}))

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
(deffunction question-ready ()
    (if ?*gui* then
     	(call MIFTIWAC questionReady)  
        (halt) 
     else
        (call MiftiwacM questionReady)
     )
)

(deffunction int-to-bool (?a) 
    (eq ?a 1)
)

(deffunction update-membership (?slot ?amount)
	(bind ?result (run-query* true-set-from-slot ?slot))
    (while (?result next)
    	(bind ?subg (?result getObject subgenre))
        (modify ?subg (membership-value (+ ?subg.membership-value ?amount)))
    	(printout t ?subg.subgenre-name " had true for slot " ?slot " and we added " ?amount " points. New point total: " ?subg.membership-value crlf)
        )
    (bind ?result (run-query* false-set-from-slot ?slot))
    (while (?result next)
    	(bind ?subg (?result getObject subgenre))
        (modify ?subg (membership-value (- ?subg.membership-value ?amount)))
    	(printout t ?subg.subgenre-name " had false for slot " ?slot " and we subtracted " ?amount " points. New point total: " ?subg.membership-value crlf)
        )
)

(deffunction update-membership-bpm (?bpm ?amount)
    (bind ?result (run-query* bpm-inside-search ?bpm))
    (while (?result next)
        (bind ?subg (?result getObject subgenre))
        (modify ?subg (membership-value (+ ?subg.membership-value ?amount)))
    	(printout t ?subg.subgenre-name " had bpm " ?bpm " and we added " ?amount " points. New point total: " ?subg.membership-value crlf))
    (bind ?result (run-query* bpm-outside-search ?bpm))
    (while (?result next)
        (bind ?subg (?result getObject subgenre))
        (modify ?subg (membership-value (- ?subg.membership-value ?amount)))
    	(printout t ?subg.subgenre-name " had bpm " ?bpm " and we subtracted " ?amount " points. New point total: " ?subg.membership-value crlf))
)

(deffunction ask-question (?attr ?m)
    (printout t "Next question attribute is: " ?attr crlf)
	(bind ?result (run-query* get-question-from-attr ?attr))
    (while (?result next)
	    (bind ?nqt (?result getObject qt))
	    (modify ?q (questionText ?nqt.question-text))
	    (modify ?q (explanation ?nqt.explanation-text))
	    (modify ?q (type ?nqt.question-type))
	    (modify ?q (answerTexts ?nqt.answers))
	    (question-ready)
        (modify ?m (attr ?attr))
        (bind ?*nqt* ?nqt)
        (modify ?m (mode answer))
     )
)

(deffunction explanation-system (?sg ?wm)
	(bind $?true-attr-to-exp (intersection$ ?sg.true ?wm.true))
    (bind $?false-attr-to-exp (intersection$ ?sg.false ?wm.false))
    (bind ?explanation-string "")
    
    ;determine if is in bpm range
    (bind ?in-range FALSE)
    (bind ?result (run-query* bpm-inside-search ?wm.bpm))
    (while (?result next)
		(bind ?subg (?result getObject subgenre))
        (if (eq ?sg.subgenre-name ?subg.subgenre-name) then
            (bind ?in-range TRUE)
            )
        )
    
    ;sum total points
    (bind ?total-points 0)
    (foreach ?attr $?true-attr-to-exp
        (bind ?result (run-query* attribute-question ?attr))
        (while (?result next)
            (bind ?qt (?result getObject question-template))
            (bind ?attr-mem-value ?qt.membership-value)
            (bind ?total-points (+ ?total-points ?qt.membership-value))
            )
        )
    
    (foreach ?attr $?false-attr-to-exp
        (bind ?result (run-query* attribute-question ?attr))
        (while (?result next)
            (bind ?qt (?result getObject question-template))
            (bind ?attr-mem-value ?qt.membership-value)
            (bind ?total-points (+ ?total-points ?qt.membership-value))
            )
        )
    
    ;if bpm was in range, add points
    (if ?in-range then (bind ?total-points (+ ?total-points ?wm.bpm-points)))
    
    ;if bpm was correct, explain it
    (if ?in-range then (bind ?explanation-string (str-cat ?explanation-string "You indicated that the music had a tempo of " ?wm.bpm " bpm.  This contributed " (round (* 100 (/ 20 ?total-points))) "% to the final decision.
")))
    
    (printout t "Total points: " ?total-points crlf)
    
    ;now explain each true attribute
    (foreach ?attr $?true-attr-to-exp
        (bind ?attr-mem-value 0)
        (bind ?result (run-query* attribute-question ?attr))
        (while (?result next)
            (bind ?qt (?result getObject question-template))
            (bind ?attr-mem-value ?qt.membership-value)
            )
        (bind ?explanation-string (str-cat ?explanation-string "You indicated that the music has the characteristic " ?attr " which contributed " (round (* 100 (/ ?attr-mem-value ?total-points))) "% to the final decision.
")))
    
    ;now explain each false attribute
    (foreach ?attr $?false-attr-to-exp
        (bind ?attr-mem-value 0)
        (bind ?result (run-query* attribute-question ?attr))
        (while (?result next)
            (bind ?qt (?result getObject question-template))
            (bind ?attr-mem-value ?qt.membership-value)
            )
        (bind ?explanation-string (str-cat ?explanation-string "You indicated that the music has the characteristic " ?attr " which contributed " (round (* 100 (/ ?attr-mem-value ?total-points))) "% to the final decision.
")))
    (return ?explanation-string)
)

(deffunction get-highest-membership ()
    (bind ?result (run-query* get-subgenres))
    (bind ?max -100)
    (while (?result next)
        (bind ?subg (?result getObject subgenre))
        (if (> ?subg.membership-value ?max) then
            (bind ?max ?subg.membership-value))
        )
    (return ?max)
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
    ?m <- (qa-toggle (mode ?mm))
    (test (eq ?mm question))
    ?wm <- (working-memory (unknown $?list))
    (test (> (length$ $?list) 0))
    =>
    (bind $?counts (create$))
    (foreach ?attr $?list 
		(bind ?result (run-query* get-subgenres))
        (bind ?truecount 0)
        (bind ?falsecount 0)
    	(while (?result next)
        	(bind ?sg (?result getObject subgenre))
        	(if (subsetp (create$ ?attr) ?sg.true) then
        	    (++ ?truecount)
       	 	else (if (subsetp (create$ ?attr) ?sg.false) then
       	    	(++ ?falsecount)))
        	)
        (printout t "Attr t/f split: " ?attr ", " ?truecount ", " ?falsecount crlf)
		(bind $?counts (create$ $?counts (abs (- ?truecount ?falsecount))))
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
    (ask-question ?refAttr ?m)
    
    ; Ghetto hack toggle. :(
    (if (eq ?wm.toggle true) then (modify ?wm (toggle false))
        else (modify ?wm (toggle true))
    )
)

(defrule no-solution
    (declare (salience 50))
	?wm <- (working-memory (unknown $?list))
    (test (= (length$ $?list) 0))
    =>
    (printout t "No-Solution rule match OMG OMG OMG OMG!!!")
    (modify ?q (type 3))
    (modify ?q (answerTexts "No_Genre" "No_Subgenre" "We were unable to find a matching result given your input.  Sorry, please try again."))
    (question-ready)
)

(defrule next-question-answer
    (declare (salience 69))
    ?m <- (qa-toggle (mode ?mm))
    (test (eq ?mm answer))
    ?wm <- (working-memory (unknown $?list))
    =>
	(update ?q.OBJECT)
	(if (int-to-bool ?q.answer) then
	    (modify ?wm (true (union$ ?wm.true (create$ ?m.attr))))
	    (modify ?wm (unknown (complement$ (create$ ?m.attr) ?wm.unknown)))
	    (update-membership ?m.attr ?*nqt*.membership-value)
	 else
	    (modify ?wm (false (union$ ?wm.false (create$ ?m.attr))))
	    (modify ?wm (unknown (complement$ (create$ ?m.attr) ?wm.unknown )))
        (update-membership ?m.attr (div ?*nqt*.membership-value -1))
	     )
    (modify ?m (mode question))
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
        (modify ?q (type 3))
        (modify ?q (answerTexts ?sg.name ?sg.subgenre-name (explanation-system ?sg ?wm)))
        (printout t "Answer is: " ?sg.subgenre-name crlf)
        (question-ready)
	)
)

/*(defrule lower-membership-threshold
    (declare (salience 99))
    ?wm <- (working-memory (threshold ?thresh))
     =>
    )*/

(defrule penalty-membership-threshold
    (declare (salience 98))
    ?wm <- (working-memory (threshold ?thresh) (neg-threshold ?neg-thresh))
    ?sg <- (subgenre (subgenre-name ?sgname)(membership-value ?membership))
    (test (> (- (get-highest-membership) ?membership) ?neg-thresh))
    (test (not(eq ?sgname no-ad)))
    =>
    (printout t "Eliminated subgenre " ?sgname " with membership value " ?membership crlf)
    (retract ?sg)
)

;----------------- Hard-coded Questions -----------------

(defrule obvious-tempo-question
    (declare (salience 90))
    ?m <- (qa-toggle (mode ?mm))
    (test (eq ?mm question))
    ?wm <- (working-memory (true $?t) (false $?f)(unknown $?ua obvious-tempo $?ub))
    =>
    (modify ?q (type 0))
    (modify ?q (questionText "Is there an obvious tempo?"))
    (modify ?q (explanation "If you can tap your hand to the beat, then there is an obvious tempo."))
    (question-ready)
	(modify ?m (mode answer))
)

(defrule obvious-tempo-answer
    (declare (salience 90))
    ?m <- (qa-toggle (mode ?mm))
    (test (eq ?mm answer))
    ?wm <- (working-memory (true $?t) (false $?f)(unknown $?ua obvious-tempo $?ub))
    ?qt <- (question-template (reference-attribute obvious-tempo) (membership-value ?mv))
    =>
    (update ?q.OBJECT)
	(if (int-to-bool ?q.answer) then
        (modify ?wm (true $?t obvious-tempo))
        (modify ?wm (unknown $?ua $?ub))
        (update-membership obvious-tempo ?mv)
     else
        (modify ?wm (false $?f obvious-tempo))
        (modify ?wm (unknown $?ua $?ub))
        (modify ?wm (threshold (/ ?wm.threshold 3)))
        (modify ?wm (neg-threshold (/ ?wm.neg-threshold 3)))
        (update-membership obvious-tempo (- 0 ?mv))
     )
    (modify ?m (mode question))
)

(defrule get-bpm-question
    (declare (salience 88))
    ?m <- (qa-toggle (mode ?mm))
    (test (eq ?mm question))
    ?wm <- (working-memory (true $? obvious-tempo $?) (bpm ?bpm))
    (test (eq ?bpm 0))
	=>
    (modify ?q (type 1))
    (modify ?q (questionText "What is the BPM (Beats Per Minute)?"))
    (modify ?q (explanation "This is essentially how many times you would tap your hand to the beat per minute."))
    (question-ready)
    (modify ?m (mode answer))
)

(defrule get-bpm-answer
    (declare (salience 88))
    ?m <- (qa-toggle (mode ?mm))
    (test (eq ?mm answer))
    ?wm <- (working-memory (true $? obvious-tempo $?) (bpm ?bpm))
    (test (eq ?bpm 0))
	=>
    (update ?q.OBJECT)
    (modify ?wm (bpm ?q.answer))
    (update-membership-bpm ?wm.bpm ?wm.bpm-points)
    (modify ?m (mode question))
)

(defrule break-vs-four-on-the-floor
    (declare (salience 86))
    ?m <- (qa-toggle (mode ?mm))
    (test (eq ?mm question))
    ?wm <- (working-memory (bpm ?bpm) (true $?t) (false $?f) (unknown $?ua four-on-the-floor $?ub))
    (test (not (eq ?bpm 0)))
	=>
    (modify ?q (type 2))
    (modify ?q (questionText "Which of the following two options best describes the kick (bass) drum in the song?"))
    (modify ?q (explanation "Four on the floor features a constant (pounding) kick drum on every downbeat.
Breakbeat has a  (broken beat) kick that is not constant, but falls on different beats.
If there are no drums, choose no percussion present."))
    (modify ?q (answerTexts "Four on the Floor" "Breakbeat" "No Percussion Present"))
    (question-ready)
    (modify ?m (mode answer))
)

(defrule break-vs-four-on-the-floor-answer
    (declare (salience 86))
    ?m <- (qa-toggle (mode ?mm))
    (test (eq ?mm answer))
    ?wm <- (working-memory (bpm ?bpm) (true $?t) (false $?f) (unknown $?ua four-on-the-floor $?ub))
    (test (not (eq ?bpm 0)))
	=>
    (update ?q.OBJECT)
    (printout t "wtf: " ?q.answer crlf)
    (if (eq ?q.answer 0) then
    	(modify ?wm (true $?t four-on-the-floor))
        (modify ?wm (false $?f breakbeat percussion-none))
        (update-membership four-on-the-floor 25)
    else (if (eq ?q.answer 1) then
	    (modify ?wm (true $?t breakbeat))
	    (modify ?wm (false $?f four-on-the-floor percussion-none))
	    (update-membership breakbeat 25)
    else (if (eq ?q.answer 2) then
        (modify ?wm (true $?t percussion-none))
	    (modify ?wm (false $?f four-on-the-floor breakbeat))
	    (update-membership percussion-none 25)    
    	)))
    (modify ?wm (unknown (complement$ (create$ four-on-the-floor breakbeat percussion-none) (create$ $?ua four-on-the-floor $?ub))))
	(modify ?m (mode question))
)

(defrule song-structure-question
	(declare (salience 84))
    ?m <- (qa-toggle (mode ?mm))
    (test (eq ?mm question))
    ?wm <- (working-memory (true $?t) (false $?f) (unknown $?a verse-chorus $?b) (bpm ?bpm))
    (test (not (eq ?bpm 0)))
    =>
    (modify ?q (type 2))
    (modify ?q (questionText "Which of the following best describes the song structure?"))
    (modify ?q (explanation "Verse Chorus - The standard pop structure, in which there's two clear melodic sections that repeat.  If there are lyrics, they may change during the verse, but be constant in the chorus.
Repetitive - often repeats the same motif, not clear A-B section distinction, more like A, not A.  
Minimalist - either through-composed (no repeating sections) or complete disregard for song structure
Buildup Breakdown - heavy emphasis on tension and release through anticipation of the drop, when either the drums or melody will become central after a long build."))
    (modify ?q (answerTexts "Verse Chorus" "Repetitive" "Minimalist" "Buildup Breakdown"))
    (question-ready)
    (modify ?m (mode answer))
)

(defrule song-structure-answer
	(declare (salience 84))
    ?m <- (qa-toggle (mode ?mm))
    (test (eq ?mm answer))
    ?wm <- (working-memory (true $?t) (false $?f) (unknown $?a verse-chorus $?b)  (bpm ?bpm))
    (test (not (eq ?bpm 0)))
    =>
    (update ?q.OBJECT)
    (printout t "wtf: " ?q.answer crlf)
    (if (eq ?q.answer 0) then
		(modify ?wm (true $?t verse-chorus))
        (modify ?wm (false $?f repetitive minimalist buildup-breakdown))
        (update-membership verse-chorus 10)
    else (if (eq ?q.answer 1) then
        (modify ?wm (true $?t repetitive))
        (modify ?wm (false $?f verse-chorus minimalist buildup-breakdown))
		(update-membership repetitive 10)
	else (if (eq ?q.answer 2) then
        (modify ?wm (true $?t minimalist))
        (modify ?wm (false $?f verse-chorus repetitive buildup-breakdown))
        (update-membership minimalist 10)
    else (if (eq ?q.answer 3) then
        (modify ?wm (true $?t buildup-breakdown))
        (modify ?wm (false $?f verse-chorus repetitive minimalist))
        (update-membership buildup-breakdown 10)
     	))))
    (modify ?wm (unknown (complement$ (create$ verse-chorus repetitive minimalist buildup-breakdown) (create$ $?a verse-chorus $?b))))
    (modify ?m (mode question))
)

(defrule vocals-question
    (declare (salience 82))
    ?m <- (qa-toggle (mode ?mm))
    (test (eq ?mm question))
    ?wm <- (working-memory (true $?t) (false $?f) (unknown $?a vocals-present $?b)  (bpm ?bpm))
    (test (not (eq ?bpm 0)))
    =>
	(modify ?q (type 0))
    (modify ?q (questionText "Are there vocals present in the song?"))
    (modify ?q (explanation "The vocals can either appear as vocal samples or studio recorded vocals."))
    (question-ready)
	(modify ?m (mode answer))
)

(defrule vocals-answer
    (declare (salience 82))
    ?m <- (qa-toggle (mode ?mm))
    (test (eq ?mm answer))
    ?wm <- (working-memory (true $?t) (false $?f) (unknown $?a vocals-present $?b) (bpm ?bpm))
    (test (not (eq ?bpm 0)))
    =>
    (update ?q.OBJECT)
    (if (int-to-bool ?q.answer) then
        (modify ?wm (true $?t vocals-present))
        (modify ?wm (unknown $?a $?b))
        (update-membership vocals-present 5)
     else
        (modify ?wm (false $?f vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
            				   vocals-heavily-effected  vocals-breathy vocals-diva 
            				   vocals-rap-style vocals-melodic vocals-unpitched vocals-english))
        (modify ?wm (unknown (complement$ (create$ 
                        							vocals-present vocals-studio-recorded vocals-sampled vocals-male vocals-female 
            										vocals-heavily-effected vocals-breathy vocals-diva 
            										vocals-rap-style vocals-melodic vocals-unpitched vocals-english)
                    					  (create$ $?a vocals-present $?b))))
        (update-membership vocals-present -10)
    )
    (modify ?m (mode question))
)

/*(defrule vocals-type
    (declare (salience 80))
    ?m <- (mode (mode ?mm))
    (test (eq ?mm question))
    ?wm <- (working-memory (bpm ?bpm) (true $?ta vocals-present $?tb) (false $?f) (unknown $?ua vocals-studio-recorded $?ub))
	=>
    (modify ?q (type 2))
    (modify ?q (questionText "Which of the following two options best describes the nature of the vocals?"))
    (modify ?q (explanation "Studio recorded vocals are extended passages, vocals sung specifically for use in the song.  Sampled vocals are often shorter clips, taken from other sources."))    
    (modify ?q (answerTexts "Studio Recorded" "Sampled"))
    (question-ready)
    (modify ?m (mode answer))
    (update ?q.OBJECT)
    (if (eq ?q.answer 0) then
    	(modify ?wm (true $?ta vocals-studio-recorded $?tb))
        (modify ?wm (false $?f vocals-sampled))		
        (update-membership vocals-studio-recorded 5)
    else
        (modify ?wm (true $?ta vocals-sampled $?tb))
        (modify ?wm (false $?f vocals-studio-recorded))
        (update-membership vocals-sampled 5)
    )
    (modify ?wm (unknown (complement$ (create$ vocals-studio-recorded vocals-sampled) (create$ $?ua vocals-studio-recorded $?ub))))
)*/

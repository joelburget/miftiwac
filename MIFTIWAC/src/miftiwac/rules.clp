

;-----------------------------------------------------------------------------
; Templates
;-----------------------------------------------------------------------------
/*
(deftemplate attributes
    (multislot feel 			(type STRING) (allowed-values soulful funky jazzy warm ambient cold uplifting dystopian hypnotic aggressive angry happy sad calming abrasive pleasant cheesy danceable))    
    (multislot percussion 		(type STRING) (allowed-values four-on-the-floor breakbeat none sampled-breaks drum-machine live-drummer))
    (multislot arrangement 		(type STRING) (allowed-values verse-chorus buildup-breakdown repetitive minimalist))
    (multislot rhythm-meter 	(type STRING) (allowed-values obvious-tempo four-four non-four-four heavily-syncopated unsyncopated intricate-rhythms simple-rhythms groovy-feel straight-feel))
    (multislot instrumentation 	(type STRING) (allowed-values band electronic lush sparse turntablism-present 303-present))
    (multislot timbre 			(type STRING) (allowed-values digital organic thin wide highly-produced weakly-produced melodic-harmonic rhythmic))
    (multislot vocals 			(type STRING) (allowed-values present absent sampled studio-recording male female heavily-effected lightly-effected dry autotuned not-autotuned breathy diva-style rap-style soulful melodic unpitched english non-english harmonies))
)
*/
(deftemplate attributes
    (slot soulful 					(allowed-values true false unknown))
    (slot funky 					(allowed-values true false unknown))
    (slot jazzy 					(allowed-values true false unknown))
    (slot warm 						(allowed-values true false unknown))
    (slot ambient 					(allowed-values true false unknown))
    (slot cold 						(allowed-values true false unknown))
    (slot uplifting 				(allowed-values true false unknown))
    (slot dystopian 				(allowed-values true false unknown))
    (slot hypnotic 					(allowed-values true false unknown))
    (slot aggressive 				(allowed-values true false unknown))
    (slot angry 					(allowed-values true false unknown))
    (slot happy 					(allowed-values true false unknown))
    (slot sad 						(allowed-values true false unknown))
    (slot abrasive 					(allowed-values true false unknown))
    (slot pleasant 					(allowed-values true false unknown))
    (slot cheesy 					(allowed-values true false unknown))
    (slot danceable 				(allowed-values true false unknown))
    (slot four-on-the-floor 		(allowed-values true false unknown))
    (slot breakbeat 				(allowed-values true false unknown))
    (slot percussion-none 			(allowed-values true false unknown))
    (slot sampled-breaks 			(allowed-values true false unknown))
    (slot drum-machine 				(allowed-values true false unknown))
    (slot live-drummer 				(allowed-values true false unknown))
    (slot verse-chorus 				(allowed-values true false unknown))
    (slot buildup-breakdown 		(allowed-values true false unknown))
    (slot repetitive 				(allowed-values true false unknown))
    (slot minimalist 				(allowed-values true false unknown))
    (slot obvious-tempo				(allowed-values true false unknown))
    (slot four-four 				(allowed-values true false unknown))
    (slot syncopated 				(allowed-values true false unknown))
    (slot intricate-rhythms 		(allowed-values true false unknown))
    (slot groovy-feel 				(allowed-values true false unknown))
    (slot band 						(allowed-values true false unknown))
    (slot electronic 				(allowed-values true false unknown))
    (slot lush-instrumentation		(allowed-values true false unknown))
    (slot turntablism 				(allowed-values true false unknown))
    (slot three-oh-three 			(allowed-values true false unknown))
    (slot digital 					(allowed-values true false unknown))
    (slot thin 						(allowed-values true false unknown))
    (slot highly-produced 			(allowed-values true false unknown))
    (slot melodic-harmonic-timbre	(allowed-values true false unknown))
    (slot vocals-present 			(allowed-values true false unknown))
    (slot vocals-studio-recorded 	(allowed-values true false unknown))
    (slot vocals-sampled 			(allowed-values true false unknown))
    (slot vocals-male 				(allowed-values true false unknown))
    (slot vocals-female 			(allowed-values true false unknown))
    (slot vocals-heavily-effected	(allowed-values true false unknown))
    (slot vocals-autotuned 			(allowed-values true false unknown))
    (slot vocals-breathy 			(allowed-values true false unknown))
    (slot vocals-diva 				(allowed-values true false unknown))
    (slot vocals-rap-style 			(allowed-values true false unknown))
    (slot vocals-melodic 			(allowed-values true false unknown))
    (slot vocals-unpitched 			(allowed-values true false unknown))
    (slot vocals-english 			(allowed-values true false unknown))
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
    (slot subgenre-min-bpm 	(type INTEGER) (default -1))
    (slot subgenre-max-bpm 	(type INTEGER) (default -1))
)

(deftemplate working-memory
    extends subgenre
    (slot bpm (type INTEGER) (default 0))
    (slot current-step (type STRING) (allowed-values obvious-tempo bpm vocals))
    (slot question (allowed-values TRUE FALSE))
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
    (subgenre (name house) (subgenre-name garage) (subgenre-min-bpm 110) (subgenre-max-bpm 124) (feel soulful funky jazzy warm danceable) (percussion four-on-the-floor drum-machine) (rhythm-meter obvious-tempo four-four heavily-syncopated simple-rhythms groovy-feel) (instrumentation electronic sparse) (timbre digital melodic-harmonic) (vocals present studio-recording dry autotuned soulful melodic english))
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
    (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful true)(funky true)(jazzy false)(warm true)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable true)
        (four-on-the-floor true)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer true)
        (verse-chorus true)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four true)(syncopated true)(intricate-rhythms false)(groovy-feel true)
        (band true)(electronic false)(lush-instrumentation true)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced true)(melodic-harmonic-timbre true)
        (vocals-present true)(vocals-studio-recorded true)(vocals-male true)(vocals-female true)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic true)(vocals-unpitched false)(vocals-english true)
    )
    ;-------------------- italo  --------------------
    (subgenre(name house)(subgenre-name italo)(subgenre-min-bpm 120)(subgenre-max-bpm 132)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy true)(sad false)(abrasive false)(pleasant false)(cheesy true)(danceable true)
        (four-on-the-floor true)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine true)(live-drummer false)
        (verse-chorus true)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four true)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic true)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital true)(thin true)(highly-produced false)(melodic-harmonic-timbre true)
        (vocals-present true)(vocals-studio-recorded true)(vocals-male true)(vocals-female true)(vocals-heavily-effected true)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic true)(vocals-unpitched false)(vocals-english true)
    )
 	/*
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    ;-------------------- disco --------------------
        (subgenre(name house)(subgenre-name disco)(subgenre-min-bpm 98)(subgenre-max-bpm 135)(obvious-tempo true)
        (soulful false)(funky false)(jazzy false)(warm false)(ambient false)(uplifting false)(dystopian false)(hypnotic false)
        (aggressive false)(angry false)(happy false)(sad false)(abrasive false)(pleasant false)(cheesy false)(danceable false)
        (four-on-the-floor false)(breakbeat false)(percussion-none false)(sampled-breaks false)(drum-machine false)(live-drummer false)
        (verse-chorus false)(buildup-breakdown false)(repetitive false)(minimalist false)
        (four-four false)(syncopated false)(intricate-rhythms false)(groovy-feel false)
        (band false)(electronic false)(lush-instrumentation false)(turntablism false)(three-oh-three false)
        (digital false)(thin false)(highly-produced false)(melodic-harmonic-timbre false)
        (vocals-present false)(vocals-studio-recorded false)(vocals-male false)(vocals-female false)(vocals-heavily-effected false)(vocals-autotuned false)
        (vocals-breathy false)(vocals-diva false)(vocals-rap-style false)(vocals-melodic false)(vocals-unpitched false)(vocals-english false)
    )
    */
    
)

;-----------------------------------------------------------------------------
; Questions
;-----------------------------------------------------------------------------



;(call Controller prepQuestion [the value from the OBJECT slot for the Question you just made])


(deftemplate Question
    (declare (from-class Question)
             (include-variables TRUE)))

;(defclass Question Question)


/*
(deftemplate question
    (slot name (type STRING))
    (slot type (type STRING) (allowed-values boolean multiple-choice user-input-integer))
    (slot question-text (type STRING))
    (slot explanation (type STRING))
    (multislot choices (type STRING))
    (slot user-answer (type INTEGER))
    (slot current-step (type STRING) (allowed-values obvious-tempo bpm vocals finished))
    )
*/
;-----------------------------------------------------------------------------
; Rules
;-----------------------------------------------------------------------------
; startup vs deffacts
/*
(defrule startup 
    "Takes care of necessary initializations."
    =>
    (reset)
	(assert (working-memory (current-step obvious-tempo) (question TRUE)))
)
*/
(defrule debug-start
    
    =>
    (reset)
    (assert (Question (questionText "This is a sample shared memory question")))
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
        		(current-step (if ?obvious-tempo then bpm else finished)))
)

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

(defquery bpm-reverse-search
    (declare (variables ?bpm))
    (subgenre {(subgenre-min-bpm > -1 && subgenre-max-bpm > -1) && (subgenre-min-bpm > ?bpm || subgenre-max-bpm < ?bpm)}))

(defquery obvious-tempo-reverse-search
    (subgenre (rhythm-meter obvious-tempo) {subgenre-min-bpm > -1})
)

(defrule bpm-filter
    ?wm <- (working-memory (current-step ?step) (obvious-tempo TRUE) (question ?question) (bpm ?bpm))
    (test (and (streq ?step "bpm") (= ?question FALSE)))
    =>
    (bind ?result (run-query* bpm-reverse-search ?bpm))
    (while (?result next) (printout t (?result.name))(retract ?result))
    (modify ?wm (current-step vocals) (question TRUE))
)

(defrule bpm-finished
    ?wm <- (working-memory (current-step ?step) (question ?question))
    (test (and (streq ?step "bpm") (= ?question FALSE)))
    =>
    (modify ?wm (current-step finished) (question FALSE))
    (printout t "bpm-finished" crlf)
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

/*
(defrule vocals-filter
    (declare (salience 50))
    ?wm <- (working-memory (current-step ?step) (question ?question) (vocals ?wm-vocals))
    (test (streq ?step "vocals"))
    (test (= ?question FALSE))
    ?subgenre <- (subgenre (vocals ?subgenre-vocals))
    (test (neq ?wm ?subgenre))
    (not (streq ?wm-vocals ?subgenre-vocals))
    =>
    (retract ?subgenre)
)
*/

(defrule finished
    ?wm <- (working-memory (current-step ?step) (question ?question))
    (test (streq ?step "finished"))
    =>
    (printout t "Finished, dumping current memory" crlf)
    (facts)
)


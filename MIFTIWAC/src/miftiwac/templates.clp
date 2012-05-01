(deftemplate genre
    (slot name (type STRING) (allowed-values house trance techno hardcore breakbeat jungle downtempo))
    (slot min-bpm (type INTEGER))
    (slot max-bpm (type INTEGER))
    (multislot attributes)
)

(deftemplate subgenre
    extends genre
    (slot subgenre-name 	(type STRING))
    (slot subgenre-min-bpm 	(type INTEGER))
    (slot subgenre-max-bpm 	(type INTEGER))
    (multislot attributes)
)

(deftemplate attributes
    (multislot feel 			(type STRING) (allowed-values soulful funky warm ambient cold uplifting dystopian hypnotic aggressive angry calming abrasive pleasant cheesy))
    (multislot percussion 		(type STRING) (allowed-values four-on-the-floor breakbeat none sampled-breaks drum-machine live-drummer))
    (multislot arrangement 		(type STRING) (allowed-values verse-chorus buildup-breakdown repetitive minimalist))
    (multislot rhythm-meter 	(type STRING) (allowed-values four-four non-four-four heavily-syncopated unsyncopated intricate-rhythms simple-rhythms groovy-feel straight-feel))
    (multislot tonality 		(type STRING) (allowed-values major minor))
    (multislot instrumentation 	(type STRING) (allowed-values band-arrangement electronic-arrangement turntablism-present))
    (multislot vocals 			(type STRING) (allowed-values present absent sampled studio-recording male female heavily-effected dry autotuned not-autotuned breathy diva-style rap-style soulful melodic unpitched english non-english))
)
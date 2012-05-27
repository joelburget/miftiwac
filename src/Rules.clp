;creates question object and binds it for easy reference by ?q
(defclass question Question)
(bind ?q (definstance question (new Question)))
(call Miftiwac prepQuestion ?q.OBJECT)

; (modify ?q (slotname value1 value2 value3 ...))
(call Miftiwac questionReady)
(update ?q.OBJECT)
; continue
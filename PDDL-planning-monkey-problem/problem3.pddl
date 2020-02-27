;Autor : Daniel Proaño Guevara
;Asignatura : Razonamiento y Planificación
(define (problem problema3) (:domain monoBanana)
(:objects 
    mono1 -mono
    cuarto1 cuarto2 cuarto3 cuarto4 -cuarto
    caja1 -caja
    banana1 -banana
)

(:init
    ;; Disposición del espacio de movilidad para el mono
    (enlace-cuarto cuarto1 cuarto2)
    (enlace-cuarto cuarto2 cuarto1)

    (enlace-cuarto cuarto2 cuarto3)
    (enlace-cuarto cuarto3 cuarto2)

    (enlace-cuarto cuarto2 cuarto4)
    (enlace-cuarto cuarto4 cuarto2)

    ;; Ubicación original del mono
    (loc-mono mono1 cuarto2)
    (not(subir-mono mono1))

    ;; Ubicación original de la caja
    (loc-caja caja1 cuarto1)

    ;; Ubicación original de la banana
    (loc-banana banana1 cuarto3)
    (libre banana1)
   
)

(:goal (and
    (not(libre banana1))
    (loc-mono mono1 cuarto4)

))

)

;Autor : Daniel Proaño Guevara
;Asignatura : Razonamiento y Planificación

(define (domain monoBanana)

(:requirements :strips :typing :negative-preconditions)

(:types 
    mono caja banana cuarto -object
)

(:predicates
    (enlace-cuarto ?c1 -cuarto ?c2 -cuarto)
    (loc-mono ?m -mono ?c1 -cuarto)
    (loc-caja ?c -caja ?c1 -cuarto)
    (loc-banana ?b -banana ?c1 -cuarto)
    (subir-mono ?mono -mono)
    (libre ?l)
)


;; El mono puede cambiar de habitación
(:action mover-mono
    :parameters (?mono -mono ?cuartoOrigen -cuarto ?cuartoDestino -cuarto)
    :precondition (and 
        (enlace-cuarto ?cuartoOrigen ?cuartoDestino)
        (loc-mono ?mono ?cuartoOrigen)
        (not(subir-mono ?mono))
    )
    :effect (and 
        (not (loc-mono ?mono ?cuartoOrigen))
        (loc-mono ?mono ?cuartoDestino)
    )
)


;;El mono toma la caja y se mueve con ella para poder cambiarla de habitación
(:action cargar-caja
    :parameters (?mono -mono ?caja -caja ?cuartoOrigen -cuarto ?cuartoDestino -cuarto)
    :precondition (and 
        (enlace-cuarto ?cuartoOrigen ?cuartoDestino)
        (loc-mono ?mono ?cuartoOrigen)
        (loc-caja ?caja ?cuartoOrigen)
        (not(subir-mono ?mono))
    )
    :effect (and 
        (not(loc-caja ?caja ?cuartoOrigen))
        (loc-caja ?caja ?cuartoDestino)
        (not (loc-mono ?mono ?cuartoOrigen))
        (loc-mono ?mono ?cuartoDestino)
    )
)

;;El mono puede subir a la caja siempre y cuando se encuentre en el suelo
(:action subir-caja
    :parameters (?mono -mono ?caja -caja ?cuarto -cuarto)
    :precondition (and 
        (loc-caja ?caja ?cuarto)
        (loc-mono ?mono ?cuarto) 
        (not(subir-mono ?mono))   
    )
    :effect (and 
        (subir-mono ?mono)
    )
)


;; El mono puede regresar a su estado original en el suelo
(:action bajar-caja
    :parameters (?mono -mono ?caja -caja ?cuarto -cuarto)
    :precondition (and 
        (loc-caja ?caja ?cuarto)
        (loc-mono ?mono ?cuarto)
        (subir-mono ?mono)
    )
    :effect (and 
        (not (subir-mono ?mono))
    )
)

;;Las bananas pueden ser tomadas
(:action cojer-banana
    :parameters (?mono -mono ?banana -banana ?cuarto -cuarto)
    :precondition (and 
        (loc-mono ?mono ?cuarto)
        (loc-banana ?banana ?cuarto)
        (subir-mono ?mono)
        (libre ?banana)
    )
    :effect (and 
        (not (libre ?banana))
    )
)

)
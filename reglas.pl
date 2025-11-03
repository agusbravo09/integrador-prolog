%Reglas

inferir(vida_basica, Planeta) :- vida_basica(Planeta).
inferir(vida_compleja, Planeta) :- vida_compleja(Planeta).
inferir(vida_inteligente, Planeta) :- vida_inteligente(Planeta).
inferir(habitable, Planeta) :- habitable(Planeta).
inferir(civilizacion_avanzada, Planeta) :- civilizacion_avanzada(Planeta).

vida_basica(Planeta) :-  planeta(Planeta, tiene_atmosfera),
                         planeta(Planeta, tiene_agua_liquida),
                         planeta(Planeta, tiene_elementos_biogenicos).
                         
vida_compleja(Planeta) :- vida_basica(Planeta),
                          planeta(Planeta, tiene_evolucion_biologica),
                          planeta(Planeta, tiene_superficie_solida).
                          
vida_inteligente(Planeta) :- vida_compleja(Planeta),
                             planeta(Planeta, tiene_tecnologia).
                             
habitable(Planeta) :- planeta(Planeta, tiene_atmosfera),
                      planeta(Planeta, tiene_magnetosfera),
                      planeta(Planeta, tiene_gravedad_estable),
                      planeta(Planeta, tiene_ciclo_dia_noche).
                      
civilizacion_avanzada(Planeta) :- vida_inteligente(Planeta),
                                  habitable(Planeta),
                                  planeta(Planeta, tiene_luz_solar).
                                  

                                  












#lang racket-bricks

(require "../compiler.rkt")
(require "../toys/toys.rkt")
(require (prefix-in h: 2htdp/image))

;TODO:
;  Be able to spawn/swap-to composite objects
;    Do this first.  Needed for cool stuff below (e.g. spawn sparks, blood, etc)
;  Do a demo with something meaningful to swap to:
;    Boxing glove from incredible machine
;    Moving car from not moving car


;NOTES:
;  Can't collide with composite objects -- pinned-motor e.g.


(define b (stick-figure))
(define b2 (gravity '(0 0) (ball)))

(define to-spawn (hidden
                  (fragments
                   (stick-figure)
                   16)))

(define to-spawn2 (hidden (bowling-ball)))

(define b-with-behaviour
  (on-collide b b2 (do-many
                    (swap-to to-spawn) 
                    #;(spawn to-spawn2))))

(simulate
 (wooden-level
  (overlay
   to-spawn
   (catapult
    (above
     b2
     (v-space 50)
     b-with-behaviour)))))



 
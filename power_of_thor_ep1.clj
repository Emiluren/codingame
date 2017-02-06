(ns Player
  (:gen-class))

(def dirs {[ 0 -1] "N"
           [ 1 -1] "NE"
           [ 1  0] "E"
           [ 1  1] "SE"
           [ 0  1] "S"
           [-1  1] "SW"
           [-1  0] "W"
           [-1 -1] "NW"})

(defn clamp [x min-v max-v]
  (min (max x min-v) max-v))

(defn next-step [[cur-x cur-y] [tx ty]]
  (let [[dx dy] [(- tx cur-x) (- ty cur-y)]
        step-x (clamp dx -1 1)
        step-y (clamp dy -1 1)]
    [step-x step-y]))

(defn walk [[cur-x cur-y] [sx sy]]
  [(+ cur-x sx) (+ cur-y sy)])

(defn -main [& args]
  (let [lightX (read) lightY (read) initialTX (read) initialTY (read)]
    (loop [current [initialTX initialTY], target [lightX lightY]]
      (let [remainingTurns (read)
            step (next-step current target)]
        (println (get dirs step))
        (recur (walk current step) target)))))

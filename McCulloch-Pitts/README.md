 # Celula McCulloch-Pitts

 Esta célula puede considerarse como una red neuronal artificial, por el tipo de estructura que tiene. Este modelo de neurona fue propuesto por Warren McCulloch y Wlater Pitts en 1943. En él, modelizaban una estructura y un funcionamiento simplificado de las neuronas del cerebro, considerándose como dispositivos con sólo dos estados posibles, apagado y encendido (`0` y `1` respectivamente).

 La célula recibe como entrada un conjutno de `n` valores binarios, procedentes de las salidas de otras células, o de la entrada a la red; y produce una única salida también binaria, `s`. Cada célula se caracteriza por `n+1` valores reales, de los cuales `n` son los pesos de las conexiones (`w_i`) correspondientes a las entradas `x_1`, y otro es un valor de umbral `\theta`, que puede ser distinto para cada célula. Esta opera en lapsos discretos; la forma de procesar la entrada es la siguiente: la célula se activará y, por lo tanto, producirá un valor `1`, si la suma de las entradas multiplicadas por los pesos supera el umbral `\theta`.

 El modelo matemático es:

 `n=\sum_{i = 1}^{R} w_ip_i` ; `a = f(n)`
 
 Donde:

 `a = 1` *si* `n > \theta`
 
 `a = 0` *en otro caso*
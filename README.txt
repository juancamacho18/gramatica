GRAMATICAS

Gramatica 1:
	S->0S0, 1S1, 1, 0
	L(G1): 1 y 0

Gramatica 2:
	S->Ab
	A->aAb | e
	L(G2): a^n b^n+1 | n>=0

Gramatica 3:
	S->Ab
	A->aAb | ab
	L(G3): a^n b^(n+1) | n>0

Gramatica 4:
	S->Ab
	A->ab | a
	L(G4): abb | ab

Gramatica 5:
	S->Ab
	A->Aab | a
	L(G5): a(ab)^n b | n>=0


ARCHIVOS
prueba1.txt (Ejemplos gramatica 1)
prueba2.txt (Ejemplos gramatica 2)
prueba3.txt (Ejemplos gramatica 3)
prueba4.txt (Ejemplos gramatica 4)
prueba5.txt (Ejemplos gramatica 5)
gramatica.py (Ejecutar en Python)
gramatica.l(Ejecutar en Flex (C))

COMO EJECUTAR
*En Python 
	Python gramatica.py prueba#.txt

*En C (Flex)
	flex gramatica.l
	gcc lex.yy.c -lfl -o gramatica
	./gramatica<prueba#.txt



import sys

def validar(palabra):
    #L(G1):1 y 0 
    if palabra=='0' or palabra=='1':
        return True

    if len(palabra)>=3:
        primero=palabra[0]
        ultimo=palabra[-1]
        if primero==ultimo and primero in ['0', '1']:
            if validar(palabra[1:-1]):
	   	        return True


    #L(G2 y G3): a^n b^(n+1)
    def a_b(pal):
        i=0
        if len(pal)<2 or pal[0]!='a' or pal[-1]!='b':
            return False
        if pal=='ab':
            return True
        if pal[0]=='a' and pal[-1]=='b':
            return a_b(pal[1:-1])
        return False

    if palabra and palabra[-1] == 'b':
        if a_b(palabra[:-1]):
            return True

    #L(G4):abb | ab
    if palabra=='abb' or palabra=='ab':
        return True
    
    # L(G5): a(ab)^n b | n >= 0
    if palabra and palabra[0]=='a' and palabra[-1]=='b':
        medio=palabra[1:-1]
        i=0
        valido = True
        while i < len(medio):
            if medio[i:i+2] != 'ab':
                valido = False
                break
            i += 2
        if valido and medio != '':
            return True


    return False

if __name__=="__main__": 
    texto=sys.argv[1]
    try:
        with open(texto, 'r', encoding='utf-8') as archivo:
            for linea in archivo:
                palabra=linea.strip()
                if not palabra:
                    continue
                if validar(palabra):
                    print("acepta")
                else:
                    print("No acepta")
    except FileNotFoundError:
        print(f"Error: El archivo '{texto}' no fue encontrado.")


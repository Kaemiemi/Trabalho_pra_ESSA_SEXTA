size = 5000

def gerar_matriz():
    for i in size:
        for j in size:
            matriz[i],[j] = i
    return matriz

def soma_matrizes(matriz1, matriz2):  
    # Cria uma matriz de mesmo tamanho para armazenar o resultado
    resultado = [[0 for _ in range(len(matriz1[0]))] for _ in range(len(matriz1))]
    
    # Realiza a soma elemento a elemento
    for i in range(len(matriz1)):
        for j in range(len(matriz1[0])):
            resultado[i][j] = matriz1[i][j] + matriz2[i][j]
    
    return resultado

matriz1 = gerar_matriz()

matriz2 = gerar_matriz()

resultado = soma_matrizes(matriz1, matriz2)

# Imprime a matriz resultante
for linha in resultado:
    print(linha)

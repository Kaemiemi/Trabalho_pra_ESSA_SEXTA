def soma_matrizes(matriz1, matriz2):
    # Verifica se as dimensões das matrizes são compatíveis
    if len(matriz1) != len(matriz2) or len(matriz1[0]) != len(matriz2[0]):
        raise ValueError("As matrizes devem ter as mesmas dimensões.")
    
    # Cria uma matriz de mesmo tamanho para armazenar o resultado
    resultado = [[0 for _ in range(len(matriz1[0]))] for _ in range(len(matriz1))]
    
    # Realiza a soma elemento a elemento
    for i in range(len(matriz1)):
        for j in range(len(matriz1[0])):
            resultado[i][j] = matriz1[i][j] + matriz2[i][j]
    
    return resultado

# Exemplo de uso
matriz1 = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

matriz2 = [
    [9, 8, 7],
    [6, 5, 4],
    [3, 2, 1]
]

resultado = soma_matrizes(matriz1, matriz2)

# Imprime a matriz resultante
for linha in resultado:
    print(linha)

size = 5

def gerar_matriz(size):
    # Inicializa uma matriz vazia
    matriz = [[0 for _ in range(size)] for _ in range(size)]
    
    # Preenche a matriz com valores
    for i in range(size):
        for j in range(size):
            matriz[i][j] = i  # Aqui você pode escolher qualquer valor
    return matriz

def soma_matrizes(matriz1, matriz2):  
    # Cria uma matriz de mesmo tamanho para armazenar o resultado
    resultado = [[0 for _ in range(len(matriz1[0]))] for _ in range(len(matriz1))]
    
    # Realiza a soma elemento a elemento
    for i in range(len(matriz1)):
        for j in range(len(matriz1[0])):
            resultado[i][j] = matriz1[i][j] + matriz2[i][j]
    
    return resultado

# Gera duas matrizes de tamanho 5000x5000
matriz1 = gerar_matriz(size)
matriz2 = gerar_matriz(size)

# Soma as matrizes
resultado = soma_matrizes(matriz1, matriz2)

# Imprime as primeiras 5 linhas do resultado para verificação
print("Primeiras 5 linhas do resultado:")
for linha in resultado:
    print(linha)

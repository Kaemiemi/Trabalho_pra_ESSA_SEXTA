size = 100

def gerar_matriz(size):
    # Inicializa uma matriz vazia
    matriz = [[0 for _ in range(size)] for _ in range(size)]
    
    # Preenche a matriz com valores
    for i in range(size):
        for j in range(size):
            matriz[i][j] = i+j  # valor da fileira + valor da coluna
    return matriz

def soma_matrizes(matriz1, matriz2):  
    # Cria uma matriz de mesmo tamanho para armazenar o resultado
    resultado = [[0 for _ in range(len(matriz1[0]))] for _ in range(len(matriz1))]
    
    # Realiza a soma elemento a elemento
    for i in range(len(matriz1)):
        for j in range(len(matriz1[0])):
            resultado[i][j] = matriz1[i][j] + matriz2[i][j]
    
    return resultado

# Gera duas matrizes de tamanho definido em size
matriz1 = gerar_matriz(size)
matriz2 = gerar_matriz(size)

# Soma as matrizes
resultado = soma_matrizes(matriz1, matriz2)

print("Matriz matriz1:")
for linha in matriz1:
    print(linha)

print("###############################################################") #uma divisória

# Imprime a matriz resultado
print("Matriz resultado:")
for linha in resultado:
    print(linha)

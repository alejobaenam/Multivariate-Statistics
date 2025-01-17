# Encontrar el número óptimo de clústeres para la clasificación con k-means
from sklearn.cluster import KMeans  # Importar la clase KMeans de sklearn para realizar clustering
import pandas as pd  # Importar pandas para manipulación de datos
import matplotlib.pyplot as plt  # Importar matplotlib para visualización

# Cargar el conjunto de datos
iris = pd.read_csv("iris.csv")

# Seleccionar las características (features) del conjunto de datos
x = iris.iloc[:, [0, 1, 2, 3]].values

# (Within Cluster Sum of Squares) Inicializar una lista para almacenar la suma de cuadrados dentro del clúster (WCSS)
wcss = [] 

# Iterar sobre un rango de posibles números de clústeres (de 1 a 10)
for i in range(1, 11):
    # Inicializar y ajustar el modelo KMeans con el número actual de clústeres
    kmeans = KMeans(n_clusters=i, init='k-means++', max_iter=300, n_init=10, random_state=0)
    kmeans.fit(x)
    # Calcular y almacenar la suma de cuadrados dentro del clúster para este número de clústeres
    wcss.append(kmeans.inertia_)

# Visualizar la "curva del codo" para determinar el número óptimo de clústeres
plt.plot(range(1, 11), wcss)
plt.title('Gráfica "Elbow Method"')
plt.xlabel('Número de clústeres')
plt.ylabel('WCSS (Within Cluster Sum of Squares)')  # Suma de cuadrados dentro del clúster
plt.show()

# Inicializar y ajustar el modelo KMeans con el número óptimo de clústeres encontrado (3)
kmeans = KMeans(n_clusters=3, init='k-means++', max_iter=300, n_init=10, random_state=0)
y_kmeans = kmeans.fit_predict(x)

# Visualizar los clústeres y los centroides
plt.scatter(x[y_kmeans == 0, 0], x[y_kmeans == 0, 1], s=100, c='purple', label='Iris-setosa')
plt.scatter(x[y_kmeans == 1, 0], x[y_kmeans == 1, 1], s=100, c='orange', label='Iris-versicolour')
plt.scatter(x[y_kmeans == 2, 0], x[y_kmeans == 2, 1], s=100, c='green', label='Iris-virginica')
plt.scatter(kmeans.cluster_centers_[:, 0], kmeans.cluster_centers_[:, 1], s=100, c='red', label='Centroides')
plt.legend()
plt.show()

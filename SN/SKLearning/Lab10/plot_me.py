# -*- coding: utf-8 -*-

import matplotlib.pyplot as plt
import numpy as np

import mglearn
from sklearn import datasets
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler

# Escalado de los datos.
print "Carga y escala de datos."
cancer = datasets.load_iris()
#cancer = datasets.load_breast_cancer()
scaler = StandardScaler()
scaler.fit(cancer.data)
X_scaled = scaler.transform(cancer.data)

# Descomposicion mediante PCA.
print "Descomposición mediante PCA"
pca = PCA(n_components=2)
pca.fit(X_scaled)
X_pca = pca.transform(X_scaled)

# Graficar el primero y el segundo componente principal.
print "Grafica de dos componentes."
plt.figure(figsize=(8, 8))
plt.scatter(X_pca[:, 0], X_pca[:, 1], c=cancer.target, cmap=mglearn.tools.cm, s=60)
plt.gca().set_aspect("equal")
plt.xlabel("First principal component")
plt.ylabel("Second principal component")
plt.suptitle("Grafica de componentes")
plt.show()

# Visualizar en un mapa de calor.
print "Visualización en un mapa de calor."
plt.matshow(pca.components_, cmap='viridis')
plt.yticks([0, 1], ["first component", "second component"])
plt.colorbar()
plt.xticks(range(len(cancer.feature_names)),
cancer.feature_names, rotation=60, ha='left');
plt.suptitle("Mapa de calor")
plt.show()

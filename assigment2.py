import numpy as np

emb=np.array([[0.1,0.2,0.3,0.4],[0.5,0.1,0.2,0.0],[0.3,0.3,0.1,0.2]])
# Print the shape of emb.
print(emb.shape)
#Print the ndim of emb.
print(emb.ndim)
#Print the transpose emb.T (dims x products view).
print(emb.T)
#Access the embedding value at product index 2, dimension index 3
print("value:",emb[2,3])
"""
out put:
(3, 4)
2
[[0.1 0.5 0.3]
 [0.2 0.1 0.3]
 [0.3 0.2 0.1]
 [0.4 0.  0.2]]
value: 0.2
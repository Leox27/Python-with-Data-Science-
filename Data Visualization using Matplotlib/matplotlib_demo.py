# Visualizing Tons of Data 

import matplotlib.pyplot as plt
import numpy as np

for i in range(50):
    plt.plot(np.random.rand(100), linewidth=1)

plt.grid(True)
plt.tight_layout() # IT will show on in .py file
plt.legend()
plt.show()
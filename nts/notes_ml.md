### Generative AI

Generative AI, short for Generative Artificial Intelligence, refers to a category of artificial intelligence systems and techniques that are designed to generate new, original content or data that is similar to, or resembles, human-created content. These systems have the ability to produce text, images, audio, or even other types of data, often based on patterns and structures they have learned from large datasets during training.

Here are some key aspects and concepts related to generative AI:

-   `Generative Models`: Generative AI systems are often built using generative models, which are mathematical and computational models that learn the underlying patterns and structures of data. These models can then generate new instances of data that share similarities with the training data.

-   `Training Data`: Generative AI models require large datasets for training. For example, a text-based generative model might be trained on a vast collection of text documents, while an image-based model would need a large dataset of images. The quality and diversity of the training data can significantly impact the generated results.

-   `Variety of Applications`: Generative AI has a wide range of applications across various domains. Some common applications include:

    -   `Text Generation`: This includes tasks such as language translation, chatbots, and the generation of creative writing or poetry.

    -   `Image Generation`: Generative models can create realistic images, whether it's generating faces of people who don't exist, enhancing or modifying existing images, or creating entirely new artworks.

    -   `Audio Generation`: In the realm of audio, generative AI can create music, mimic human speech, or even generate sound effects for games and movies.

-   `Types of Generative Models`: There are several types of generative models, with some of the most notable being:

    -   `Generative Adversarial Networks (GANs)`: GANs consist of two neural networks, a generator and a discriminator, that are trained in opposition. The generator aims to create data that is indistinguishable from real data, while the discriminator tries to tell the difference. This adversarial training process leads to the generation of high-quality content.

    -   `Variational Autoencoders (VAEs)`: VAEs are probabilistic models that map data into a lower-dimensional space and then back to the original space. They are used for tasks like image reconstruction and generating new data samples.

    -   `Recurrent Neural Networks (RNNs) and Transformers`: These models are often used for text generation tasks. Transformers, in particular, have become popular due to their effectiveness in various natural language processing applications.

-   `Ethical Considerations`: Generative AI also raises ethical concerns, especially when it comes to generating deepfake videos or misinformation. It's important to use this technology responsibly and consider the potential consequences.

In summary, generative AI is a fascinating field that revolves around the creation of AI systems capable of producing new and creative content across different domains. These systems are increasingly finding applications in industries such as entertainment, healthcare, and marketing, among others, and they continue to advance with ongoing research and development efforts.

---

**Equation 4-1: Linear Regression model prediction**

$$
\hat{y} = \theta_0 + \theta_1 x_1 + \theta_2 x_2 + \dots + \theta_n x_n
$$

**Equation 4-2: Linear Regression model prediction (vectorized form)**

$$
\hat{y} = h_{\boldsymbol{\theta}}(\mathbf{x}) = \boldsymbol{\theta} \cdot \mathbf{x}
$$

**Equation 4-3: MSE cost function for a Linear Regression model**

$$
\begin{split}
\text{MSE}(\mathbf{X}, h*{\boldsymbol{\theta}})
&= \dfrac{1}{m} \sum\limits*{i=1}^{m}{(\boldsymbol{\theta}^T \mathbf{x}^{(i)} - y^{(i)})^2} \\
&= \dfrac{1}{m} \left\| \mathbf{X} \boldsymbol{\theta} - \mathbf{y}) \right\|^2
\end{split}
$$

**Equation 4-4: Normal Equation**

$$
\hat{\boldsymbol{\theta}} = (\mathbf{X}^T \mathbf{X})^{-1} \mathbf{X}^T \mathbf{y}
$$

**Equation 4-5: Partial derivatives of the cost function**

$$
\dfrac{\partial}{\partial \theta_j} \text{MSE}(\boldsymbol{\theta}) = \dfrac{2}{m}\sum\limits_{i=1}^{m}(\boldsymbol{\theta}^T \mathbf{x}^{(i)} - y^{(i)})\, x_j^{(i)}
$$

**Equation 4-6: Gradient vector of the cost function**

$$
\nabla_{\boldsymbol{\theta}}\, \text{MSE}(\boldsymbol{\theta}) =
\begin{pmatrix}
 \frac{\partial}{\partial \theta_0} \text{MSE}(\boldsymbol{\theta}) \\
 \frac{\partial}{\partial \theta_1} \text{MSE}(\boldsymbol{\theta}) \\
 \vdots \\
 \frac{\partial}{\partial \theta_n} \text{MSE}(\boldsymbol{\theta})
\end{pmatrix}
 = \dfrac{2}{m} \mathbf{X}^T (\mathbf{X} \boldsymbol{\theta} - \mathbf{y})
$$

**Equation 4-7: Gradient Descent step**

$$
\boldsymbol{\theta}_{new} = \boldsymbol{\theta}_{old} - \eta \cdot \nabla_{\boldsymbol{\theta}}\, \text{MSE}(\boldsymbol{\theta})
$$

**Equation 4-8: Ridge Regression cost function**

$$
\begin{split}
J(\boldsymbol{\theta})
&= \dfrac{1}{m} \sum\limits*{i=1}^{m}{(\boldsymbol{\theta}^T \mathbf{x}^{(i)} - y^{(i)})^2} + \alpha \dfrac{1}{2}\sum\limits*{i=1}^{n}{\theta*i}^2 \\
&= \dfrac{1}{m} \left\| \mathbf{X} \boldsymbol{\theta} - \mathbf{y}) \right\|^2 + \dfrac{\alpha}{2}\sum\limits*{i=1}^{n} \left\| \boldsymbol{\theta} \right\|^2
\end{split}
$$

**Equation 4-9: Ridge Regression closed-form solution**

$$
\hat{\boldsymbol{\theta}} = (\mathbf{X}^T \mathbf{X} + \alpha \mathbf{I})^{-1} \mathbf{X}^T \mathbf{y}
$$

**Equation 4-10: Lasso Regression cost function**

$$
\begin{split}
J(\boldsymbol{\theta})
&= \dfrac{1}{m} \sum\limits*{i=1}^{m}{(\boldsymbol{\theta}^T \mathbf{x}^{(i)} - y^{(i)})^2} + \alpha \sum\limits*{i=1}^{n}\left| \theta*i \right| \\
&= \dfrac{1}{m} \left\| \mathbf{X} \boldsymbol{\theta} - \mathbf{y}) \right\|^2 + \alpha \sum\limits*{i=1}^{n} {\left\| \boldsymbol{\theta} \right\|}\_{1}
\end{split}
$$

**Equation 4-11: Lasso Regression subgradient vector**

$$
g(\boldsymbol{\theta}, J) = \nabla_{\boldsymbol{\theta}}\, \text{MSE}(\boldsymbol{\theta}) + \alpha
\begin{pmatrix}
  \operatorname{sign}(\theta_1) \\
  \operatorname{sign}(\theta_2) \\
  \vdots \\
  \operatorname{sign}(\theta_n) \\
\end{pmatrix} \quad \text{where } \operatorname{sign}(\theta_i) =
\begin{cases}
-1 & \text{if } \theta_i < 0 \\
0 & \text{if } \theta_i = 0 \\
+1 & \text{if } \theta_i > 0
\end{cases}
$$

# Project: Words 4 Music

### [Project Description](doc/Project4_desc.md)

![image](http://danverspublicschools.org/holten-richmond/wp-content/uploads/sites/6/2014/01/music-dandelion.jpg)

Term: Fall 2016

+ [Data link](https://courseworks2.columbia.edu/courses/11849/files/folder/Project_Files?preview=763391)-(**courseworks login required**)
+ [Data description](doc/readme.html)
+ Contributor's name: Yueqi Zhang
+ Projec title: Features and Lyrics Analysis

+ +Project summary: The main prupose of this project is to explore connection between lyrics and features. Based on this goal, I complete this project by two main part. The first one is to recommend lyrics to a new song, or rather, which words have a relatively higher showing up probability. The second part is to explore association pattern between features and songs by association rules. 

**Part 1:**

+ Step 1: The first step is to classify lyrics by topicmodels. This method is able to classify songs with same topics into one group and I got the document terms matrix by Tf-Idf. By this step, I labeled each song and got posterior distributions of 4974 words in each topic. I show key words in each topic below, and it is obvious that, except stopwords in english, each topic has different meaning such as the second one is respect to love and the third one is about family. 

+ Step 2: The next step is feather extraction. I use all of the feathers in Group “analysis” except songs and every feathers related to confidence. Then I truncated every feather in different songs into same dimension. Finally I applied PCA methods to select variables that can describe more than 90% of the feathers’ information. I shrinked the dimension of features from 20000 to 2000.

+ Step 3: After these two steps, I use KNN and random forest to do supervised classification to feathers with the label we got from topic models. By this step, when we get a new song, we can predict it's class and get the showing up probability of each word. 

+ Step 4: The final step is to calculate the probability of each words showing in the new songs by this function:

$$
P\left ( word\, in\, a\, song \right )=\sum_{k=1}^{K}P\left ( \omega \mid \tau _{k} \right )P\left ( \tau _{k}\mid features \right )
$$

	
Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.

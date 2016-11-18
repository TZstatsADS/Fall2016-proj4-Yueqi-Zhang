# Project: Words 4 Music

### [Project Description](doc/Project4_desc.md)

![image](http://danverspublicschools.org/holten-richmond/wp-content/uploads/sites/6/2014/01/music-dandelion.jpg)

Term: Fall 2016

+ [Data link](https://courseworks2.columbia.edu/courses/11849/files/folder/Project_Files?preview=763391)-(**courseworks login required**)
+ [Data description](doc/readme.html)
+ Contributor's name: Yueqi Zhang
+ Projec title: Features and Lyrics Analysis

+ + Project summary: The main prupose of this project is to explore connection between lyrics and features. Based on this goal, I complete this project by two main part. The first one is to recommend lyrics to a new song, or rather, which words have a relatively higher showing up probability. The second part is to explore association pattern between features and songs by association rules. 

+ + Part 1:
+ Step 1: The first step is to classify lyrics by topicmodels. This method is able to classify songs with same topics into one group and I got the document terms matrix by Tf-Idf. By this step, I labeled each song and got posterior distributions of 4974 words in each topic. I show key words in each topic below, and it is obvious that, except stopwords in english, each topic has different meaning such as the second one is respect to love and the third one is about family. 

	
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

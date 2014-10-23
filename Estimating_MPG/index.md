---
title       : Predicting MPG
subtitle    : Based on mtcars
author      : Pep Carrera
job         : Student in Coursera
framework   : io2012
highlighter : highlight.js
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

1. Our Application attemptes to predict MPG
2. The Prediction is based on a model that uses the mtcars data set
3. Over the next few slides you will see the model, and understand how we use it and the user inputs to easily predict your car's miles per gallon!

--- .class #id 

## The data

1. We use the mtcars data set
2. Below you'll see a snapshot of the mtcars data
3. As you can see there are many variables, however our best model that predicts mpg uses cyl (cylinders), hp (horse power), wt (weight, lbs divided by 1000), and am (is it automatic or manual)


```r
data(mtcars)
head(mtcars)
```

```
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```
---

## The model

1. As previously explained, we use the 4 key data elements, but we need to do some lite data processing
2. We'll make am and cyl factors
3. Next you'll see us fit the model on the data set


```r
mtcars$am <- factor(mtcars$am)
mtcars$cyl <- factor(mtcars$cyl)

# Create model predicting mpg based on cylinder, horse power, weight, and transmission type (am)
modelFit <- lm(mpg ~ cyl + hp + wt + am, data = mtcars)
```

---

## Predicting Miles Per Gallon

1. Here we show you the prediction function that the application takes advatnage of
2. First we create a dataframe with data from a 2010 Ford Mustang (V6 Automatic)


```r
newdata <- data.frame(cyl=6, hp=210, wt=3401/1000, am=1)
newdata$am <- factor(newdata$am)
newdata$cyl <- factor(newdata$cyl)
```

---

## The Results

1. We run the predict function on the data
2. Our function predicts 17.25 MPG (The actual is 19)
3. As you can see this is a great application to predict MPG simply based on targets for a car
4. Check out or app here: https://pepcarrera.shinyapps.io/Developing-Data-Products

5. Here is the Ford Mustang MPG official page: 

http://www.fueleconomy.gov/feg/noframes/26348.shtml


```r
predict(modelFit,newdata=newdata)
```

```
##     1 
## 17.25
```


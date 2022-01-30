pdataset = read.csv('Position_Salaries.csv')
pdataset = pdataset[2:3]



# Create regressor here
library(rpart)
regressor = rpart(formula = Salary ~ .,
                  data = pdataset,
                  control = rpart.control(minsplit = 1))

reg
#Predicting a new result
y_pred = predict(regressor, newdata = data.frame(Level = 6.5))





#Visualizing the polynomial Regression results (for higher resolution & Smoother curve)
library(ggplot2)
x_grid = seq(min(pdataset$Level), max(pdataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = pdataset$Level, y = pdataset$Salary),
             color = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            color ='blue') +
  ggtitle('Truth or Bluff (Decision Tree Regression )') +
  xlab('Level') +
  ylab("Salary")

# Predicting a new result with Polynomial Regression


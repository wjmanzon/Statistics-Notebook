# Walk through the example using the two-line model. 
# Refer to the teaching notes and Elder Gilbert's talk for additional insights.

# 1) Define the mathematical equation for the two-line model.
# 2) Fit the model using the lm function:
lm.2lines <-lm(mpg ~ qsec + am + qsec:am, data=mtcars)  

# Use the example in the textbook to interpret the estimates.
# 3) Interpret the intercept and slope of each of the two lines (see explanation below).
# 4) Create a scatterplot using the provided code.

# Fit and summarize the two-line model:
summary(lm.2lines)

view(mtcars)

# Alternative notation for interaction term:
lm.2lines <-lm(mpg ~ qsec * am, data=mtcars)
summary(lm.2lines)

# Fit a simple linear model for comparison:
lm.line <-lm(mpg ~ qsec, data=mtcars)
summary(lm.line)

# Create a scatterplot with different colors for transmission types (am)
plot(mpg ~ qsec, data=mtcars, col=c("yellow","red")[as.factor(am)], pch=16, 
     bg="gray83", main="Two-line Model using mtcars dataset", cex.main=1)

legend("topleft", legend=c("Baseline (am==0)", "Modified Slope (am==1)"), 
       bty="n", lty=1, col=c("yellow","red"), cex=0.8)

# Extract the model coefficients:
b <- coef(lm.2lines)

# Coefficients correspond to:
# b[1] (Intercept): -9.0099
# b[2] (Slope for qsec when am == 0): 1.4385
# b[3] (Intercept adjustment for am == 1): -14.5107
# b[4] (Slope adjustment for am == 1): 1.3214

# Add the regression lines to the plot
curve(b[1] + b[2]*x, col="yellow", lwd=2, add=TRUE)  # Baseline (am == 0)
curve((b[1] + b[3]) + (b[2] + b[4])*x, col="red", lwd=2, add=TRUE) # Adjusted line (am == 1)

# Display coefficients
b

# Use ggplot2 for a clearer visualization:
library(tidyverse)
ggplot(mtcars, aes(y=mpg, x=qsec, color=factor(am))) +
  geom_point(pch=16) +
  stat_function(fun = function(x) b[1] + b[2]*x, color="red") +  # Line for am == 0
  stat_function(fun = function(x) (b[1] + b[3]) + (b[2] + b[4])*x, color="yellow") + # Line for am == 1
  scale_color_manual(name="Transmission (am)", values=c("red","yellow")) +
  labs(title="Two-line Model using mtcars dataset")

# Another visualization approach:
ggplot(mtcars, aes(y=mpg, x=qsec, color=factor(am))) +
  geom_point(pch=16, bg="gray83") +
  geom_smooth(method="lm", se=FALSE) +  # Draws the full interaction model
  scale_color_manual(name="Transmission (am)", values=c("red","yellow")) +
  labs(title="Two-line Model using mtcars dataset")

# Check model assumptions:
par(mfrow=c(1,3))
plot(lm.2lines, which=1) # Residuals vs. fitted plot

# Check normality of residuals
library(car)
qqPlot(lm.2lines$residuals)

# Plot residuals
plot(lm.2lines$residuals)

# Check for significance:
# qsec is significant, and the interaction term (change in slope) is also significant.

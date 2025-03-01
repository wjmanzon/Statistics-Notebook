?faithful

View(faithful)

plot(eruptions ~ waiting, data = faithful)
eruptions_lm <- lm(eruptions ~ waiting, data = faithful)
abline(eruptions_lm)
summary(eruptions_lm)

par(mfrow=c(1,2))
plot(eruptions_lm, which=1:2)
par(mfrow = c(1,1))


res1 <- rxFastLinear(isCase ~ age + parity + education + spontaneous + induced,
                 transforms = list(isCase = case == 1),
                 data = infert,
                 type = "binary")
# Print a summary of the model
summary(res1)

# Score to a data frame
scoreDF <- rxPredict(res1, data = infert,
   extraVarsToWrite = "isCase")

# Compute and plot the Radio Operator Curve and AUC
roc1 <- rxRoc(actualVarName = "isCase", predVarNames = "Probability", data = scoreDF)
plot(roc1)
rxAuc(roc1)
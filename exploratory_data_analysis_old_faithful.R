#####
# Load Data
#####

# Load the datasets library
library(datasets)

# Load the Old Faithful dataset (faithful) from that library into your R environment
data <- faithful

# You can use either <- or = to assign objects, values, etc. to a variable.
# This would do the exact same thing: data = faithful

# If you're in RStudio, you should see data listed under Data in your Environment pane.


#####
# View Data
#####

# View the top 6 lines of the dataset.
head(data)

# If you want to learn more about that function (or any function) use help.
# The funciton name needs to be quoted. You can use ' or " for that.
# (I may switch back and forth in this script.)
help('head')

# View the top 10 lines of the dataset
head(data, n = 10)

# View the last 10 lines of the dataset
tail(data, n = 10)

# Get the dimensions of this dataset (rows and columns)
dim(data)

# Get just the number of rows
## Method 1: Using dim()
## Note: R uses 1 as the first index value, so dim(data)[1] gives you the first
## of the two values that dim() returns.
dim(data)[1] 

## Method 2: Using nrow()
nrow(data)

# Get just the number of columns
## Method 1: Using dim()
dim(data)[2]

## Method 2: Usign ncol()
ncol(data)[2]

row.names(data)

# View column names
colnames(data)

# You can change the column names if you want. Like if you wanted them to just
# be single letters, you could do this:
colnames(data) <- c('e', 'w')
colnames(data)

# And you can switch them back
colnames(data) <- c('eruptions', 'waiting')
# View row names (I pretty much never use these.  They just default to the row
# numbers, but as character strings)
row.names(data)

# View the entire dataset
View(data)


#####
# Data types
#####
# Our dataset is stored as a data frame.  You can check that using the class
# funciton.
class(data)

# You can also check the class of the individual columns.
# If you want to refer to a specific column of a data frame, use a dollar sign
# between the data frame name and the column name.
class(data$eruptions)
class(data$waiting)


#####
# Exploratory Data Analysis
#####

# We can calculate basic summary statistics about the columns in our dataset.
# The easiest option (assuming it covers what you need) is to just use the
# summary function
summary(data)

# Or, there are functions that will calculate these statistics individually.
# Their names are pretty self explanatory.
min(data$eruptions)
min(data$waiting)

max(data$eruptions)
max(data$waiting)

mean(data$eruptions)
mean(data$waiting)

median(data$eruptions)
median(data$waiting)

var(data$eruptions)
var(data$waiting)

sd(data$eruptions)
sd(data$waiting)

length(data$eruptions)
length(data$waiting)

quantile(data$eruptions)
quantile(data$waiting)

# If you need to round any of these values, you can use the round function.
round(var(data$waiting), 1)
round(quantile(data$eruptions), 2)

# It's also possible to see how these variables relate to each other. One way to
# do that is to find the correlation (which indicates the strenght and direction
# of the linear relationship between the two variables)
cor(data$eruptions, data$waiting)

# A correlaton of 0.9 indicates a strong, positive association.

# Another option is to look at a covariance matrix.
# In the covariance matrix, the covariance of each column with itself is just the
# variance of that column.  The covariance between two different columns being
# non-zero means that waiting and duration are not independent of each other.
# (This makes sense since we've already determined that they're correlated.)
cov(data)


#####
# Univariate Graphs
#####

# Two easy options for graphs are histograms and boxplots.  I'm going to do graphs
# for eruptions, you can try waiting on your own.

# Basic histogram
hist(data$eruptions)

# There are several additional arguments we can use with this function to make
# this graph look nicer. Check help for more info.
help("hist")

# Pretty version of the histogram (other than the data, all of the additional
# arguments are optional.)
hist(data$eruptions, 
     main = 'Old Faithful eruption durations (s)',
     xlim = c(0, 6),
     xlab = 'Eruption duration (s)',
     ylab = 'Frequency',
     col = 'lightblue')

# We can also change where the bars split. Like, if we wanted quarter-second intervals
# we can define where we want those breaks to occur using the seq function.  There
# Are a few options for how that function can be used, but the basic version is
# to specify your starting and ending values and what you want to count by
break_seq = seq(from = 0, to = 6, by = 0.25)
break_seq

# Note that you can now see this sequence listed under values in your environment
# pane.

# Also, because from, to, and by are the first three arguments of that function
# in order, you don't have to actually name them when calling the function.
# This will give you the exact same sequence:
seq(0, 6, 0.25)

# Anyways, we can add that argument to our histogram function.
hist(data$eruptions, 
     main = 'Old Faithful eruption durations (s)',
     xlim = c(0, 6),
     xlab = 'Eruption duration (s)',
     ylab = 'Frequency',
     col = '#124d68',  # I changed the color, just because
     breaks = break_seq
)


# Boxplot
# A boxplot will show the five-number summary (min, Q1, med, Q3, max) of the data.
boxplot(data$eruptions)

# If you prefer horizontal orientation, then there's a function argument for that.
boxplot(data$eruptions, horizontal = T)

# Note: For boolean (true/false) values, R uses either single captial letters (T, F)
# or the full words in all caps (TRUE, FALSE)

# We can use additonal arguments to label the graph
boxplot(data$eruptions, horizontal = TRUE, xlab = "Eruption duration (s)",
        main = 'Old Faithful eruption durations')


#####
# Scatterplots
#####

# The easiest way to make a scatterplot is to just use the plot funciton
plot(data)

# Since there's only two variables, you just get a single scatterplot.  If there
# were more, you'd get a scatterplot matrix with multiple pairwise plots.

# Based on the documentation for this dataset, it sounds like for each pair of 
# eruption and waiting duration, the waiting comes before the eruption, not after,
# so I think it makes more sense to put waiting on the x-axis. We can explicitly
# specify our x and y variables.
plot(data$waiting, data$eruptions)

# And, like with the histogram, we can clean up our graph a bit.
plot(data$waiting, data$eruptions,
     main = 'Wait times and eruption durations for Old Faithful',
     xlab = 'Wait time (min)',
     ylab = 'Eruption duration (s)',
     cex = 1.2, # Makes the points bigger 
     col = 'red',
     pch = 6 # Changes the plotting symbol
)

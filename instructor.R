# R Programming Introduction
# Walkthrough
# Cori Lopazanski


# R & R Studio: R is your knife, RStudio is your kitchen (data = ingredients)
# Show parts of IDE:
# - Console (type and run code)
# - Terminal (direct access to computer OS)
# - Environment (working memory)
# - History
# - Files/Plots/etc.

# Basics: Running code in the console
# - R is a calculator (3 + 4, 3 - 4, 3/4)
# - Run by pressing enter
# > "prompt >" vs. "+" waiting for more info; can press esc.

# Storing objects: use assignment operator
# Ex:
    result <- 3+4
# Ex: area of a circle
    r <- 5
    area <- pi * r^2
    area
    h <- 7
    vol_cyl <- area * h
    vol_cyl

# Note:
# -- these are now stored in our environment
# -- can print them by typing them
    vol_cyl
# -- or using print
    print(vol_cyl)
# -- if you begin typing, R will try to autofill
# -- up/down arrows to pull recent command history

# NAMING THINGS:
# 1. MEANINGFUL
# 2. CONSISTENT
# 3. CONCISE
# 4. CODE & CODER FRIENDLY


# Most code doesn't make sense to run in the console (can't save it)
# Use scripts
# Show how to open a new script (File > New Script or +)
# "Source" pane = write/edit code/docs
# Save in scripts folder as "intro_to_programming.R"

# Write some code in our script
# Ex: Convert age of dog in human years to dog years
   age_years <- 5
   age_dog_years <- age_years * 7
   age_dog_years

# - Code doesn't execute automatically (nothing in env)
# - Send lines to the console by "running" the code
#
# To Run:
# Cursor on lines (or highlight several)
# Command + Enter (Control + Enter)
# Click Run - practice the shortcut because you'll use them constantly

# Benefit of script is to document your work
# - lines that start with # indicate comments (R ignores them)
# - write notes/explanations, temporarily disable code
# - Command + Shift + C will comment/uncomment

# Ex: Add some details to our code
# Add comment on its own line, same line, comment out

# Can also store multiple values in a single object:
age_yrs <- c(5, 3, 7)  # create a vector of ages

yr_to_dog_yr <- 7      # save the conversion factor as an object

# convert `age_yrs` to dog years:
age_dog_yrs <- age_yrs * yr_to_dog_yr

# inspect the values
age_dog_yrs

# Note: Typing assignment operator can be slow
# Shortcut: option + minus (alt + minus)
# Also adds spaces on either side (more readable!)

# Your Turn: Create a vector with the values 18.1, 8.9, 11.3, 11.2, and 15.7, representing tree heights in meters, and assign it an appropriate name. Convert these heights to feet (1 meter = 3.28 feet) and store the result in a second object.

# Height of trees in meters
tree_h_m <- c(18.1, 8.9, 11.3, 11.2, 15.7)

m_to_ft <- 3.28  ### meters to feet conversion ratio

# Height of trees in feet
tree_h_ft <- tree_h_m * m_to_ft

# Mean height of trees, in feet
mean(tree_h_ft)



# Data types and structures
# - Introduce common data types in R (logical, integer, etc.)
# - Character strings are enclosed in quotes:
    my_name <- "Cori"
    my_name

# - Check the data type with "class" or is.character, is.numeric, etc.
    class(my_name)
    is.numeric(my_name)
    is.character(my_name)

# Data structures store data in an organized way
# - Vector: one or more elements of same type
    age_yrs <- c(5, 3, 7)

#   Some examples:
    char_vec <- c("hello", "goodbye", "see you later")
    class(char_vec)

    numeric_vec <- c(5, 1.3, 10)
    class(numeric_vec)

    logical_vec <- c(TRUE, FALSE, TRUE)
    class(logical_vec)

#   If you try to combine different types, will coerce to simplest one:
    combined_vec <- c(TRUE, 3.14, "puppies!")
    class(combined_vec)
    combined_vec # all elements are character (in quotes)


# Retrieve value using the "index" (position) with square brackets:
    numeric_vec <- c(5, 1.3, 10, 2.8, 17, -1)

    numeric_vec[2]          ### retrieve the second element
    numeric_vec[3:5]        ### retrieve the third through fifth element
    numeric_vec[c(1, 3, 6)] ### use a vector to retrieve elements

    numeric_vec[2] <- 3.14  ### set the value of the second element
    numeric_vec             ### element 2 has been changed


# Matrix and array are like vectors, but have more dimensions
#   (good for math but less useful for data science)

# Lists: one or more elements but can be different types
    # a list containing three numeric elements:
    list_of_nums <- list(5, 3.14, -999)

    # a list containing elements of different types
    list_of_stuff <- list(5, 7:10, c("puppies", "kittens"), c(TRUE, FALSE))

    # index lists using double square brackets
    list_of_stuff[[2]]


    class(list_of_stuff[[2]]) # numeric vector: 7, 8, 9, 10
    class(list_of_stuff[[3]]) # character vector: "puppies" and "kittens"

    list_of_stuff[[1]] <- list("bananas", c(1, 2, 4))
    class(list_of_stuff[[1]]) # was numeric, now it's a list!

# Data frames: 2-dimensional structure for tabular data
    # Columns can hold different types
    # Create with: data.frame()
    # Most of the time create by importing .xlsx or .csv

    # Columns: named, store variable
    # Rows: observed values for those variables


# Create a dataframe: 3 dogs, ages, and weights:
    dog_df <- data.frame(
      name   = c('Bruce', 'Waffle', 'Teddy'),
      weight = c(      45,      30,     50),
      age    = c(       9,       5,      7)
    )

    dog_df

    # the spacing, tabs, new lines don't affect how code runs (but makes it readable)

# Explore the dataframe:
    # 1. Click on it in the environment pane, interactive sort/search
    # 2. head()
    head(dog_df)
    # 3. View(dog_df) same as clicking
    View(dog_df)

# Retrieve values - think of it as a list of named vectors
    # char vec length 3
    # num vec length 3
    # num vec length 3

    dog_df[1, 3]       # first row, third column: Waffle's age

    # leave row or column blank to choose all in that row/col:
    dog_df[ , 1]       # all rows, first column: name of all dogs

    dog_df[['weight']] # weight of all dogs, in order
    dog_df$age         # age of all dogs, in order
    dog_df$name[2]     # name of all dogs, then choose only element 2

# Can update/change values within a dataframe
    # Update one dog's age and weight, add a new column describing the color of each dog

    dog_df[1, 2] <- 34  # assign new value to row 1, col 2
    dog_df$age[1] <- 6  # assign new value to age[1]

    # create a new column using the $ operator, and assign values
    dog_df$color <- c('tan', 'grey', 'brown')

    dog_df  # inspect the updated data frame

# This is all in base R - it will always work, but is tedious... in next sections we will
# use tidyverse-style coding that have handfy functions that can be more elegant


# Functions
  # Objects = nouns, functions = verbs

  # Maybe we want to know the average temperature in Beaufort over the summer.
  # Create a vector to store the noon temperature (in Celsius) in Beaufort for three consecutive summer days:
    temp_c <- c(27, 29, 31)

  # Use mean() to calculate average temperature:
    ?mean
    mean(x = temp_c)

    # saving the mean using the assignment operator `<-`
    mean_temp_c <- mean(x = temp_c)


# Reading and working with data frames:
    # Typically bring in real data...
    ?read.csv() # shows lots of optional arguments - main one is what file we want

    # Go get a file: https://arcticdata.io/catalog/view/doi:10.18739/A25T3FZ8X
    # Download BGchem2008data.csv and save in data folder

    # Since we are working in an R Project, can read data using relative paths
    bg_chem_dat <- read.csv("data/BGchem2008data.csv")
    bg_chem_dat

    # Show how we could run that with or without explicit "file =" argument,
    # and how other optional arguments will show up by position, or explicitly calling them
    bg_chem_dat <- read.csv("data/BGchem2008data.csv", stringsAsFactors = FALSE)

    # What are some ways we can explore what this dataframe looks like?
    # Suggest head(), View(), clicking on it
    # Can look at some specific columns:
    head(bg_chem_dat$Date)
    mean_temp <- mean(bg_chem_dat$CTD_Temperature)


# Last few things:
    # 1. Logical expressions
    # examples using logical operators and expressions
    tree_h_m == 8.9
    tree_h_m >= 14
    tree_h_m != 11.3


    # 2. Checking and clearing environment
    objects()
    ls()
    rm(tree_h_m)
    rm(list = ls()) # or click broom
    # Save workspace image to .RData NEVER:
    # R wants to save your environment so when you open up all the objects are still there
    # This is tempting but bad because a) clutter and b) not reproducible
    # Your code should recreate everything you need:
   #  Tools > Global Options > General > NEVER

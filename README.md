# psy6422_project
Data Analysis Visualisation Project
### Purpose:
To use the data from [Melanopic irradiance defines the impact of evening display light on sleep latency, melatonin and alertness(Schöllhorn et al. 2023)](https://www.nature.com/articles/s42003-023-04598-4#citeas) relating to the effects of exposure to varying screen light intensities and wavelengths on the time taken to fall asleep. I used the raw data to visualise the findings from this, using [figure 2](https://www.nature.com/articles/s42003-023-04598-4/figures/2) as a guide. 
Full project can be found at
https://github.com/HollyHindson/psy6422_project.git
Reference: **Schöllhorn, I., Stefani, O., Lucas, R.J. et al. Melanopic irradiance defines the impact of evening display light on sleep latency, melatonin and alertness. Commun Biol 6, 228 (2023). https://doi.org/10.1038/s42003-023-04598-4**

**This Repository contains:**
- Figures
  * "sleep_plot.png"
- rawdata
  * "sleeplatency_rawdata.csv"
-RMarkdown
* code for markdown "sleeplatency_markdown.png"
* html webpage "sleeplatency_markdown.html"
* pdf page "sleeplatency_markdown.pdf"
-RMarkdown images
 * "HM.png"
 * "LM.png"
 * "moon_image.png"
 * "smartphone_image.png"
 * "tablet_image.png"
 * "pc_image.png"

## Instructions

To run this project, you will need the following **software and packages*
- **Software**: R
- **IDE**: RStudio
- **R Packages**: 'tidyverse', 'ggplot2', 'here', 'readr'

# Install R and RStudio:

- **Install R**

* Download and install R from the CRAN website.
* Follow the installation instructions specific to your operating system.

- **Install RStudio**

* Download RStudio Desktop from the RStudio download page.
* Install RStudio by following the provided instructions.
  
- **Install and load Required Packages**

Launch RStudio and create a new R script (or open the existing markdown file).

Copy and paste (or run) the following code into the script to check for and install the necessary packages:

# Install packages

install.packages("tidyverse")
install.packages("readr")
install.packages("ggplot2")
install.packages("here")

# Load libraries

library(tidyverse)
library(readr)
library(ggplot2)
library(here)


After pasting the above chunk of code, run the script

# Load data

data <- read_csv(here("data","sleeplatency_rawdata.csv")) 

# Check the data is present

head(data)

you should see the top few lines of data with headings:  'Participant', 'Intensity', 'Condition', 'sleeplatency'

# create the plot using the code script found within the Rmarkdown page

# generate and save the plot using the script in the Rmarkdown page


### Definitions:
- **N2** – Stage 2 Non-REM sleep.
- **Sleep Latency [min]** - The time in minutes taken from lights off for participants to fall asleep and enter the N2 sleep stage.
- **Light intensity condition** - 4 different light intensities: 
-	**Intensity 1** = ~27 cd/m2 (similar to moonlight)
-	**Intensity 2**= ~62 cd/ m2 (similar to smartphone screen)
-	**Intensity 3** = ~134 cd/ m2 (similar to tablet screen)
-	**Intensity 4** = ~284 cd/ m2 (similar to a large computer monitor)
- **HM** – High Melanopic condition with short wavelength light (blue light) suggested to suppress melatonin secretion.
- **LM** – Low Melanopic condition with longer wavelength light (yellow/orange light) suggested to prevent melatonin suppression seen with blue light. 



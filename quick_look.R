# Eno River tshirts. Shareable link here:
# https://docs.google.com/spreadsheets/d/1mt7-4N1Ki5okxE3gfsi23w_0e0zt4qFj9M1P5Adc7kY/edit?usp=sharing
library("googlesheets")
suppressPackageStartupMessages(library("dplyr"))

# Here are the Google Sheets in My Drive
my_sheets <- gs_ls()

# Registering the one I want
shirts <- gs_title("Eno River Shirts")

# Readig it into a tible
shirble <- shirts %>% 
  gs_read()

# What logos do we have here
shirble %>% 
  group_by(Logo) %>% 
  tally()

# I want a charcoal Firefly men's small. Make order:
shirble %>% 
  filter(Logo == 'Firefly' & 
           Type == 'Mens' & 
           Size == 'Small' & 
           Color == 'Charcoal') %>% 
  mutate(`# Desired` = 1) %>% 
  knitr::kable() %>% 
  print()

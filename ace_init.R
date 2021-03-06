# build a bot on your own ... like that:

manual_bot <- function(dat){
  price     <- tail(dat$price,1)
  lag_price <- tail(dat$price,2)[1]
  if(lag_price > price){
    return("sell")
  }
  if(lag_price < price){
    return("buy")
  }
    return("keep")
}

add_bot(manual_bot)


# the aim of the bot is to make money by buying and selling shares

# a bot will go through all timestamps of a day separate for each company
# the bot will get passed a data.frame called dat which contains the the history
# of prices for the current day as well as the history of decisions and effects 
# made and caused by the bot

# the following is provided by dat:

## external data

# dat$name
# dat$id
# dat$timestamp
# dat$price
# dat$ask_price
# dat$bid_price
# dat$price_last_day

## cycling data

# dat$i
# dat$I

## data generated by the bot\'s decisions

# dat$decision  
# dat$effect    
# dat$shares
# dat$money

# the data in dat is sorted by timestamp so that tail(dat,1) will give you the 
# current data and head(dat,1) will give you data for the first timestamp of the
# day

# a bot should accept dat as input and should return one of the following 
# strings: 
# "buy" - one share of a given company is sold
# "sell" - all shares of a given company are sold
# "keep" - nothing is bought, nothing is sold

# shares are always bought to the current bid_price and sold to the current
# ask_price

# at the last timestamp -- where tail(dat$i,1) == tail(dat$I,1) -- all shares 
# are sold no matter what the price will be

# the more money a bot has at the end of the day (for all stocks) the better

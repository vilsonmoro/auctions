/* Comprador English Auction: oferece exatamente um incremento acima do preço corrente */
+!request_bid(Product,Current)[source(Auctioneer)]
  : max_price(Max) & Current + 10 =< Max
  <- Bid=Current+10;
     .print("Posso ofertar ",Bid," (limite=",Max,").");
     .send(Auctioneer,tell,bid(Bid)).

+!request_bid(Product,Current)[source(Auctioneer)]
  : max_price(Max) & Current + 10 > Max
  <- .print("Passo: preço=",Current," limite=",Max);
     .send(Auctioneer,tell,pass).

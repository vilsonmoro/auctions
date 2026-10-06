/* Comprador Japanese Auction */
+!participate(Product,Price)[source(Auctioneer)]
  : max_price(Max) & Price =< Max
  <- .print(Price," - continuo no leilão (limite=",Max,").");
     .send(Auctioneer,tell,stay).

+!participate(Product,Price)[source(Auctioneer)]
  : max_price(Max) & Price > Max
  <- .print(Price," - saio do leilão (limite=",Max,").");
     .send(Auctioneer,tell,leave).

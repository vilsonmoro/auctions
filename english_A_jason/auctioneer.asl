/* English Auction - versão A: somente Jason */
initial_price(50). increment(10).
buyer(buyer1). buyer(buyer2). buyer(buyer3).
!start.

+!start
 <- initial_price(P); -+current_price(P); -+round(0); -+messages(0);
    .print("======================================");
    .print("        ENGLISH AUCTION - A");
    .print("======================================"); !round.

+!round : current_price(P) & round(R)
 <- R1=R+1; -+round(R1); -+responses(0); -+bids([]); .findall(B,buyer(B),Bs); .length(Bs,N); -+expected(N);
    .print("\n--- Rodada ",R1," | preço corrente=",P," ---");
    for(.member(B,Bs)){ .send(B,achieve,request_bid(notebook,P)); !inc_msg; }.

+bid(B,Value)[source(B)]
 <- bids(L); -+bids([[Value,B]|L]); .print(B," ofertou ",Value); !response.

+pass(B)[source(B)]
 <- .print(B," não pode superar o preço."); !response.

+!response : responses(R) & expected(E)
 <- R1=R+1; -+responses(R1); !inc_msg; if(R1>=E){!close_round}.

+!close_round : bids([])
 <- !finish.

+!close_round : bids(L)
 <- .sort(L,S); .reverse(S,Desc); .nth(0,Desc,[Best,W]);
    current_price(P);
    if(Best > P){ -+current_price(Best); -+leader(W); !round; } else { !finish; }.

+!finish
 <- current_price(P); round(R); messages(M);
    if(leader(W)){.print("\nVENCEDOR = ",W," | preço = ",P)} else {.print("\nSem lances válidos.")};
    .print("Métricas: rodadas=",R," mensagens=",M," preço_final=",P).

+!inc_msg : messages(M) <- M1=M+1; -+messages(M1).

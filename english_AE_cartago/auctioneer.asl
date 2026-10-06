/* English Auction - AE */
buyer(buyer1). buyer(buyer2). buyer(buyer3).
!start.
+!start <- focus(auction); .print("ENGLISH AUCTION - AE (Jason + CArtAgO)"); !round.

+!round
 <- nextRound; state(P,L); -+responses(0); -+bids([]); .findall(B,buyer(B),Bs); .length(Bs,N); -+expected(N);
    .print("Nova rodada: preço=",P," líder=",L);
    for(.member(B,Bs)){.send(B,achieve,request_bid(notebook,P));countMessage;}.

+bid(B,V)[source(B)] <- bids(L); -+bids([[V,B]|L]); !response.
+pass(B)[source(B)] <- !response.
+!response : responses(R)&expected(E) <- R1=R+1;-+responses(R1);countMessage;if(R1>=E){!close}.

+!close : bids([]) <- !finish.
+!close : bids(L)
 <- .sort(L,S); .reverse(S,D); .nth(0,D,[Best,W]); state(P,Old);
    if(Best>P){acceptBid(""+W,Best);!round}else{!finish}.

+!finish <- state(P,L); .print("FIM English AE: vencedor=",L," preço=",P); .print("Métricas em round/messages no inspector.").

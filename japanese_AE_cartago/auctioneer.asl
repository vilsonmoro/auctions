/* Japanese Auction - AE: protocolo nos agentes; estado compartilhado no artefato */
buyer(buyer1). buyer(buyer2). buyer(buyer3).
!start.

+!start
 <- focus(auction);
    register("buyer1"); register("buyer2"); register("buyer3");
    -+responses(0); -+expected(3);
    .print("JAPANESE AUCTION - AE (Jason + CArtAgO)");
    !round.

+!round
 <- nextRound;
    state(P,N,Names);
    if (N =< 1) { !finish; }
    else {
      -+responses(0); -+expected(N);
      .print("Rodada: preço=",P," ativos=",Names);
      .findall(B,buyer(B) & not left(B),Bs);
      for (.member(B,Bs)) { .send(B,achieve,participate(notebook,P)); countMessage; }
    }.

+stay(B)[source(B)] <- !response.
+leave(B)[source(B)] <- if(not left(B)){+left(B); leave(""+B);}; !response.

+!response : responses(R) & expected(E)
 <- R1=R+1; -+responses(R1); countMessage;
    if(R1>=E){ state(P,N,Names); if(N=<1){!finish}else{raisePrice; !round;} }.

+!finish
 <- state(P,N,Names);
    .print("FIM Japanese AE: vencedor/ativos=",Names," preço=",P);
    .print("Consulte propriedades observáveis round/messages no inspector.").

/* Japanese Auction - versão A: somente Jason */
product(notebook).
initial_price(50).
increment(10).
buyer(buyer1). buyer(buyer2). buyer(buyer3).

!start.

+!start
  <- .print("======================================");
     .print("       JAPANESE AUCTION - A");
     .print("======================================");
     initial_price(P);
     -+current_price(P);
     -+round(0);
     -+messages(0);
     !new_round.

+!new_round
  : current_price(P) & round(R)
  <- R1 = R + 1; -+round(R1);
     .findall(B, buyer(B) & not left(B), Active);
     .length(Active,N);
     if (N =< 1) { !finish; }
     else {
       -+expected(N); -+responses(0);
       .print("\n--- Rodada ",R1," - preço = ",P," ---");
       for (.member(B,Active)) {
          .send(B, achieve, participate(notebook,P));
          !inc_msg;
       }
     }.

+stay(B)[source(B)]
  <- .print("[LEILOEIRO] ",B," continua."); !response.

+leave(B)[source(B)]
  <- if (not left(B)) { +left(B); };
     .print("[LEILOEIRO] ",B," saiu definitivamente."); !response.

+!response
  : responses(R) & expected(E)
  <- R1=R+1; -+responses(R1); !inc_msg;
     if (R1 >= E) { !after_round; }.

+!after_round
  <- .findall(B, buyer(B) & not left(B), Active);
     .length(Active,N);
     if (N =< 1) { !finish; }
     else { current_price(P); increment(I); P1=P+I; -+current_price(P1); !new_round; }.

+!finish
  <- .findall(B, buyer(B) & not left(B), Active);
     .length(Active,N);
     current_price(P); round(R); messages(M);
     if (N == 1) { .nth(0,Active,W); .print("\nVENCEDOR = ",W," | preço = ",P); }
     else { .print("\nLeilão encerrado sem vencedor."); };
     .print("Métricas: rodadas=",R," mensagens=",M," preço_final=",P).

+!inc_msg : messages(M) <- M1=M+1; -+messages(M1).

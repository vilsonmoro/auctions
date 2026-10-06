package auction;
import cartago.*;

public class EnglishAuctionArtifact extends Artifact {
    private String product, leader="none";
    private int price, increment, round=0, messages=0;
    void init(String product,int initialPrice,int increment){
        this.product=product; this.price=initialPrice; this.increment=increment;
        defineObsProperty("price",price); defineObsProperty("leader",leader);
        defineObsProperty("round",round); defineObsProperty("messages",messages);
    }
    @OPERATION void nextRound(){round++;getObsProperty("round").updateValue(round);}
    @OPERATION void acceptBid(String buyer,int value){if(value>price){price=value;leader=buyer;getObsProperty("price").updateValue(price);getObsProperty("leader").updateValue(leader);}}
    @OPERATION void countMessage(){messages++;getObsProperty("messages").updateValue(messages);}
    @OPERATION void state(OpFeedbackParam<Integer> p,OpFeedbackParam<String> l){p.set(price);l.set(leader);}
}

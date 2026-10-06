package auction;
import cartago.*;
import java.util.*;

public class JapaneseAuctionArtifact extends Artifact {
    private String product;
    private int price, increment, round=0, messages=0;
    private final Set<String> active = new LinkedHashSet<>();

    void init(String product, int initialPrice, int increment) {
        this.product=product; this.price=initialPrice; this.increment=increment;
        defineObsProperty("product",product);
        defineObsProperty("price",price);
        defineObsProperty("round",round);
        defineObsProperty("messages",messages);
    }
    @OPERATION void register(String buyer){ active.add(buyer); }
    @OPERATION void leave(String buyer){ active.remove(buyer); }
    @OPERATION void nextRound(){ round++; getObsProperty("round").updateValue(round); }
    @OPERATION void raisePrice(){ price+=increment; getObsProperty("price").updateValue(price); }
    @OPERATION void countMessage(){ messages++; getObsProperty("messages").updateValue(messages); }
    @OPERATION void state(OpFeedbackParam<Integer> p, OpFeedbackParam<Integer> n, OpFeedbackParam<String> names){
        p.set(price); n.set(active.size()); names.set(String.join(",",active));
    }
}

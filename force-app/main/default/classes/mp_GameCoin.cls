public abstract class mp_GameCoin {
    
    public abstract Integer coinValue();
    
    public Integer absorbCoin(Integer existingPoint){
        return existingPoint + coinValue();
    }
}
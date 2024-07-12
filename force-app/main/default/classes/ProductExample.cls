public class ProductExample {
    Public DEcimal unitPrice {set;get;}
    Public mp_ProductInfo product {set;get;}
    Public ProductExample(){
        product =new mp_ProductInfo();
        Product.name='DellInspiron';
        Product.Price=1000;
        Product.quantity=5;
        product.Total=Product.Price*Product.Quantity;
    }

}
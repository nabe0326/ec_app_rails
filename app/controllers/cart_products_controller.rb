class CartProductsController < ApplicationController
    def index
        # カート内商品の一覧ページ表示
        # cart変数にログインしたユーザーにカートが存在するかしないか、しない場合は作成
        cart = current_user.cart || current_user.create_cart
        
        # インスタンス変数にログインしているユーザーのカート内商品を代入
        @products = current_user.cart.products
        # 合計金額をインスタンス変数に代入※pluckメソッドを使用しカートない商品の値段を配列に代入
        @total_price = @products.pluck(:price).sum()
        # 商品を名前ごとに取得し、その数を数える
        @product_group = @products.group(:name).count
    end
    def create
        # カートに商品を追加
        # cart変数にログインしたユーザーにカートが存在するかしないか、しない場合は作成
        cart = current_user.cart || current_user.create_cart
        # product変数に送られてきたIDパラメーターを代入 
        product = Product.find_by(id: params[:product_id])
        # createメソッドを使用し、カート内商品テーブルのproduct_idカラムに商品IDを追加
        cart.cart_products.create(product_id: product.id)
        # カートない商品一覧ページにリダイレクト
        redirect_to cart_products_path, notice: "カートに追加しました"
    end
    def destroy
        cart = current_user.cart 
        product = Product.find(params[:product_id]) 
        delete_product = cart.cart_products.find_by(product_id: product.id) 
        delete_product.destroy 
        redirect_to products_path, notice: "削除しました"
    end
end

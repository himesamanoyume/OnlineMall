$(document).ready(function(){

    $('#addButton').click(function(){
        location.href = "/view/createBook"
    })

    $('#submit').click(function(){
        var name = $('#name').val()
        var price = $('#price').val()
        var publisher = $('#publisher').val()
        var stock = $('#stock').val()
        var txt = $('#txt').val()

        name= name.trim()
        price=parseFloat(price).toFixed(2)
        publisher=publisher.trim()
        stock=parseInt(stock)
        txt=txt.trim()

        if(!name){
            alert('商品名不能为空')
            return
        }
        if(price <= 0){
            alert('价格必须为正数')
            return
        }

        $.post('/book/createBook',{
            name: name,
            price:price,
            publisher:publisher,
            stock:stock,
            txt:txt
        },function(res){
            if(res && res.bookId){
                alert('新增成功')
            }
        }).fail(function(res){
            alert(res.responseJSON.message)
        })

    })
})
